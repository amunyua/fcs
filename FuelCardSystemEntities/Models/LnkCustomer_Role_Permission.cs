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
    
    public partial class LnkCustomer_Role_Permission
    {
        public long Lnk_Role_Permission_id { get; set; }
        public Nullable<long> Role_id { get; set; }
        public Nullable<long> Permission_id { get; set; }
        public Nullable<System.DateTime> Lnk_DateCreated { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}