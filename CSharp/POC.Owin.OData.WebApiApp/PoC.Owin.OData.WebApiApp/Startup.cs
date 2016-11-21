using Microsoft.Owin;
using Owin;
using PoC.Owin.OData.WebApiApp.Models;
using Study.Owin.OData.WebApiApp.Constants;
using System.Web.Http;
using System.Web.OData.Batch;
using System.Web.OData.Builder;
using System.Web.OData.Extensions;
using DryIoc.WebApi;
using DryIoc;


[assembly: OwinStartup(typeof(PoC.Owin.OData.WebApiApp.Startup))]
namespace PoC.Owin.OData.WebApiApp
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            var config = new HttpConfiguration();
            config.MapHttpAttributeRoutes();

            WebApiConfig.Register(config);
            var container = new DryIoc.Container();




          //  ReplaceControllersIOCLifeCircle(config, container);

            //dry
            container.Register<ILixo, Lixo>(Reuse.Transient, ifAlreadyRegistered: IfAlreadyRegistered.Replace);


            var modelBuilder = new ODataConventionModelBuilder(config);
            modelBuilder.EnableLowerCamelCase();
            config.EnableCaseInsensitive(true);

            modelBuilder.EntitySet<Person>("People");

            
            var server = new HttpServer(config);

            config.MapODataServiceRoute(
                ODataConstants.RouteName,
                ODataConstants.RoutePrefix,
                modelBuilder.GetEdmModel(),
                new DefaultODataBatchHandler(server)
            );
                       

            //app.UseDryIocOwinMiddleware(container);

            app
                .UseCors(Microsoft.Owin.Cors.CorsOptions.AllowAll)
                .UseWebApi(server)
                .UseDryIocWithTransientControllers(container,config)
                

            ;
            
            



        }


      



    }

    public interface ILixo 
    {
    }

    public class Lixo :ILixo
    {

    }

    public static class Extensions
    {

        public static IAppBuilder UseDryIocWithTransientControllers(this IAppBuilder app, Container container, HttpConfiguration config)
        {
            var controllerTypeResolver = config.Services.GetHttpControllerTypeResolver();
            var controllerTypes = controllerTypeResolver.GetControllerTypes(config.Services.GetAssembliesResolver());

                             
            container.RegisterMany(
                                controllerTypes,
                                Reuse.Transient,
                                ifAlreadyRegistered: IfAlreadyRegistered.Replace,
                                nonPublicServiceTypes: true,
                                setup: Setup.With(trackDisposableTransient: true)
                                );


            container.SetFilterProvider(config.Services);
            DryIocWebApi.InsertRegisterRequestMessageHandler(config);

            config.DependencyResolver = new DryIocDependencyResolver(container);
            return app;
        }
    }

}