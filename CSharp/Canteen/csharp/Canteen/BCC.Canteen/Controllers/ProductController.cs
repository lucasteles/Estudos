using System;
using System.Collections.Generic;
using System.Web.Http;
using BCC.Canteen.Model;
using IOC.FW.Core.Abstraction.Business;
using BCC.Canteen.Validation;

namespace BCC.Canteen.Api.Controllers
{
    public class ProductController : ApiController
    {
        private readonly IBaseBusiness<Product> productBusiness;

        public ProductController(IBaseBusiness<Product> productBusiness)
        {
            this.productBusiness = productBusiness;
        }

        // GET: api/User
        public IEnumerable<Product> Get(int idloja)
        {
            return productBusiness.Select(e => e.IdStore == idloja && e.Activated);

        }

        /*
        // GET: api/User/5
        public Product Get(int id)
        {
            return productBusiness.SelectSingle(e => e.Id == id);
        }
        */
        // POST: api/User
        public string Post([FromBody]Product product)
        {
            var ret = string.Empty;

            var result = (new ProductValidator()).Validate(product);
            if (product != null && result.IsValid)
                productBusiness.Insert(product);
            else
                ret = String.Join("<br>", result.Errors);

            return ret;
        }

        // PUT: api/User/5
        public void Put([FromBody]Product product)
        {
            var validate = productBusiness.SelectSingle(e => e.Id == product.Id);

            if (validate != null)
                productBusiness.Update(validate);

        }

        // DELETE: api/User/5
        public void Delete(int id)
        {
            var validate = productBusiness.SelectSingle(e => e.Id == id);
            if (validate != null)
                productBusiness.Delete(validate);
        }
    }
}
