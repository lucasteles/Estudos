using PoC.Owin.OData.WebApiApp.Models;
using Study.Owin.OData.WebApiApp.Constants;
using Study.Owin.OData.WebApiApp.OData.Builder;
using System.Web.Http;
using System.Web.OData.Batch;
using System.Web.OData.Builder;
using System.Web.OData.Extensions;

namespace PoC.Owin.OData.WebApiApp
{
    public static class ODataConfig
    {
        public static void Register(HttpConfiguration config)
        {
            var modelBuilder = new ODataConventionModelBuilder(config);
            //modelBuilder.ResolverEdmModel();
            //modelBuilder.RegisterOdataEntities();
            modelBuilder.EnableLowerCamelCase();
            
            config.EnableCaseInsensitive(true);

            modelBuilder.EntitySet<Person>("People");


            modelBuilder.Namespace = "f";
            modelBuilder.EntityType<Person>()
                .Action("Acao")
                .Parameter<int>("Rating");


            modelBuilder.EntityType<Person>()
                .Function("Funcao")
                .Returns<double>()
                
                ;
            


            config.MapODataServiceRoute(
                ODataConstants.RouteName,
                ODataConstants.RoutePrefix,
                modelBuilder.GetEdmModel(),
                new DefaultODataBatchHandler(GlobalConfiguration.DefaultServer)
            );
        }
    }
}