using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BCC.Canteen.Model;
using IOC.FW.Core.Abstraction.Business;
using System.Collections;
using BCC.Canteen.Validation;

namespace BCC.Canteen.Api.Controllers
{
    public class StoreController : ApiController
    {
        private readonly IBaseBusiness<Store> storeBusiness;

        public StoreController(IBaseBusiness<Store> storeBusiness)
        {
            this.storeBusiness = storeBusiness;
        }

        // GET: api/User
        public IEnumerable<Store> Get()
        {
            return storeBusiness.Select(e => e.Activated);

        }

        // GET: api/User/5
        public Store Get(int id)
        {
            return storeBusiness.SelectSingle(e => e.Id == id);
        }

        // POST: api/User
        public string Post([FromBody]Store store)
        {
            var ret = string.Empty;

            var result = (new StoreValidator()).Validate(store);
            if (store != null && result.IsValid)
                storeBusiness.Insert(store);
            else
                ret = String.Join("<br>", result.Errors);

            return ret;
        }

        // PUT: api/User/5
        public void Put([FromBody]Store store)
        {
            var validate = storeBusiness.SelectSingle(e => e.Id == store.Id);

            if (validate != null)
                storeBusiness.Update(validate);

        }

        // DELETE: api/User/5
        public void Delete(int id)
        {
            var validate = storeBusiness.SelectSingle(e => e.Id == id);
            if (validate != null)
                storeBusiness.Delete(validate);
        }
    }
}
