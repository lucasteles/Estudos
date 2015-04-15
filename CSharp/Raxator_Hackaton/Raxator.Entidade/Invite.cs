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
    [Table("RX_Invite")]
    public class Invite
    {
        [Key]
        public int IdInvite { get; set; }

        public int IdInviter { get; set; }
        public Customer Inviter { get; set; }

        public int IdInvited { get; set; }
        public Customer Invited { get; set; }

        public int IdInviteAnswerType { get; set; }

        public int IdBillingGroup { get; set; }
        public BillingGroup BillingGroup { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }

}
