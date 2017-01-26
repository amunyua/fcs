using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FuelCardSystemMVC.Models
{
    public class Menu
    {
        public int MenuId { get; set; }

        public int ParentId { get; set; }

        public string MenuName { get; set; }

        public string url { get; set; }

        public int Sequence { get; set; }

        public string Icon { get; set; }
        //public bool Status { get; set; }
    }
   
}