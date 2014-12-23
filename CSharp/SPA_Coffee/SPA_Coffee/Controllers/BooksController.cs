using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SPA_Coffee.Models;

namespace SPA_Coffee.Controllers
{
    public class BooksController : ApiController
    {
        private readonly IList<Book> _context;

        public BooksController()
        {
            _context = WebApiApplication.booksList;

          
        }


        // GET api/<controller>
        public IEnumerable<Book> Get()
        {
            return this._context;
        }


        // GET api/<controller>/id
        public Book Get(int id)
        {
            return this._context.FirstOrDefault(e => e.id == id);
        }


        // POST api/<controller>
        public void Post([FromBody]Book book)
        {
            book.id = _context.Count == 0 ? 1 : _context.Max(u => (int)u.id) + 1;

            this._context.Add(book);
        }

        // PUT api/<controller>/id
        public void Put(int id, [FromBody]Book book)
        {
            if (this._context.Count > 0)
            {
                
                var index = this
                            ._context
                            .ToList()
                            .FindIndex(p => p.id == id);

                if (index > -1)
                    this._context[index] = book;
                
            }
        }

        // DELETE api/<controller>/id
        public void Delete(int id)
        {
            if (this._context.Count > 0)
            {
                var index = this
                             ._context
                             .ToList()
                             .FindIndex(p => p.id == id);

                if (index > -1)
                    this._context.RemoveAt(index);
            }
        }

    }
}
