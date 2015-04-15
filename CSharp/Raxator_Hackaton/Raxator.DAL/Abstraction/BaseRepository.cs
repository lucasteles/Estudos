using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.DAL.Abstraction
{
    public class BaseRepository<TModel>
        where TModel : class, new()
    {
        private string nameOrConnectionString = string.Empty;

        public BaseRepository()
        {
            nameOrConnectionString = "DefaultConnection";
        }

        public void SetConnection(string nameOrConnectionString)
        {
            if (string.IsNullOrEmpty(nameOrConnectionString))
            {
                nameOrConnectionString =
                    (ConfigurationManager.ConnectionStrings["DefaultConnection"]).ConnectionString;
            }

            this.nameOrConnectionString = nameOrConnectionString;
        }

        private IQueryable<TModel> IncludeReference(
            DbSet<TModel> dbSet,
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            IQueryable<TModel> query = dbSet;

            foreach (Expression<Func<TModel, object>> navigationProperty in navigationProperties)
                query = query.Include<TModel, object>(navigationProperty);

            return query;
        }

        public IList<TModel> SelectAll(
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            List<TModel> list;

            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                context._dbQuery = IncludeReference(context.DbObject, navigationProperties);

                list = context._dbQuery
                    .AsNoTracking()
                    .ToList<TModel>();
            }
            return list;
        }

        public IList<TModel> Select(
            Expression<Func<TModel, bool>> where,
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            List<TModel> list;

            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                context._dbQuery = IncludeReference(context.DbObject, navigationProperties);

                list = context._dbQuery
                   .AsNoTracking()
                   .Where(where)
                   .ToList<TModel>();
            }

            return list;
        }

        public TModel SelectSingle(
            Expression<Func<TModel, bool>> where,
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            TModel item = null;

            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                context._dbQuery = IncludeReference(context.DbObject, navigationProperties);

                item = context._dbQuery
                    .AsNoTracking()
                    .FirstOrDefault(where);
            }

            return item;
        }

        public void Insert(params TModel[] items)
        {
            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                foreach (TModel item in items)
                {
                    context.Entry(item).State = EntityState.Added;
                }
                context.SaveChanges();
            }
        }

        public void Update(params TModel[] items)
        {
            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                foreach (TModel item in items)
                {
                    var modelFound = context
                        .Set<TModel>()
                        .Local
                        .SingleOrDefault(
                            e => e.Equals(item)
                        );

                    if (modelFound != null)
                    {
                        var attachedEntry = context.Entry(modelFound);
                        attachedEntry.CurrentValues.SetValues(item);
                    }
                    else
                    {
                        context.Entry<TModel>(item).State = EntityState.Modified;
                    }
                }

                context.SaveChanges();
            }
        }

        public void Update(
            TModel item,
            Expression<Func<TModel, object>>[] properties
        )
        {
            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                var modelFound = context
                    .Set<TModel>()
                    .Local
                    .SingleOrDefault(
                        e => e.Equals(item)
                    );

                if (modelFound != null)
                {
                    var attachedEntry = context.Entry(modelFound);
                    attachedEntry.CurrentValues.SetValues(item);
                }
                else
                {
                    context.DbObject.Attach(item);
                }

                foreach (var property in properties)
                {
                    context.Entry<TModel>(item).Property(property).IsModified = true;
                }

                context.SaveChanges();
            }
        }

        public void Delete(params TModel[] items)
        {
            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                foreach (TModel item in items)
                {

                    context.Entry(item).State = EntityState.Deleted;
                }

                context.SaveChanges();
            }
        }

        public IList<TModel> ExecuteQuery(
            string sql,
            Dictionary<string, object> parameters = null,
            CommandType cmdType = CommandType.Text
        )
        {
            List<TModel> list = null;

            if (!String.IsNullOrEmpty(sql))
            {
                using (var context = new Repository<TModel>(this.nameOrConnectionString))
                {
                    var conn = this.OpenConnection(context);
                    var comm = this.CreateCommand(conn, sql, cmdType);
                    this.SetParameter(comm, parameters);

                    var reader = comm.ExecuteReader();

                    ORM or = new ORM();
                    var props = or.GetProperties(typeof(TModel));
                    list = or.GetModel<TModel>(reader, props);
                }
            }

            return list;
        }

        public IList<TModel> ExecuteQuery(
            string sql,
            List<Tuple<ParameterDirection, string, object>> parametersWithDirection,
            CommandType cmdType
        )
        {
            List<TModel> list = null;

            if (!String.IsNullOrEmpty(sql))
            {
                using (var context = new Repository<TModel>(this.nameOrConnectionString))
                {
                    var conn = this.OpenConnection(context);
                    var comm = this.CreateCommand(conn, sql, cmdType);
                    this.SetParameter(comm, parametersWithDirection);

                    var reader = comm.ExecuteReader();

                    ORM or = new ORM();
                    var props = or.GetProperties(typeof(TModel));
                    list = or.GetModel<TModel>(reader, props);

                    foreach (DbParameter itemParam in comm.Parameters)
                    {
                        if (itemParam.Direction == ParameterDirection.InputOutput ||
                            itemParam.Direction == ParameterDirection.Output ||
                            itemParam.Direction == ParameterDirection.ReturnValue)
                        {
                            var indexFound = parametersWithDirection.FindIndex(
                                p => p.Item2 == itemParam.ParameterName
                            );

                            if (indexFound >= 0)
                            {
                                parametersWithDirection[indexFound] = new Tuple<ParameterDirection, string, object>(
                                    itemParam.Direction,
                                    itemParam.ParameterName,
                                    itemParam.Value
                                );
                            }
                        }
                    }
                }
            }

            return list;
        }

        public object ExecuteScalar(
            string sql,
            Dictionary<string, object> parameters = null,
            CommandType cmdType = CommandType.Text
        )
        {
            object result = null;

            if (!String.IsNullOrEmpty(sql))
            {
                using (var context = new Repository<TModel>(this.nameOrConnectionString))
                {
                    var conn = this.OpenConnection(context);
                    var comm = this.CreateCommand(conn, sql, cmdType);
                    this.SetParameter(comm, parameters);

                    result = comm.ExecuteScalar();
                }
            }

            return result;
        }


        public TModel Exec(Func<DbSet<TModel>, TModel> lambda)
        {
            TModel model = null;
            if (lambda != null)
            {
                using (var context = new Repository<TModel>(this.nameOrConnectionString))
                {
                    model = lambda(context.DbObject);
                }
            }
            return model;
        }

        public TGenericModel Exec<TGenericModel>(Func<DbSet<TGenericModel>, TGenericModel> lambda)
            where TGenericModel : class, new()
        {
            TGenericModel model = null;
            if (lambda != null)
            {
                using (var context = new Repository<TGenericModel>(this.nameOrConnectionString))
                {
                    model = lambda(context.DbObject);
                }
            }
            return model;
        }

        public TGenericModeOut Exec<TGenericModel, TGenericModeOut>(Func<DbSet<TGenericModel>, TGenericModeOut> lambda)
            where TGenericModel : class, new()
        {
            TGenericModeOut model = default(TGenericModeOut);
            if (lambda != null)
            {
                using (var context = new Repository<TGenericModel>(this.nameOrConnectionString))
                {
                    model = lambda(context.DbObject);
                }
            }
            return model;
        }

        private DbConnection OpenConnection(Repository<TModel> context)
        {
            DbConnection conn = null;

            if (context != null
                && context.Database != null
                && context.Database.Connection != null
                && context.Database.Connection is DbConnection)
            {
                conn = ((DbConnection)context.Database.Connection);
                conn.Open();
            }

            return conn;
        }

        private DbCommand CreateCommand(
            DbConnection conn,
            string sql,
            CommandType cmdType = CommandType.Text
        )
        {
            DbCommand comm = null;

            if (conn != null
                && conn.State == ConnectionState.Open
                && !string.IsNullOrEmpty(sql))
            {
                comm = conn.CreateCommand();
                comm.CommandText = sql;
                comm.CommandType = cmdType;
                comm.CommandTimeout = 99999;
            }

            return comm;
        }

        private void SetParameter(
            DbCommand comm,
            Dictionary<string, object> parameters = null
        )
        {
            if (comm != null
                && parameters != null
                && parameters.Count > 0)
            {
                DbParameter param = null;

                foreach (var item in parameters)
                {
                    param = comm.CreateParameter();
                    param.ParameterName = item.Key;
                    param.Value = item.Value;
                    comm.Parameters.Add(param);
                }
            }
        }

        private void SetParameter(
            DbCommand comm,
            List<Tuple<ParameterDirection, string, object>> parameters = null
        )
        {
            if (comm != null
                && parameters != null
                && parameters.Count > 0)
            {
                DbParameter param = null;

                foreach (var item in parameters)
                {
                    param = comm.CreateParameter();
                    param.Direction = item.Item1;
                    param.ParameterName = item.Item2;
                    param.Value = item.Item3;
                    comm.Parameters.Add(param);
                }
            }
        }

        public TModel Model()
        {
            return new TModel();
        }

        public List<TModel> List()
        {
            return new List<TModel>();
        }

        public int Count()
        {
            return this.Count(m => true);
        }

        public int Count(Expression<Func<TModel, bool>> where)
        {
            int count;
            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                count = this.Count(where, context);
            }

            return count;
        }

        private int Count(
            Expression<Func<TModel, bool>> where,
            Repository<TModel> context
        )
        {
            return context._dbQuery
                   .AsNoTracking()
                   .Count(where);
        }

        public long LongCount()
        {
            return this.LongCount(m => true);
        }

        public long LongCount(Expression<Func<TModel, bool>> where)
        {
            long count;
            using (var context = new Repository<TModel>(this.nameOrConnectionString))
            {
                count = this.LongCount(where, context);
            }

            return count;
        }

        private long LongCount(
            Expression<Func<TModel, bool>> where,
            Repository<TModel> context
        )
        {
            return context._dbQuery
                   .AsNoTracking()
                   .LongCount(where);
        }
    }
}
