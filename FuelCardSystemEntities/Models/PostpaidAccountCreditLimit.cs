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
    
    public partial class PostpaidAccountCreditLimit
    {
        public long id { get; set; }
        public Nullable<long> Credit_id { get; set; }
        public Nullable<long> AccountNumber { get; set; }
        public Nullable<decimal> Account_CreditLimit { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
