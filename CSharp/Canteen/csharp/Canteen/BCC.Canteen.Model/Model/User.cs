using IOC.FW.Core.Abstraction.Model;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCC.Canteen.Model
{
    [Table("USERS")]
    public class User : IBaseModel
    {
        public int Id { get; set; }

        public string Login { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool Activated { get; set; }

        public DateTime Created { get; set; }

        public DateTime? Updated { get; set; }
    }
}
