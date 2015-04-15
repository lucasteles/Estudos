using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Raxator.UI.Models;
using Raxator.BLL;
using Raxator.Entidade;
using Raxator.Entidade.Cadastro;
using Raxator.Services;

namespace Raxator.UI.Controllers
{
    public class PaymentController : Controller
    {
        private readonly BaseBusiness<Merchant> _merchantBusiness;
        private readonly BaseBusiness<BillingGroup> _billingGroupBusiness;
        private readonly BaseBusiness<BillingGroup_Customer> _billingGroupCustomerBusiness;
        private readonly BaseBusiness<BillingGroup_Customer_Product> _billingGroupCustomerProductBusiness;
        private readonly BaseBusiness<Customer> _customerBusiness;

        public PaymentController()
        {
            _merchantBusiness = new BaseBusiness<Merchant>();
            _billingGroupBusiness = new BaseBusiness<BillingGroup>();
            _billingGroupCustomerBusiness = new BaseBusiness<BillingGroup_Customer>();
            _billingGroupCustomerProductBusiness = new BaseBusiness<BillingGroup_Customer_Product>();
            _customerBusiness = new BaseBusiness<Customer>();
        }

        //
        // GET: /Payment/

        public ActionResult Index()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Index", "Home"),
                    Text = "< Voltar"
                }
            };

            return View();
        }

        public ActionResult Card()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Card", "Payment"),
                    Text = "< Voltar"
                }
            };

            return View();
        }

        public ActionResult Synchronize()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Index", "Home"),
                    Text = "< Voltar"
                }
            };

            return View();
        }

        [HttpPost]
        public ActionResult Synchronize(string PaymentNumber)
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Index", "Home"),
                    Text = "< Voltar"
                }
            };

            var loggedUser = (Session["loggedUSer"] as Customer);

            var billingGroup = _billingGroupBusiness.SelectSingle(
                w => w.UniqueIdentifier == PaymentNumber
            );

            IList<BillingGroup_Customer_Product> products = null;

            if (billingGroup != null && loggedUser != null)
            {
                var customer = new BillingGroup_Customer
                {
                    IdUser = loggedUser.IdUser,
                    IdPaymentType = (int)Enumerators.PaymentType.Master,
                    IndividualPrice = 0,
                    CreatedAt = DateTime.Now,
                    IdBillingGroup = billingGroup.IdBillingGroup
                };

                _billingGroupCustomerBusiness.Delete(customer);
                _billingGroupCustomerBusiness.Insert(customer);

                products = _billingGroupCustomerProductBusiness.Select(
                    p => p.IdBillingGroup == billingGroup.IdBillingGroup,
                    n => n.Product
                );
                

                // return View(products);
            }
            else
            {
                this.ModelState.AddModelError(
                    "merchant-not-found",
                    "Estabelecimento não encontrado."
                );
            }

            ViewBag.ViewCount = true;

            Session["products"] = products;
            return View(products);
        }

        public ActionResult AddPayment()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Index", "Payment"),
                    Text = "< Voltar"
                }
            };

            return View();
        }

        [HttpPost]
        public ActionResult AddPayment(string description, string quantity, string value)
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Index", "Payment"),
                    Text = "< Voltar"
                }
            };

            ViewBag.ViewCount = true;

            return View();
        }

        public ActionResult Pay()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Synchronize", "Payment"),
                    Text = "< Voltar"
                },
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Right,
                    Link = Url.Action("Costumers", "Payment"),
                    Text = "Pagantes"
                }
            };

            var products = (Session["products"] as IList<BillingGroup_Customer_Product>);
            decimal sum = (products.Sum(
                p => p.Product.Price * p.Product.Count)
            );

            ViewBag.values = new decimal[] { sum };
            ViewBag.total = sum.ToString("#,##0.00");

            return View();
        }

        public ActionResult Costumers()
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Pay", "Payment"),
                    Text = "< Voltar"
                }
            };

            IList<Customer> allUsers = null;
            var loggedUser = (Session["loggedUser"] as Customer);
            if (loggedUser != null)
	        {
                allUsers = _customerBusiness.Select(
                    p => p.IdUser != loggedUser.IdUser
                );
	        }

            return View(allUsers);
        }
        
        [HttpPost]
        public ActionResult Costumers(int[] people)
        {
            ViewBag.TopButtons = new List<TopButton> {
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Left,
                    Link = Url.Action("Synchronize", "Payment"),
                    Text = "< Voltar"
                },
                new TopButton {
                    Direction = Enumerators.ButtonDirection.Right,
                    Link = Url.Action("Costumers", "Payment", new { v=1 }),
                    Text = "Pagantes"
                }
            };

            List<Customer> friends = new List<Customer>();
            if (people != null && people.Length > 0)
            {
                foreach (var friend in people)
                {
                    var found = _customerBusiness.SelectSingle(p => p.IdUser == friend);
                    if (found != null)
                    {
                        friends.Add(found);
                    }
                }
            }

            var products = (Session["products"] as List<BillingGroup_Customer_Product>);
            var sum = products.Sum(p => 
                p.Product.Price * p.Product.Count
            );

            decimal[] value = new decimal[friends.Count + 1];
            decimal fraction = sum / (friends.Count + 1);

            for (int i = 0; i < value.Length; i++)
            {
                value[i] = fraction;
            }

            int actualIndex = 0;
            decimal actualSum = 0;
            while ((actualSum = value.Sum()) != sum)
            {
                if (actualSum < sum)
                {
                    value[actualIndex] += 0.1m;
                }
                else
                {
                    value[actualIndex] -= 0.1m;
                }

                if (actualIndex >= value.Length - 1)
                {
                    actualIndex = 0;
                }
            }
            ViewBag.values = value;
            ViewBag.total = sum.ToString("#,##0.00");
            return View("Pay", friends);

        }

        [HttpPost]
        public ActionResult PayAccount(string simplifyToken)
        {
            var pag = new Pagamento();
            pag.Token = simplifyToken;
            pag.Moeda = Moedas.USD;
            pag.Descricao = "Payment description";
            pag.Montante = 10000;

            var api = new SimplifyService();
            TempData["PagamentoRealizado"] = api.Pagar(pag);

            return RedirectToAction("Index","Home");
        }

    }
}
