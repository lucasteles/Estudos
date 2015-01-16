using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntityTeste.Models;
using System.Data.Entity;
using System.Linq.Expressions;

namespace EntityTeste
{
    class Program
    {
        static void Main(string[] args)
        {
         //cliente  
            
            using (var repo = new Repository<Cliente>())
            {

            
            repo.Database.Log = Console.Write; 
            
                /* insert
            var novo = new Cliente()
            {
                IdCliente = 1,
                Name = "teste",
                Activated = true,
                Created = DateTime.Now
            };

           repo.Entry(novo).State = EntityState.Added;
            repo.SaveChanges();
                 */
               

           var all = repo.dbQuery.Include(e=>e.pedidos).ToList();

            foreach (var item in all)
            {
                Console.Write(item.Name+"\n");
            }
                

                //update
                /*
            var model = repo.dbQuery.FirstOrDefault(e => e.IdCliente == 1);

              var model2 = repo.DbObject.Find(1);

             model.Name = "br teste";

             repo.Entry(model).State = EntityState.Modified;
             repo.SaveChanges(); 

                */
               
        }
        

            /*
            //pedido
            using (var contexto = new Repository<Pedido>())
            {
                
                
                var all = contexto.dbQuery.Include( e => e.cliente ).ToList();

                foreach (var item in all)
                {
                    Console.Write(string.Format("id={0} num={1} data={2} cliente={3} \n", 
                            item.IdPedido, item.NumPedido, item.Data.ToShortDateString(), item.cliente.Name ));
                }



            }
            */




         //   var ee = new teste();
      //      ee.ShowDialog();
            

            Console.ReadKey();

        }
    }
}
