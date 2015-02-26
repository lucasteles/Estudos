using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using Ionic.Zip;

namespace testeWebRequest
{
    class Program
    {
        static void Main(string[] args)
        {
            for (int i = 0; i < 2; i++)
            {
                var req = HttpWebRequest.Create("http://www.bradesco.com.br/portal/PDF/prime/produtos-servicos/cartoes/sumario-executivo-pf.pdf");
                req.Method = "HEAD";
                // HttpWebResponse resp =null;

                try
                {
                    long ContentLength;
                    using (HttpWebResponse resp = (HttpWebResponse)req.GetResponse())
                    {

                        //long.TryParse(resp.Headers.Get("Content-Length"), out ContentLength);
                        
                        resp.Close();

                    }
                }
                finally
                {
                    req.Abort();
                    req = null;
                }


            }


          /*  var outputStream = new MemoryStream();

            using (ZipFile zip = new ZipFile())
            {
                var zipPath = "C:\\Testes\\chat\\";

                zip.AddDirectory(zipPath, System.IO.Path.GetFileName(zipPath));
                zip.Save(outputStream);
            }

           using (var fileStream = File.Create("C:\\lixo.zip"))
            {
                outputStream.Seek(0, SeekOrigin.Begin);
               outputStream.CopyTo(fileStream);
            }
            */
        }
    }
}
