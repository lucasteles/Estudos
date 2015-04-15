using Raxator.Entidade.Cadastro;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    [Table("RX_BillingGroup_Customer_Product")]
    public class BillingGroup_Customer_Product
    {
        [Key]
        public int IdBillingGoroupCustomerProduct { get; set; }
        
       
        public int IdProduct { get; set; }
        public Product Product { get; set; }

        
        public int IdBillingGroup { get; set; }
        public BillingGroup BillingGroup { get; set; }
        
        
        public int? IdUSer { get; set; }
        public Customer Customer { get; set; }

        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Count { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}
