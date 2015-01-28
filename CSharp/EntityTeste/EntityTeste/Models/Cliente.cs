using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace EntityTeste.Models
{
    [Table("TB_CLIENTE")]
    public class Cliente : IModel
    {
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Key]
        public int IdCliente { get; set; }

        [Header(desc="Nome")]
        public string Name { get; set; }

         [Header(desc = "Criado")]
        public DateTime Created { get; set; }

         [Header(desc = "Atualizado")]
        public DateTime? Updated { get; set; }


          [Header(desc = "Ativo")]
        public bool Activated { get; set; }


        public virtual ICollection<Pedido> pedidos { get; set; }
        
         public void OnCreating(System.Data.Entity.DbModelBuilder modelBuilder)
         {

             modelBuilder.Entity<Cliente>()
                    .HasMany(e => e.pedidos)
                    .WithRequired(e => e.cliente)
                    .HasForeignKey(e => e.IdPedido);
             
                        
         }

    }
}
