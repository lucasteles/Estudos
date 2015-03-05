using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace BradescoCadastro
{
    public class Mp3Result : ActionResult
    {
         private string _wavFile;
         public Mp3Result(string wavFile)
        {
            _wavFile = wavFile;
        }


         public override void ExecuteResult(ControllerContext context)
         {
            
             HttpContextBase cb = context.HttpContext;
             cb.Response.Clear();                                       
             cb.Response.ClearContent();
             cb.Response.ClearHeaders();
             cb.Response.ContentType = "audio/mpeg";
             byte[] byteArray = File.ReadAllBytes(_wavFile);
             cb.Response.OutputStream.Write(byteArray, 0, byteArray.Length);
             
         }

    }
}