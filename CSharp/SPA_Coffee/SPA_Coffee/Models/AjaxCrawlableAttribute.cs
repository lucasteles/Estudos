using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using SPA_Coffee.Controllers;

namespace SPA_Coffee.Models
{
    public class AjaxCrawlableAttribute : ActionFilterAttribute
    {
        private const string Fragment = "_escaped_fragment_";

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            
            var request = filterContext.RequestContext.HttpContext.Request;

            if (request.QueryString[Fragment] != null)
            {
                var url = request.Url.ToString().Replace("?_escaped_fragment_=", "#");

                filterContext.Result = (new SnapshotController()).returnHTML(url);
            }
        }
    }
}