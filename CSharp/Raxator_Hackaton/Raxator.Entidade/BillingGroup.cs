using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    [Table("RX_BillingGroup")]
    public class BillingGroup
    {
        [Key]
        public int IdBillingGroup { get; set; }
        public int IdBillingStatus { get; set; }

        public int? IdMerchant { get; set; }
        public Merchant Merchant { get; set; }

        public string UniqueIdentifier { get; set; }
        public string GroupName { get; set; }

        public decimal Price { get; set; }
    };
}
