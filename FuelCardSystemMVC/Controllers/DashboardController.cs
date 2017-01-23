using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FuelCardSystemMVC.Controllers
{
    public class DashboardController : Controller
    {
        //
        // GET: /Dashboard/

        public ActionResult Index()
        {
            return View();
        }

    }
}
