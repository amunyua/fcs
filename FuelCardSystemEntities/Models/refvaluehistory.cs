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
    
    public partial class refvaluehistory
    {
        public long id { get; set; }
        public Nullable<long> actionitem_id { get; set; }
        public Nullable<double> ref_value { get; set; }
        public Nullable<System.DateTime> created { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
