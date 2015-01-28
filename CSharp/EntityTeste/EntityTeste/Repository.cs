using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Configuration;
using EntityTeste.Models;

namespace EntityTeste
{
    public class Repository<T> : DbContext, IBaseDAO<T> where T : class, new()
    {
     
        public DbSet<T> DbObject { get; set; }
        

        public IQueryable<T> dbQuery {get;set;}

       
        public Repository()
            : base( ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString )
        {
            System.Data.Entity.Database.SetInitializer<Repository<T>>(null);
            this.dbQuery = this.DbObject;
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
            this.Configuration.AutoDetectChangesEnabled = false;
            this.Database.CommandTimeout = 99999;
           
        }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
                       
            base.OnModelCreating(modelBuilder);
            
        }



    }
}
