using System.Web;
using System.Web.Mvc;
using System.Drawing.Imaging;

namespace UsandoCaptcha.Models
{
    public class CaptchaResult : ActionResult
    {
        public string _captchaText;
        public CaptchaResult(string captchaText)
        {
            _captchaText = captchaText;
        }
        public override void ExecuteResult(ControllerContext context)
        {
            Captcha c = new Captcha();
            c.Text = _captchaText;
            c.Width = 150;
            c.Height = 50;
            c.FamilyName = "";

            HttpContextBase cb = context.HttpContext;

            cb.Response.Clear();
            cb.Response.ContentType = "image/jpeg";
            c.Image.Save(cb.Response.OutputStream, ImageFormat.Jpeg);
            c.Dispose();
        }
    }
}