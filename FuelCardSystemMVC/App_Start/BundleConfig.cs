using System.Web;
using System.Web.Optimization;

namespace FuelCardSystemMVC
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/adminscript").Include(
                //"~/Content/plugins/jQuery/jQuery-2.1.3.js",
                "~/Content/plugins/jQuery/jquery-1.9.1.js",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Content/bootstrap/js/bootstrap.js",
                "~/Content/dist/js/jquery.validate.js",
                //"~/Scripts/jquery.validate.unobtrusive.js",
                "~/Content/plugins/slimScroll/jquery.slimscroll.js",
                "~/Content/plugins/fastclick/fastclick.js",
                "~/Content/dist/js/app.js",
                "~/Content/dist/js/CommonJS.js"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                       "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/custscript").Include(
                //"~/Content/plugins/jQuery/jQuery-2.1.3.js",
                "~/Content/plugins/jQuery/jquery-1.9.1.js",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Content/bootstrap/js/bootstrap.js",
                "~/Content/dist/js/jquery.validate.js",
                //"~/Scripts/jquery.validate.unobtrusive.js",
                "~/Content/plugins/slimScroll/jquery.slimscroll.js",
                "~/Content/plugins/fastclick/fastclick.js",
                "~/Content/dist/js/app.js",
                "~/Content/dist/js/customer.js"));

            bundles.Add(new StyleBundle("~/bundles/admincss").Include(
                        "~/Content/bootstrap/css/bootstrap.css",
                        "~/Content/dist/css/AdminLTE.css",
                        "~/Content/dist/css/skins/_all-skins.css"));
            //BundleTable.EnableOptimizations = true;
        }
    }
}