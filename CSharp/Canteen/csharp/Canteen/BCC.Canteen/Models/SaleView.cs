using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCC.Canteen.Model;

namespace BCC.Canteen.Web.Models
{
    public class SaleView
    {
        public int Id { get; set; }
        public int IdUser { get; set; }
        public bool Paid { get; set; }
        public bool Delivered { get; set; }
        public string Ticket { get; set; }
        public string StoreName { get; set; }
        public decimal Total { get; set; }
    }
}