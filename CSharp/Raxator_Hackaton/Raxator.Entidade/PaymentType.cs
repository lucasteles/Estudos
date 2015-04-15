using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    [Table("RX_PaymentType")]
    public class PaymentType
    {
        [Key]
        public int IdPaymentType { get; set; }
        public string Name { get; set; }
    };
}
