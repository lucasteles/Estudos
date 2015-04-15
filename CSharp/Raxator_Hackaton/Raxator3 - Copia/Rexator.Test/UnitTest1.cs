using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Raxator.Services.Services;
using Raxator.Services;

namespace Rexator.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            var teste = new MoneySendRaxator();

            var retorno = teste.GerarTransferenciaEntreUsuarios(true, true);


            Assert.IsTrue(retorno>0);
        }

         [TestMethod]
        public void Payment()
        {
            var pag = new Pagamento()
            {
                Token = "9a873e34-caac-4d8b-80be-143bff31cec6",
                Moeda = Moedas.USD,
                Montante = 1000,
                Descricao = "payment description"
            };

            var service = new SimplifyService();
            service.Pagar(pag);

        }
    }
}
