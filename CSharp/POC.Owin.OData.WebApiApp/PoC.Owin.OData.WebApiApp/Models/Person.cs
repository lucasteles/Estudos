using Study.Owin.OData.WebApiApp.Abstraction;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web.OData.Builder;

namespace PoC.Owin.OData.WebApiApp.Models
{
    public class Person : IODataModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }


        public string Description { get; set; }




        public virtual List<Trip> Trips { get; set; }

        public void OnEdmModelResolver(ODataModelBuilder modelBuilder)
        {
           // modelBuilder.EntitySet<Person>("People");
        }
    }
}