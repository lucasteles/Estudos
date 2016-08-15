using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace lixo1
{
    class Program
    {
        static void Main(string[] args)
        {
            var m = new Area();

            var qb = new ModelSqlBuilder<Area>();

            qb.Where(e => e.Activated && e.Name == "Lucas");

            var query = qb.BuildQuery();


            Console.Read();
        }
    }


    [Table("TABELA")]
    public class Area
    {
        [Key]
        public int Id { get; set; }
        [Column("NOME")]
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Activated { get; set; }
        public System.DateTime Created { get; set; }
        public DateTime? Updated { get; set; }
        public virtual Area areaFilha { get; set; }

    }

}
