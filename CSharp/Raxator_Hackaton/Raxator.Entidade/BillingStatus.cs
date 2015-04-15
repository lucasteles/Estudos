using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    [Table("RX_BillingStatus")]
    public class BillingStatus
    {
        [Key]
        public int IdBillingStatus { get; set; }
        public string Name { get; set; }
    };
}
