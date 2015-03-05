using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using BradescoCadastro.DataAccess;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web.Mvc;


namespace BradescoCadastro.Controllers
{
    public class ClienteController : Controller
    {

       /* public RedirectResult Index()
        {
           return Redirect(getParameter("DEFAULT_URL").ToLower());
        }
        */

        public ActionResult teste()
        {



            return View();
        }


        public CaptchaResult GetCaptcha()
        {
            string captchaText = Captcha.GenerateRandomCode();
            HttpContext.Session.Add("captcha", captchaText);
            return new CaptchaResult(captchaText);
        }

        public Mp3Result GetAudioCaptcha()
        {
            string file =  AudioTool.GenerateAudio(
                                ControllerContext, 
                                HttpContext.Session["captcha"].ToString()
                            );

            return new Mp3Result(file);
        }

        
        [HttpPost]
        public RedirectResult Post(
            string usrname,
            string usrddd,
            string usrfone,
            string aceitoEmail,
            string aceitoSMS
        )
        {

            var urlRefer = Request.UrlReferrer.AbsoluteUri;

            if (!isValidPost(Request.UrlReferrer))
            {
                return Redirect(getParameter("DEFAULT_URL").ToLower());
            }

            var cliente = new Cliente { 
                Email = usrname,
                Telefone = string.Format("({0}){1}", usrddd, usrfone),
                AceitaEmail = aceitoEmail == "on",
                AceitaSMS = aceitoSMS == "on"
            };

            if (
                String.IsNullOrEmpty(cliente.Email) ||
                String.IsNullOrEmpty(cliente.Telefone) ||
                !IsValidMail(cliente.Email) ||
                !IsValidPhone(cliente.Telefone) 
            )
            {
                return Redirect(urlRefer); //http://subdomain.bradesco.com/master/hack.html");
            }


            var repositorio = new Repository();
            repositorio.inserirCliente(cliente);
            
            return Redirect(urlRefer);
        }

        private bool IsValidMail(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        private bool IsValidPhone(string phone)
        {
             var regex = new Regex("^[(]{1}\\d{2}[)]{1}\\d{4,5}[-]{1}\\d{4}$");
             return regex.IsMatch(phone);
        }


        public string getParameter(string paramName)
        {
            return System.Configuration.ConfigurationManager.AppSettings[paramName].ToString().ToUpper();
        }

        private bool isValidPost(Uri UrlReferrer)
        {
            var ret = true;

            if (!UrlReferrer.Host.ToUpper().Equals(getParameter("ALLOWED_HOST")))
                ret = false;

            var paths = getParameter("ALLOWED_PATHS");
            if (
                !String.IsNullOrEmpty(paths) &&
                !paths.Split(',').Any(s => UrlReferrer.AbsolutePath.ToUpper().StartsWith(s)) 
               )
                ret = false;



            return ret;
        }

     

        //public HttpResponseMessage Options()
        //{
        //    var response = Request.CreateResponse(HttpStatusCode.OK);

        //    response.Headers.Add("Access-Control-Allow-Method", "POST");
        //    response.Headers.Add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

        //    return response;
        //}

    }
}