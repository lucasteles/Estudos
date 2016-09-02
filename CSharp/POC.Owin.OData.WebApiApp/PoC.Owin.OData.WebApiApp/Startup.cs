using Microsoft.Owin;
using Owin;
using System.Net.Http.Formatting;
using System.Web.Http;

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
            ODataConfig.Register(config);

            app
                .UseWebApi(config)
                .UseCors(Microsoft.Owin.Cors.CorsOptions.AllowAll);
        }
    }
}