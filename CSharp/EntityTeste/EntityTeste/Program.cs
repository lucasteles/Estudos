using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntityTeste.Models;
using System.Data.Entity;
using System.Linq.Expressions;

using SimpleInjector;
using SimpleInjector.Extensions;

using System.Windows.Forms;
using System.Reflection;

namespace EntityTeste
{
    class Program
    {

        public static Container container;

        static void Main(string[] args)
        {
         //cliente  
            
            using (var repo = new Repository<Cliente>())
            {

            //escreve queries no console
            // repo.Database.Log = Console.Write; 
            
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


           


            // configura injeção de dependecia utilizando simple injector
            Bootstrap();

            Application.EnableVisualStyles();
            
            // abre of form passando as dependencias
            //Application.Run(container.GetInstance<teste2>());
            Application.Run(container.GetInstance<Digitar1>());

            Console.ReadKey();

        }


        private static void Bootstrap()
        {
            // cria continer
            container = new Container();

            // registra os tipos genericos
            container.RegisterOpenGeneric(typeof(IBaseDAO<>), typeof(Repository<>), Lifestyle.Singleton);
            container.RegisterOpenGeneric(typeof(IBaseDigitarController<>), typeof(BaseDigitarController<>), Lifestyle.Singleton);
           
                

            //reigtra todos os forms
            Type formType = typeof(Form);
            foreach (Type type in Assembly.GetExecutingAssembly().GetTypes())
            if (formType.IsAssignableFrom(type))
            {
                if (!type.IsGenericType)
                    container.Register(type);
            }

            //verifica o container (??verificar)
            container.Verify();

            // Registra a classe de container
            Program.container = container;

            
        }
    }




}
