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
    
    public partial class GeneralSetting
    {
        public long GenSet_id { get; set; }
        public Nullable<int> PostPaidExpValue { get; set; }
        public string PostPaidExpPeriod { get; set; }
        public Nullable<int> MinRedeemPoints { get; set; }
        public Nullable<int> BaseCurrency { get; set; }
        public Nullable<int> MaxTopupPerDay { get; set; }
        public Nullable<int> MaxPrepaidBalance { get; set; }
        public Nullable<int> DefaultUsageLimit { get; set; }
        public Nullable<bool> IsAddApproved { get; set; }
        public Nullable<bool> IsDelApproved { get; set; }
        public Nullable<bool> IsEditApproved { get; set; }
        public Nullable<bool> IndividualMultipleAccounts { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
        public string CCEmail { get; set; }
        public bool IsCCEmail { get; set; }
    }
}
