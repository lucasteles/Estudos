using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HtmlToPdf
{
    class Program
    {
        static void Main(string[] args)
        {

            
            Byte[] bytes;

            using (var ms = new MemoryStream()){
                //documento abstração de PDF
                using (var doc = new Document()){
                    //writer
                    using (var writer = PdfWriter.GetInstance(doc, ms))
                    {
                      
                       //abre doc
                        doc.Open();

                        //HTML e CSS
                        var example_html = @"<p>Vai cavalo! <em> zica </em><span class=""headline"" style=""text-decoration: underline;"">do </span> <strong>baile <em> huehuebrbr</em></strong><span style=""color: red;"">!!!</span></p>";
                        var example_css = @".headline{font-size:200%}";


                        //css inline e linkado
                        using (var srHtml = new StringReader(example_html))
                            iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, srHtml);


                        // css externo    
                        using (var msCss = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(example_css)))                        
                        using (var msHtml = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(example_html)))                            
                                iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, msHtml, msCss);
                        


                        doc.Close();
                    }
                }

               
                bytes = ms.ToArray();
            }

         
            var testFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "pdf_bolado.pdf");
            System.IO.File.WriteAllBytes(testFile, bytes);
        }
    }
}
