using JsonParser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JsonToCSharp.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        // GET: Home
        public ContentResult Index()
        {
            return Content("error.");
        }

        [AllowAnonymous]
        [HttpPost]
        public JsonResult GetParse(string txtJson)
        {
            //ViewBag.Value = txtJson;
            var code = "";
            if (txtJson!=null && !txtJson.Equals(""))
            {
                using (var fileStream = GenerateStreamFromString(txtJson))
                using (var binaryReader = new BinaryReader(fileStream))
                {
                    var machine = new JsonMachine(binaryReader);
                    string err;
                    if (!machine.Analisys(out err))
                    { 
                       code = "Error: " + err;
                    }
                    else
                    {
                        code = machine.GetCode();
                    }
                }
            }
            else { code =  ""; }

            return Json(new { parse = code });//View("Index");
        }

       

        public Stream GenerateStreamFromString(string s)
        {
            MemoryStream stream = new MemoryStream();
            StreamWriter writer = new StreamWriter(stream);
            writer.Write(s);
            writer.Flush();
            stream.Position = 0;
            return stream;
        }

    }
}
