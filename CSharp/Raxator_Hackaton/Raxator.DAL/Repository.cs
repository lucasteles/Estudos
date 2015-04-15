using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Raxator.DAL.Abstraction;

namespace Raxator.DAL
{
    public class Repository<TModel>
        : DbContext
        where TModel : class, new()
    {
        public DbSet<TModel> DbObject { get; set; }
        public IQueryable<TModel> _dbQuery;

        public Repository(string nameOrConnectionString)
            : base(nameOrConnectionString)
        {
            System.Data.Entity.Database.SetInitializer<Repository<TModel>>(null);
            this._dbQuery = this.DbObject;
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
            this.Configuration.AutoDetectChangesEnabled = false;
            this.Database.CommandTimeout = 99999;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            TModel model = new TModel();
            if (model is IModelCreating)
            {
                ((IModelCreating)model).OnCreating(modelBuilder);
                base.OnModelCreating(modelBuilder);
            }
        }
    }
}
