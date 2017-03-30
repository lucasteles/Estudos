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
using System.Net.Http.Formatting;
using System.Web.Script.Serialization;
using BCC.Canteen.Web.Models;

namespace BCC.Canteen.Api.Controllers
{
    public class SaleController : ApiController
    {
        private readonly IBaseBusiness<Sale> saleBusiness;
        private readonly IBaseBusiness<Product> productBusiness;

        public SaleController(IBaseBusiness<Sale> saleBusiness, IBaseBusiness<Product> productBusiness)
        {
            this.saleBusiness = saleBusiness;
            this.productBusiness = productBusiness;
        }

        // GET: api/User
        public IEnumerable<SaleView> Get(int userid)
        {

            
            var selev = saleBusiness.Select(e => e.Activated && e.IdUser == userid, i => i.SaleStore, e => e.Items)
                        .Select(sale => new SaleView {
                            Id = sale.Id,
                            IdUser = sale.IdUser,
                            Paid = sale.Paid,
                            Ticket = sale.Ticket,
                            Delivered = sale.Delivered,
                            StoreName = sale.SaleStore.Name,
                            Total = sale.Items.Sum(i => i.Price * i.Amount)
                            }
                        
                        );

            return selev;

            
                      
        }

        // GET: api/User/5
        public SaleView Get(int id, int userid)
        {
            SaleView salev = new SaleView();
            Sale sale = saleBusiness.SelectSingle(e => e.Id == id && e.IdUser == userid,i=>i.SaleStore,e=>e.Items);

            salev.Id = sale.Id;
            salev.IdUser = sale.IdUser;
            salev.Paid = sale.Paid;
            salev.Ticket = sale.Ticket;
            salev.Delivered = sale.Delivered;
            salev.StoreName = sale.SaleStore.Name;
            salev.Total = sale.Items.Sum(i => i.Price * i.Amount);

            return salev;
        }

        // POST: api/User
        //public string Post([FromBody]int userid, [FromBody]List<SaleItem> itens)
        public string Post(FormDataCollection Data)
        {
            var ret = string.Empty;

            JavaScriptSerializer ser = new JavaScriptSerializer();
            List<SaleItem> itens = ser.Deserialize<List<SaleItem>>(Data.Get("itens"));

            int IdStore = 0;

            foreach (SaleItem item in itens)
            {
               var  aux = productBusiness.SelectSingle(e => e.Id == item.IdProduct);
                item.Item = null; //
                item.Price = aux.Price;
                IdStore = aux.IdStore;
            }

            Sale vend = new Sale();
            vend.IdUser = Convert.ToInt32(Data.Get("userid"));
            vend.Items = itens;
            vend.IdStore = IdStore;
            vend.Paid = true;
            vend.Delivered = false;
            vend.Ticket = RandomString(20);

            var result = (new SaleValidator()).Validate(vend);
            if (vend != null && result.IsValid)
                saleBusiness.Insert(vend);
            else
                ret = String.Join("<br>", result.Errors);

            return ret;
        }

        // PUT: api/User/5
        public void Put([FromBody]User sale)
        {
            var validate = saleBusiness.SelectSingle(e => e.Id == sale.Id);

            if (validate != null)
                saleBusiness.Update(validate);
        }

        // DELETE: api/User/5
        public void Delete(int id)
        {
            var validate = saleBusiness.SelectSingle(e => e.Id == id);
            if (validate != null)
                saleBusiness.Delete(validate);
        }

        string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
