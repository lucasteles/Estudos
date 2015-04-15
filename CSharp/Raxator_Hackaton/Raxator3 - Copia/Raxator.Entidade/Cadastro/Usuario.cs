using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Raxator.Entidade.Cadastro
{
    [Table("RX_Customer")]
    public class Customer
    {
        [Key]
        public int IdUser { get; set; }
        public String Email { get; set; }
        public String Name { get; set; }
        public String Password { get; set; }
        public long? IdFacebook { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}
