using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    [Table("RX_Merchant")]
    public class Merchant
    {
        [Key]
        public int IdMerchant { get; set; }

        public string Name { get; set; }
        public string UniqueIdentifier { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    };
}
