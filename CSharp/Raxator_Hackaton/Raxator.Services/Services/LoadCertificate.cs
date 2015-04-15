using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Services.Services
{
   public class LoadCertificate
    {
       private EnvironmentsRaxator.Environment environment = EnvironmentsRaxator.Environment.SANDBOX;


       private readonly string PASSWORD = ApiParameters.PASSWORD;
       private readonly string PRODUCTION_PK_DIR = ApiParameters.PRODUCTION_PK_DIR;
       private readonly string PRODUCTION_CONSUMER_KEY = ApiParameters.PRODUCTION_CONSUMER_KEY;
       private readonly string SANDBOX_PK_DIR = ApiParameters.SANDBOX_PK_DIR;
       private readonly string SANDBOX_CONSUMER_KEY = ApiParameters.PRODUCTION_CONSUMER_KEY;

       public LoadCertificate(EnvironmentsRaxator.Environment environment)
        {
            this.environment = environment;
        }

        public AsymmetricAlgorithm GetPrivateKey()
        {
            if (this.environment == EnvironmentsRaxator.Environment.PRODUCTION)
            {
                return GetPrivateKey(PRODUCTION_PK_DIR, PASSWORD);
            }
            else
            {
                return GetPrivateKey(SANDBOX_PK_DIR, PASSWORD);
            }
        }

        public string GetConsumerKey()
        {
            if (this.environment == EnvironmentsRaxator.Environment.PRODUCTION)
            {
                return PRODUCTION_CONSUMER_KEY;
            }
            else
            {
                return SANDBOX_CONSUMER_KEY;
            }
        }

        private AsymmetricAlgorithm GetPrivateKey(string keystorePath, string keystorePassword)
        {
            // Load the certificate from the keystore.
            X509Certificate2 mcIssuedCertificate =
                new X509Certificate2(keystorePath, keystorePassword);
            return mcIssuedCertificate.PrivateKey;
        }
   }
}
