using IOC.FW.Core.Abstraction.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCC.Canteen.Model
{
    [Table("SALES")]
    public class Sale : IBaseModel
    {
        public int Id { get; set; }

        public int IdUser { get; set; }
        [ForeignKey("IdUser")]
        public User SaleUser { get; set; }

        public int IdStore { get; set; }
        [ForeignKey("IdStore")]
        public Store SaleStore { get; set; }

        public bool Paid { get; set; }
        
        public bool Delivered { get; set; }

        public string Ticket { get; set; }

        public virtual List<SaleItem> Items { get; set; }

        public bool Activated { get; set; }

        public DateTime Created { get; set; }

        public DateTime? Updated { get; set; }
    }
}
