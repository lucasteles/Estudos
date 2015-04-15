using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SimplifyCommerce.Payments;


namespace Raxator.Services
{
    public class SimplifyService
    {

        public SimplifyService()
        {
            PaymentsApi.PublicApiKey = ApiParameters.PUBLIC_KEY;
            PaymentsApi.PrivateApiKey = ApiParameters.PRIVATE_KEY;                   
        }
        
        public bool Pagar(Pagamento pagamento)
        {
            var api = new PaymentsApi();
            var payment = pagamento.ToPayment();
            var ret = true;

            try
            {
                payment = (Payment)api.Create(payment);
                ret = payment.PaymentStatus == "APPROVED";
                    
            }
            catch (Exception e)
            {

                ret = false;
            }
            
            return ret;
        }



    }
}
