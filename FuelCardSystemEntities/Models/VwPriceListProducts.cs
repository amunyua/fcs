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
    
    public partial class VwPriceListProducts
    {
        public Nullable<long> Product_id { get; set; }
        public Nullable<long> Price_List_id { get; set; }
        public long id { get; set; }
        public Nullable<decimal> Product_Price { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public string Product_Name { get; set; }
        public string Product_Description { get; set; }
        public Nullable<decimal> BuyingPrice { get; set; }
        public string Product_currency { get; set; }
        public Nullable<long> Product_Type { get; set; }
    }
}
