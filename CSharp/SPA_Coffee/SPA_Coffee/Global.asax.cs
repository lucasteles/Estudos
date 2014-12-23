using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using SPA_Coffee.Models;

namespace SPA_Coffee
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class WebApiApplication : System.Web.HttpApplication
    {

        public static volatile IList<Book> booksList;

        protected void Application_Start()
        {
            
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);


            booksList = new List<Book>() {
                new Book() {
                        id = 1,
                        name = "Guia do mochileiro das galáxias",
                        author = "Douglas Adams",
                        pages = 345
                    }
            };
        }
    }
}