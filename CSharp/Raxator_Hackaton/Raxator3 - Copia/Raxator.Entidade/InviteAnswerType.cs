using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    [Table("RX_InviteAnswerType")]
    public class InviteAnswerType
    {
        [Key]
        public int IdInviteAnswerType { get; set; }
        public string Name { get; set; }
    }
}
