using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections.ObjectModel;

namespace BradescoCadastro.DataAccess
{
    public class Repository
    {
        private string connectionString { get; set; }


        public Repository()
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        }


        public int inserirCliente(Cliente cliente)
        {
            var ret = 0;
            
            var command = 
                string.Format(@"INSERT INTO {0}({1},{2},{3},{4})
                                VALUES(@EMAIL, @TELEFONE, @ACEITAEMAIL, @ACEITASMS)",
                   getParameter("CLIENTES_TABLE"),
                   getParameter("CLIENTES_EMAIL"),
                   getParameter("CLIENTES_TELEFONE"),
                   getParameter("CLIENTES_ACEITAEMAIL"),
                   getParameter("CLIENTES_ACEITASMS")
                 );

            using (var con = new SqlConnection(connectionString))
            {
                con.Open();
                using (var adapter = new SqlCommand(command, con))
                {
                    
                    adapter.Parameters.AddWithValue("EMAIL", cliente.Email);
                    adapter.Parameters.AddWithValue("TELEFONE", cliente.Telefone);
                    adapter.Parameters.AddWithValue("ACEITAEMAIL", cliente.AceitaEmail.toInt());
                    adapter.Parameters.AddWithValue("ACEITASMS", cliente.AceitaSMS.toInt());
                    
                    ret = adapter.ExecuteNonQuery();
                }
            }

            return ret;

        }


        public IEnumerable<Cliente> buscarClientes()
        {
            var ret = new Collection<Cliente>();

            var command =
                string.Format(@" SELECT {1} EMAIL,{2} TELEFONE, {3} ACEITAEMAIL, {4} ACEITASMS FROM {0}",
                   getParameter("CLIENTES_TABLE"),
                   getParameter("CLIENTES_EMAIL"),
                   getParameter("CLIENTES_TELEFONE"),
                   getParameter("CLIENTES_ACEITAEMAIL"),
                   getParameter("CLIENTES_ACEITASMS")
                 );

            using (var con = new SqlConnection(connectionString))
            {
                con.Open();
                using (var adapter = new SqlCommand(command, con))
                {
                    var reader = adapter.ExecuteReader();
                    while (reader.Read())
                    {
                        ret.Add(new Cliente()
                        {
                            Email = reader["EMAIL"].ToString(),
                            Telefone = reader["TELEFONE"].ToString(),
                            AceitaSMS = (bool)reader["ACEITASMS"],
                            AceitaEmail = (bool)reader["ACEITAEMAIL"]
                        });
                    }
                    reader.Close();
                }
            }

            return ret;
        }

        public string getParameter(string paramName)
        {
           return  System.Configuration.ConfigurationManager.AppSettings[paramName].ToString();

        }

      
    }

    public static class Extensions
    {
        public static int toInt(this bool me)
        {
            return me ? 1 : 0;
        }

    }

}