using IOC.FW.Core.Abstraction.Model;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCC.Canteen.Model
{
    [Table("FEEDBACKS")]
    public class Feedback : IBaseModel
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public string Description { get; set; }

        public bool Activated { get; set; }

        public DateTime Created { get; set; }

        public DateTime? Updated { get; set; }
    }
}
