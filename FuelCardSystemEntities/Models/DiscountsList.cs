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
    
    public partial class DiscountsList
    {
        public long DiscountList_id { get; set; }
        public string DiscountList_Name { get; set; }
        public string DiscountList_Description { get; set; }
        public Nullable<bool> DiscountList_IsActive { get; set; }
        public Nullable<bool> DiscountList_IsDeleted { get; set; }
        public Nullable<System.DateTime> DiscountList_DateCreated { get; set; }
        public bool DiscountList_IsDefault { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
