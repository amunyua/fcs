//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FuelCardSystemEntities.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Schedule_History
    {
        public long History_Id { get; set; }
        public Nullable<decimal> Original_Price { get; set; }
        public Nullable<decimal> Scheduled_Price { get; set; }
        public Nullable<System.DateTime> Scheduled_Date { get; set; }
        public string Product_Name { get; set; }
        public string Channel_Name { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}