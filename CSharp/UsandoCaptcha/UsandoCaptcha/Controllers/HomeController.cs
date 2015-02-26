using System.Web;
using System.Web.Mvc;
using UsandoCaptcha.Models;

namespace UsandoCaptcha.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Hello World";

            return View();
        }

        public CaptchaResult GetCaptcha()
        {
            string captchaText = Captcha.GenerateRandomCode();
            HttpContext.Session.Add("captcha", captchaText);
            return new CaptchaResult(captchaText);
        }

        [HttpPost]
        public ActionResult Index(string captcha)
        {
            if (captcha == HttpContext.Session["captcha"].ToString())
                ViewData["Message"] = "O desafio CAPTCHA foi vencido com sucesso!";
            else
                ViewData["Message"] = "O desafio CAPTCHA falhou - tente novamente!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
