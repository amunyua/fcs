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
    
    public partial class VwActivity_ActivityType
    {
        public long Expr1 { get; set; }
        public string ActivityType_Name { get; set; }
        public string ActivityType_Description { get; set; }
        public Nullable<bool> ActivityType_IsActive { get; set; }
        public Nullable<bool> ActivityType_IsDeleted { get; set; }
        public Nullable<System.DateTime> ActivityType_DateCreated { get; set; }
        public string Activity_Name { get; set; }
        public string Activity_Description { get; set; }
        public Nullable<bool> Activity_IsActive { get; set; }
        public Nullable<bool> Activity_IsDeleted { get; set; }
        public Nullable<System.DateTime> Activity_DateCreated { get; set; }
        public long Activity_id { get; set; }
    }
}