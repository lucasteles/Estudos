using Study.Owin.OData.WebApiApp.Abstraction;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.OData.Builder;

namespace PoC.Owin.OData.WebApiApp.Models
{
    public class Trip : IODataModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
        
        public int IdPerson { get; set; }

        [ForeignKey("IdPerson")]
        public Person person { get; set; }

        public void OnEdmModelResolver(ODataModelBuilder modelBuilder)
        {
            modelBuilder.EntitySet<Trip>("Trips");
        }
    }
}