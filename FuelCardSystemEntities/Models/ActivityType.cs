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
    
    public partial class ActivityType
    {
        public long ActivityType_id { get; set; }
        public string ActivityType_Name { get; set; }
        public string ActivityType_Description { get; set; }
        public Nullable<bool> ActivityType_IsActive { get; set; }
        public Nullable<bool> ActivityType_IsDeleted { get; set; }
        public Nullable<System.DateTime> ActivityType_DateCreated { get; set; }
        public Nullable<bool> IsAddApproved { get; set; }
        public Nullable<bool> IsDelApproved { get; set; }
        public Nullable<bool> IsEditApproved { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
