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
    
    public partial class Finance_Transaction
    {
        public long Finance_Transaction_id { get; set; }
        public string Finance_Trans_description { get; set; }
        public string Transaction_Code { get; set; }
        public Nullable<bool> IsPosted { get; set; }
        public Nullable<System.DateTime> Transaction_DateCreated { get; set; }
        public Nullable<long> Doc_Type_id { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
