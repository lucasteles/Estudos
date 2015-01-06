using System.Web;
using System.Web.Mvc;
using SPA_Coffee.Models;

namespace SPA_Coffee
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new AjaxCrawlableAttribute());
        }
    }
}