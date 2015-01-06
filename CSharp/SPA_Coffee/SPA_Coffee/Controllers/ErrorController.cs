using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SPA_Coffee.Controllers
{
    public class ErrorController : ApiController
    {
        [HttpGet, HttpPost, HttpPut, HttpDelete, HttpHead, HttpOptions, AcceptVerbs("PATCH"), AllowAnonymous]
        public HttpResponseMessage Handle404()
        {
            string[] parts = Request.RequestUri.OriginalString.Split(new[] { '?' }, StringSplitOptions.RemoveEmptyEntries);
            string parameters = parts[1].Replace("aspxerrorpath=", "");
            var response = Request.CreateResponse(HttpStatusCode.Redirect);
            response.Headers.Location = new Uri(parts[0].Replace("Error", "") + string.Format("#{0}", parameters));
            return response;
        }
    }
}
