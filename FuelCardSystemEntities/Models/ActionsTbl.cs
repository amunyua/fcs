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
    
    public partial class ActionsTbl
    {
        public long id { get; set; }
        public string Action_Name { get; set; }
        public string Action_Description { get; set; }
        public Nullable<bool> Action_IsActive { get; set; }
        public Nullable<bool> Action_IsDeleted { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<bool> IsAddApproved { get; set; }
        public Nullable<bool> IsDelApproved { get; set; }
        public Nullable<bool> IsEditApproved { get; set; }
        public Nullable<bool> exclusive { get; set; }
        public Nullable<bool> conflicting_action { get; set; }
        public Nullable<long> actionitem_id { get; set; }
        public Nullable<bool> supplementary_action { get; set; }
        public Nullable<bool> arithmetictype { get; set; }
        public bool Action_IsSelected { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
