using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace EntityTeste.Models
{
    [Table("TB_PEDIDO")]
    public class Pedido : IModel
    {
        [Key]
        public int IdPedido { get; set; }
        public DateTime Data { get; set; }
        public int IdCliente { get; set; }
        public int NumPedido { get; set; }
        public DateTime? Created { get; set; }

        [ForeignKey("IdCliente")]
        public virtual Cliente cliente { get; set; }


        
        

        public void OnCreating(System.Data.Entity.DbModelBuilder modelBuilder)
        {
            
        }


        
     
    }
}
