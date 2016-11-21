using Queries.Core.Domain;
using Queries.Persistence.EntityConfigurations;
using System.Data.Entity;

namespace Queries.Persistence
{
    public class PlutoContext : DbContext
    {
        public PlutoContext()
            : base("name=PlutoContext")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }

        
        
        
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

            

            modelBuilder.Configurations.Add(new CourseConfiguration());
        }
    }
}
