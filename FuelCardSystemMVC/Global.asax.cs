using FuelCardSystemBAL;
using FuelCardSystemEntities.Models;
using FuelCardSystemMVC.Library.CustomAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace FuelCardSystemMVC
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        private static CacheItemRemovedCallback OnCacheRemove = null;
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();

            AddTask("DoStuff", 60);

            //System.Timers.Timer timer = new System.Timers.Timer();
            //timer.Interval = 60000; //60 seconds
            //timer.Elapsed += timer_Elapsed;
            //timer.Enabled = true;
            //timer.Start();

            //System.Threading.AutoResetEvent autoEvent = new System.Threading.AutoResetEvent(false);
            //System.Threading.TimerCallback tcb = new System.Threading.TimerCallback(timer_Elapsed);
            //System.Threading.Timer m_timer = new System.Threading.Timer(tcb, null, 0, 60000);
        }

        private void AddTask(string name, int seconds)
        {
            OnCacheRemove = new CacheItemRemovedCallback(CacheItemRemoved);
            HttpRuntime.Cache.Insert(name, seconds, null,
                DateTime.Now.AddSeconds(seconds), Cache.NoSlidingExpiration,
                CacheItemPriority.NotRemovable, OnCacheRemove);
        }
        public void CacheItemRemoved(string k, object v, CacheItemRemovedReason r)
        {
            if (k == "DoStuff")
            {
                using (var db = new FuelCardDBEntities())
                {
                    List<VwChannelProductSchedule> lstSchedule = db.VwChannelProductSchedule.Where(x => x.Effective_Date.Value.Year == DateTime.Now.Year && x.Effective_Date.Value.Month == DateTime.Now.Month && x.Effective_Date.Value.Day == DateTime.Now.Day && x.Effective_Date.Value.Hour <= DateTime.Now.Hour && x.Effective_Date.Value.Minute <= DateTime.Now.Minute).ToList();
                    if (lstSchedule.Count > 0)
                    {
                        foreach (var item in lstSchedule)
                        {
                            Lnk_Products_Channels obj = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == item.Lnk_Products_Channels_id);
                            if (obj != null)
                            {
                                Schedule_History objHistory = new Schedule_History();
                                objHistory.Channel_Name = item.Channel_Name;
                                objHistory.Product_Name = item.Product_Name;
                                objHistory.Original_Price = item.Product_Price;
                                objHistory.Scheduled_Price = item.Scheduled_Price;
                                objHistory.Scheduled_Date = DateTime.Now;
                                AdminBAL.AddScheduleHistory(objHistory);

                                obj.Product_Price = item.Scheduled_Price;
                                obj.PriceSchedule_Id = null;
                                obj.Scheduled_Price = null;
                                AdminBAL.UpdateChannelProductStatus(obj);
                            }
                        }
                    }
                }//end using
                AddTask(k, Convert.ToInt32(v));
            }
        }
        
        //void timer_Elapsed(object sender)
        //{
        //    using (var db = new FuelCardDBEntities())
        //    {
        //        List<VwChannelProductSchedule> lstSchedule = db.VwChannelProductSchedule.Where(x => x.Effective_Date.Value.Year == DateTime.Now.Year && x.Effective_Date.Value.Month == DateTime.Now.Month && x.Effective_Date.Value.Day == DateTime.Now.Day && x.Effective_Date.Value.Hour == DateTime.Now.Hour && x.Effective_Date.Value.Minute <= DateTime.Now.Minute).ToList();
        //        if (lstSchedule.Count > 0)
        //        {
        //            foreach (var item in lstSchedule)
        //            {
        //                Lnk_Products_Channels obj = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == item.Lnk_Products_Channels_id);
        //                if (obj != null)
        //                {
        //                    Schedule_History objHistory = new Schedule_History();
        //                    objHistory.Channel_Name = item.Channel_Name;
        //                    objHistory.Product_Name = item.Product_Name;
        //                    objHistory.Original_Price = item.Product_Price;
        //                    objHistory.Scheduled_Price = item.Scheduled_Price;
        //                    objHistory.Scheduled_Date = DateTime.Now;
        //                    AdminBAL.AddScheduleHistory(objHistory);

        //                    obj.Product_Price = item.Scheduled_Price;
        //                    obj.PriceSchedule_Id = null;
        //                    obj.Scheduled_Price = null;
        //                    AdminBAL.UpdateChannelProductStatus(obj);
        //                }
        //            }
        //        }
        //    }//end using
        //}
        //private void timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        //{
        //    using (var db = new FuelCardDBEntities())
        //    {
        //        List<VwChannelProductSchedule> lstSchedule = db.VwChannelProductSchedule.Where(x => x.Effective_Date.Value.Year == DateTime.Now.Year && x.Effective_Date.Value.Month == DateTime.Now.Month && x.Effective_Date.Value.Day == DateTime.Now.Day && x.Effective_Date.Value.Hour == DateTime.Now.Hour && x.Effective_Date.Value.Minute <= DateTime.Now.Minute).ToList();
        //        if (lstSchedule.Count > 0)
        //        {
        //            foreach (var item in lstSchedule)
        //            {
        //                Lnk_Products_Channels obj = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == item.Lnk_Products_Channels_id);
        //                if (obj != null)
        //                {
        //                    Schedule_History objHistory = new Schedule_History();
        //                    objHistory.Channel_Name = item.Channel_Name;
        //                    objHistory.Product_Name = item.Product_Name;
        //                    objHistory.Original_Price = item.Product_Price;
        //                    objHistory.Scheduled_Price = item.Scheduled_Price;
        //                    objHistory.Scheduled_Date = DateTime.Now;
        //                    AdminBAL.AddScheduleHistory(objHistory);

        //                    obj.Product_Price = item.Scheduled_Price;
        //                    obj.PriceSchedule_Id = null;
        //                    obj.Scheduled_Price = null;
        //                    AdminBAL.UpdateChannelProductStatus(obj);
        //                }
        //            }
        //        }
        //    }//end using
        //}
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                var identity = new CustomIdentity(HttpContext.Current.User.Identity);
                var principal = new CustomPrincipal(identity);
                HttpContext.Current.User = principal;

            }
        }
    }
}