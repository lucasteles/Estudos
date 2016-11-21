using PoC.Owin.OData.WebApiApp.DataSource;
using PoC.Owin.OData.WebApiApp.Models;
using PoC.Owin.OData.WebApiApp.OData.Builder.Attributes;
using Study.Owin.OData.WebApiApp.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Http;
using System.Web.OData;
using System.Web.OData.Extensions;
using System.Web.OData.Query;
using System.Web.OData.Routing;

namespace PoC.Owin.OData.WebApiApp.Controllers
{
    public class PeopleController : ODataController, IODataModel<Person>
    {

        public PeopleController(ILixo lixo)
         {

        }

        [EnableQuery]
        public IQueryable<Person> Get()
        {
            return DataSources.Instance
                .People
                .AsQueryable();
        }

        public PageResult<Person> Get(
            ODataQueryOptions<Person> options,
            [FromODataUri] int offset,
            [FromODataUri] int page = 1
        )
        {
            var skip = 0;
            if (page > 1)
                skip = (offset * (page - 1));

            var itemsApplied = options.ApplyTo(
                DataSources.Instance
                    .People
                    .AsQueryable(),
                AllowedQueryOptions.Top | AllowedQueryOptions.Skip
            ) as IQueryable<Person>;

            Uri nextLink = null;
            var numPages = Math.Ceiling(
                (decimal)DataSources.Instance.People.Count / offset
            );

            if (numPages > 0
                && page < numPages
            )
                nextLink = new Uri(
                    $"{Request.RequestUri.Scheme}://{Request.RequestUri.Authority}{Request.RequestUri.AbsolutePath}?offset={offset}&page={page + 1}"
                );

            itemsApplied = itemsApplied.Skip(skip).Take(offset);

            var items = itemsApplied as IEnumerable<Person>;
            var itemsPaginated = new PageResult<Person>(
                items,
                nextLink,
                DataSources.Instance.People.Count
            );

            return itemsPaginated;
        }

        [EnableQuery]
        public SingleResult<Person> Get([FromODataUri] int key)
        {
            var item = DataSources.Instance
                .People
                .Where(
                    p => p.Id.Equals(key)
                ).AsQueryable();

            return SingleResult.Create(item);
        }


        [EnableQuery]
        public string GetName([FromODataUri] int key)
        {
            var item = DataSources.Instance
                .People
                .Where(
                    p => p.Id.Equals(key)
                ).AsQueryable();

            return item.FirstOrDefault().Name;
        }

        [EnableQuery]
        public IQueryable<Trip> GetTrips([FromODataUri] int key)
        {
            var items = DataSources.Instance
                .People
                .Where(
                    p => p.Id.Equals(key)
                ).SelectMany(
                    p => p.Trips
                ).AsQueryable();

            return items;
        }


        [ODataMethod(ReturnType = typeof(int))]
        public IHttpActionResult Acao([FromODataUri] int key, ODataActionParameters parameters)
        {

            int rating = (int)parameters["Rating"];

            return Ok();
        }

        [HttpGet]
        public IHttpActionResult Funcao(int key)
        {

            var items = DataSources.Instance
              .People.Max(e => e.Id);
             

            return Ok(items);
        }

       public IHttpActionResult Post(Person model)
        {
            return Created(model);
        }

        public IHttpActionResult Patch([FromODataUri] int key, [FromBody] Delta<Person> model)
        {
            return Updated(model);
        }

        public IHttpActionResult Put([FromODataUri] int key, [FromBody] Person model)
        {
            return Updated(model);
        }

        public IHttpActionResult Delete([FromODataUri] int key)
        {
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}