using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq.Expressions;

namespace Queries.Core.Repositories
{
    public interface IRepository<TEntity> where TEntity : class
    {
        DbSet<TEntity> entity { get; set; }
        TEntity Get(int id);
        IEnumerable<TEntity> GetAll();
        IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate);

        // This method was not in the videos, but I thought it would be useful to add.
        TEntity SingleOrDefault(Expression<Func<TEntity, bool>> predicate);

        void Add(TEntity entity);
        void AddRange(IEnumerable<TEntity> entities);
        
        void Remove(TEntity entity);
        void RemoveRange(IEnumerable<TEntity> entities);
    }
}