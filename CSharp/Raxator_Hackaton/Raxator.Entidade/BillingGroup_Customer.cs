using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Raxator.Entidade.Cadastro;

namespace Raxator.Entidade
{
    [Table("RX_BillingGroup_Customer")]
    public class BillingGroup_Customer
    {
        [Key()]
        [Column(Order=1)]
        public int IdBillingGroup { get; set; }
        public BillingGroup BillingGroup { get; set; }

        [Key()]
        [Column(Order = 2)]
        public int IdUser { get; set; }
        public Customer User { get; set; }

        public int IdPaymentType { get; set; }

        public decimal IndividualPrice { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    };
}
