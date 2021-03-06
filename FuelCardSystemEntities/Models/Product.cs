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
    
    public partial class Product
    {
        public long Product_id { get; set; }
        public string Product_Name { get; set; }
        public string Product_Description { get; set; }
        public Nullable<long> Product_Type { get; set; }
        public Nullable<decimal> Product_Price { get; set; }
        public string Product_currency { get; set; }
        public Nullable<bool> Product_IsActive { get; set; }
        public Nullable<bool> Product_IsDeleted { get; set; }
        public Nullable<System.DateTime> Product_DateCreated { get; set; }
        public Nullable<bool> IsAddApproved { get; set; }
        public Nullable<bool> IsDelApproved { get; set; }
        public Nullable<bool> IsEditApproved { get; set; }
        public Nullable<int> IsDeletedFlag { get; set; }
        public Nullable<bool> IsbeingDeleted { get; set; }
        public Nullable<bool> IsbeingAdded { get; set; }
        public Nullable<bool> IsbeingEdited { get; set; }
        public string CF1 { get; set; }
        public string CF2 { get; set; }
        public string CF3 { get; set; }
        public string CF4 { get; set; }
        public string CF5 { get; set; }
        public string CF6 { get; set; }
        public string CF7 { get; set; }
        public string CF8 { get; set; }
        public string CF9 { get; set; }
        public string CF10 { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
        public Nullable<long> TaxCategoryID { get; set; }
    }
}
