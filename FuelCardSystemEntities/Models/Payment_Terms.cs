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
    
    public partial class Payment_Terms
    {
        public long PaymentTerm_id { get; set; }
        public string PaymentTerm_Name { get; set; }
        public Nullable<int> DayInFollowingMonth { get; set; }
        public Nullable<int> DaysBeforeDue { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
