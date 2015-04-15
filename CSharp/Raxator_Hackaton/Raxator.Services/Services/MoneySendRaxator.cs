using MasterCard.SDK;
using MasterCard.SDK.Services.MoneySend;
using MasterCard.SDK.Services.MoneySend.Domain;
using SimplifyCommerce.Payments;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Services.Services
{
   public class MoneySendRaxator
    {
       LoadCertificate carregarCertificado = new LoadCertificate(EnvironmentsRaxator.Environment.SANDBOX);
       TransferService service;
          
        public MoneySendRaxator()
        {
            //service = new TransferService(carregarCertificado.GetConsumerKey(), carregarCertificado.GetPrivateKey(), Environments.Environment.SANDBOX);

            service = new TransferService(carregarCertificado.GetConsumerKey(), carregarCertificado.GetPrivateKey(), Environments.Environment.SANDBOX);
        }

        public int GerarTransferenciaEntreUsuarios(bool primeiroUsuario, bool SegundoUsuario)
        {

            Random rand = new Random();

            Parallel.For(0, 1000, (i, loop) =>
            {
                if (rand.Next() == 0) loop.Stop();
            });

            TransferRequest transferRequestCard = new TransferRequest();
            transferRequestCard.LocalDate = "1204";
            transferRequestCard.LocalTime = "0107";
            transferRequestCard.TransactionReference = 4000000001010102028L;
            transferRequestCard.SenderName = "John Doe";
            transferRequestCard.SenderAddress.Line1 = "123 Main Street";
            transferRequestCard.SenderAddress.Line2 = "#5A";
            transferRequestCard.SenderAddress.City = "Arlington";
            transferRequestCard.SenderAddress.CountrySubdivision = "VA";
            transferRequestCard.SenderAddress.PostalCode = 22207;
            transferRequestCard.SenderAddress.Country = "USA";
            transferRequestCard.FundingCard.AccountNumber = 5184680430000006L;
            transferRequestCard.FundingCard.ExpiryMonth = 11;
            transferRequestCard.FundingCard.ExpiryYear = 2014;
            transferRequestCard.FundingUCAF = "MjBjaGFyYWN0ZXJqdW5rVUNBRjU=1111";
            transferRequestCard.FundingMasterCardAssignedId = 123456;
            transferRequestCard.FundingAmount.Value = 15000;
            transferRequestCard.FundingAmount.Currency = rand.Next();
            transferRequestCard.ReceiverName = "Jose Lopez";
            transferRequestCard.ReceiverAddress.Line1 = "Pueblo Street";
            transferRequestCard.ReceiverAddress.Line2 = "PO BOX 12";
            transferRequestCard.ReceiverAddress.City = "El PASO";
            transferRequestCard.ReceiverAddress.CountrySubdivision = "TX";
            transferRequestCard.ReceiverAddress.PostalCode = 79906;
            transferRequestCard.ReceiverAddress.Country = "USA";
            transferRequestCard.ReceiverPhone = 1800639426;
            transferRequestCard.ReceivingCard.AccountNumber = 5184680430000006L;
            transferRequestCard.ReceivingAmount.Value = 182206;
            transferRequestCard.ReceivingAmount.Currency = 484;
            transferRequestCard.Channel = "W";
            transferRequestCard.UCAFSupport = false;
            transferRequestCard.ICA = "009674";
            transferRequestCard.ProcessorId = 9000000442L;
            transferRequestCard.RoutingAndTransitNumber = 990442082;
            transferRequestCard.CardAcceptor.Name = "My Local Bank";
            transferRequestCard.CardAcceptor.City = "Saint Louis";
            transferRequestCard.CardAcceptor.State = "MO";
            transferRequestCard.CardAcceptor.PostalCode = 63101;
            transferRequestCard.CardAcceptor.Country = "USA";
            transferRequestCard.TransactionDesc = "P2P";
            transferRequestCard.MerchantId = 123456;

            Transfer transfer = service.GetTransfer(transferRequestCard);
         

            if (transfer != null)
            {
                return Convert.ToInt32(transfer.TransactionReference);
            }

            return 0; 
        }
            

    }
}
