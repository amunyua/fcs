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
    
    public partial class Customer_Roles
    {
        public long Customer_RoleId { get; set; }
        public string Customer_RoleName { get; set; }
        public string Customer_RoleDescription { get; set; }
        public Nullable<bool> Role_IsActive { get; set; }
        public Nullable<bool> Role_IsDeleted { get; set; }
        public Nullable<System.DateTime> Role_DateCreated { get; set; }
        public Nullable<bool> IsAddApproved { get; set; }
        public Nullable<bool> IsDelApproved { get; set; }
        public Nullable<bool> IsEditApproved { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
