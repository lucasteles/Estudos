using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;


/*
   gerar container de chave:
        C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\aspnet_regiis -pc "TesteKeys" –exp
        obs. deve ser configurado o provider no config
        
   Criptar por comando;
        C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\aspnet_regiis -pef connectionStrings c:\inetpub\wwwroot -prov TesteKeys
 
   Exportar a chave - incluindo a privada - para poder ser utilizada em outras máquinas
        aspnet_regiis -px "TesteKeys" c:\TesteKeys.xml -pri
 
   Importar as chaves em outra máquina 
        C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\aspnet_regiis -pi "TesteKeys" "c:\temp\TesteKeys.xml" –exp
 */

namespace criptTest
{

    class Program
    {
        static void Main(string[] args)
        {

            string exeConfigName = System.AppDomain.CurrentDomain.FriendlyName.Replace(".vshost","");
            try
            {
                var config = ConfigurationManager.OpenExeConfiguration(exeConfigName);
                var section = config.GetSection("connectionStrings") as ConnectionStringsSection;

                if (section.SectionInformation.IsProtected)
                    section.SectionInformation.UnprotectSection();
                else
                    section.SectionInformation.ProtectSection("TesteKeys");//"DataProtectionConfigurationProvider");

                section.SectionInformation.ForceSave = true;
                config.Save(ConfigurationSaveMode.Modified);
                
                Console.WriteLine("Protected={0}", section.SectionInformation.IsProtected);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }


            Console.WriteLine(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
            Console.ReadKey();
        }

    }
}
