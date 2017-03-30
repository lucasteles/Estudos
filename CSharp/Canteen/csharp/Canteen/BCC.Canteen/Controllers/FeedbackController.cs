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
    public class FeedbackController : ApiController
    {
        private readonly IBaseBusiness<Feedback> feedbackBusiness;

        public FeedbackController(IBaseBusiness<Feedback> feedbackBusiness)
        {
            this.feedbackBusiness = feedbackBusiness;
        }

        // GET: api/User
        public IEnumerable<Feedback> Get()
        {
            return feedbackBusiness.Select(e => e.Activated);

        }

        // GET: api/User/5
        public Feedback Get(int id)
        {
            return feedbackBusiness.SelectSingle(e => e.Id == id);
        }

        // POST: api/User
        public string Post([FromBody]Feedback feedback)
        {
            var ret = string.Empty;

            var result = (new FeedbackValidator()).Validate(feedback);
            if (feedback != null && result.IsValid)
                feedbackBusiness.Insert(feedback);
            else
                ret = "Error:" + String.Join("<br>", result.Errors);

            return ret;
        }

        // PUT: api/User/5
        public void Put([FromBody]Feedback feedback)
        {
            var validate = feedbackBusiness.SelectSingle(e => e.Id == feedback.Id);

            if (validate != null)
                feedbackBusiness.Update(validate);

        }

        // DELETE: api/User/5
        public void Delete(int id)
        {
            var validate = feedbackBusiness.SelectSingle(e => e.Id == id);
            if (validate != null)
                feedbackBusiness.Delete(validate);
        }
    }
}
