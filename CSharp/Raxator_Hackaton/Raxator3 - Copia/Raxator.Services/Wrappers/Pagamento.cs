using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SimplifyCommerce.Payments;

namespace Raxator.Services
{
    public class Pagamento
    {
        public long Montante { get; set; }
        public Moedas Moeda { get; set; }
        public string Descricao { get; set; }
        public string Token { get; set; }

        internal Payment ToPayment()
        {
            return new Payment()
                    {
                        Amount = Montante,
                        Currency = Moeda.ToString(),
                        Description = Descricao,
                        Token = Token
                    };
        }

    }

}
