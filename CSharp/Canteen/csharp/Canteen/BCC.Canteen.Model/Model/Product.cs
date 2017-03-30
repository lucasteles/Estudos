using IOC.FW.Core.Abstraction.Model;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCC.Canteen.Model
{
    [Table("PRODUCTS")]
    public class Product : IBaseModel
    {
        public int Id { get; set; }

        public int IdStore { get; set; }
        [ForeignKey("IdStore")]
        public virtual Store Store { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Picture { get; set; }

        public decimal Price { get; set; }

        public bool Activated { get; set; }

        public DateTime Created { get; set; }

        public DateTime? Updated { get; set; }
    }
}
