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
    
    public partial class actionitem
    {
        public long id { get; set; }
        public string actionitem_name { get; set; }
        public Nullable<double> ref_value { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> created { get; set; }
        public bool baseitem { get; set; }
        public string description { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
