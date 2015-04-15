using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Raxator.DAL;
using Raxator.DAL.Abstraction;
using Raxator.Entidade.Cadastro;

namespace Raxator.BLL
{
    public static class CustomerBusiness
    {
        private static readonly BaseRepository<Customer> _DAO;
        public static BaseBusiness<Customer> Common;

        static CustomerBusiness()
        {
            _DAO = new BaseRepository<Customer>();
            Common = new BaseBusiness<Customer>();
        }

        public static IList<Customer> SelectAll(
            params Expression<Func<Customer, object>>[] navigationProperties
        )
        {
            var allItems = _DAO.SelectAll();
            return allItems;
        }

        public static void Insert(params Customer[] customers)
        {
            foreach (var customer in customers)
            {
                customer.Password = BitConverter.ToString(
                    SHA1.Create().ComputeHash(
                        Encoding.UTF8.GetBytes(
                            customer.Password
                        )
                    )
                )
                .Replace("-", string.Empty);
                customer.CreatedAt = DateTime.Now;
            }

            _DAO.Insert(customers);
        }

        public static Customer LoginCheck(string username, string password)
        {
            password = BitConverter.ToString(
                SHA1.Create().ComputeHash(
                    Encoding.UTF8.GetBytes(
                        password
                    )
                )
            )
            .Replace("-", string.Empty);


            var loggedUSer = Common.SelectSingle(
                w => 
                    w.Email == username 
                    && w.Password == password
            );

            return loggedUSer;
        }
    }
}