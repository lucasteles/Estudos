using IOC.FW.Core.Abstraction.Model;
using System;
using System.ComponentModel.DataAnnotations.Schema;


namespace BCC.Canteen.Model
{
    [Table("SALEITEMS")]
    public class SaleItem : IBaseModel
    {
        public int Id { get; set; }

        public int IdSale { get; set; }
        [ForeignKey("IdSale")]
        public virtual Sale Sale { get; set; }

        public int IdProduct { get; set; }
        [ForeignKey("IdProduct")]
        public Product Item { get; set; }

        public int Amount { get; set; }

        public decimal Price { get; set; }

        public bool Activated { get; set; }

        public DateTime Created { get; set; }

        public DateTime? Updated { get; set; }
    }
}
