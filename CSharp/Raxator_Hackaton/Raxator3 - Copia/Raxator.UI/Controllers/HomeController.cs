using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Raxator.BLL;
using Raxator.UI.Models;
using Raxator.Entidade;

namespace Raxator.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Right,
                    Link = Url.Action("Logout", "Account"),
                    Text = "Logout"
                },
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("FirstPage", "Home"),
                    Text = "< Voltar"
                }
           
            };
            return View();
        }

        public ActionResult FirstPage()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Right,
                    Link = Url.Action("Logout", "Account"),
                    Text = "Logout"
                },
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Index", "Home"),
                    Text = "Menu"
                }
            };
            return View();
        }

    }
}
