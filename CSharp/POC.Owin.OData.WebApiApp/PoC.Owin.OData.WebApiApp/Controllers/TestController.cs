using PoC.Owin.OData.WebApiApp.DataSource;
using PoC.Owin.OData.WebApiApp.Models;
using System.Linq;
using System.Net;
using System.Web.Http;
using System.Web.OData;

namespace PoC.Owin.OData.WebApiApp.Controllers
{
    public class TestController : ApiController
    {
        [EnableQuery]
        public IQueryable<Person> Get()
        {
            return DataSources.Instance
                .People
                .AsQueryable();
        }
    }
}