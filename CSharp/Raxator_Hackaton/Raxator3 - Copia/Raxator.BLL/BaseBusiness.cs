using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Raxator.DAL;
using Raxator.DAL.Abstraction;

namespace Raxator.BLL
{
    public class BaseBusiness<TModel>
        where TModel : class, new()
    {
        private string nameOrConnectionString = string.Empty;
        private BaseRepository<TModel> _repository;

        public BaseBusiness()
        {
            nameOrConnectionString = "DefaultConnection";
            _repository = new BaseRepository<TModel>();
        }

        public void SetConnection(string nameOrConnectionString)
        {
            _repository.SetConnection(nameOrConnectionString);
        }

        public IList<TModel> SelectAll(
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            return _repository.SelectAll(navigationProperties);
        }

        public IList<TModel> Select(
            Expression<Func<TModel, bool>> where,
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            return _repository.Select(where, navigationProperties);
        }

        public TModel SelectSingle(
            Expression<Func<TModel, bool>> where,
            params Expression<Func<TModel, object>>[] navigationProperties
        )
        {
            return _repository.SelectSingle(where, navigationProperties);
        }

        public void Insert(params TModel[] items)
        {
            _repository.Insert(items);
        }

        public void Update(params TModel[] items)
        {
            _repository.Update(items);
        }

        public void Update(
            TModel item,
            Expression<Func<TModel, object>>[] properties
        )
        {
            _repository.Update(item, properties);
        }

        public void Delete(params TModel[] items)
        {
            _repository.Delete(items);
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
            return _repository.Count(where);
        }

        public long LongCount(Expression<Func<TModel, bool>> where)
        {
            return _repository.LongCount(where);
        }
    }
}
