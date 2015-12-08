using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using EntityTeste.Validations;

namespace EntityTeste.Models
{
    [Table("TB_CLIENTE")]
    public class Cliente : IModel
    {
        ClienteValidator _validator;
        public Cliente()
        {
            _validator = new ClienteValidator();
        }

        public FluentValidation.Results.ValidationResult validate()
        {
            _validator = new ClienteValidator();
            return _validator.Validate(this);
        }


        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Key]
        public int IdCliente { get; set; }

        [Header(desc="Nome")]
        public string Name { get; set; }


        [Header(desc = "Fone")]
        public string Telefone { get; set; }

        [Header(desc = "peso")]
        public decimal? peso { get; set; }

        [Header(desc = "Criado")]
        public DateTime? Created { get; set; }

         [Header(desc = "Atualizado")]
        public DateTime? Updated { get; set; }


          [Header(desc = "Ativo")]
          public bool Activated { get; set; }


         public virtual ICollection<Pedido> pedidos { get; set; }
        
         public void OnCreating(System.Data.Entity.DbModelBuilder modelBuilder)
         {

            /* modelBuilder.Entity<Cliente>()
                    .HasMany(e => e.pedidos)
                    .WithRequired(e => e.cliente)
                    .HasForeignKey(e => e.IdPedido);
             */

                      
                   
                   


         }

         
        
       
       
    }
}
