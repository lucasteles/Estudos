using PoC.Owin.OData.WebApiApp.DataSource;
using PoC.Owin.OData.WebApiApp.Models;
using Study.Owin.OData.WebApiApp.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.OData;

namespace PoC.Owin.OData.WebApiApp.Controllers
{
    public class TripsController : ODataController, IODataModel<Trip>
    {
        public IQueryable<Trip> Get()
        {
            return DataSources.Instance
                .Trips
                .AsQueryable();
        }
    }
}