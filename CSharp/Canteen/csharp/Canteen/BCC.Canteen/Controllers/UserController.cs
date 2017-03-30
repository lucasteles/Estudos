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
    public class UserController : ApiController
    {
        private readonly IBaseBusiness<User> userBusiness;

        public UserController(IBaseBusiness<User> userBusiness)
        {
            this.userBusiness = userBusiness;
        }

        // GET: api/User
        public IEnumerable<User> Get()
        {
           return userBusiness.Select(e=>e.Activated);
                      
        }

        // GET: api/User/5
        public User Get(int id)
        {
            return userBusiness.SelectSingle(e=>e.Id==id);
        }

        // POST: api/User
        public string Post([FromBody]User user)
        {
            var ret = string.Empty;

            var result = (new UserValidator()).Validate(user);
            if (user != null && result.IsValid)
                userBusiness.Insert(user);
            else
                ret = String.Join("<br>", result.Errors);

            return ret;
        }

        // PUT: api/User/5
        public void Put([FromBody]User user)
        {
            var validate = userBusiness.SelectSingle(e => e.Id == user.Id);

            if (validate != null)
                userBusiness.Update(validate);

        }

        // DELETE: api/User/5
        public void Delete(int id)
        {
            var validate = userBusiness.SelectSingle(e => e.Id == id);
            if (validate != null)
                userBusiness.Delete(validate);
        }
    }
}
