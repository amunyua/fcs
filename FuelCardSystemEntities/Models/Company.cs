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
    
    public partial class Company
    {
        public long Company_Id { get; set; }
        public string Company_Name { get; set; }
        public string Company_PostalAddress { get; set; }
        public string Company_PostalCode { get; set; }
        public string Company_Country { get; set; }
        public string Company_City { get; set; }
        public string Company_Phone1 { get; set; }
        public string Company_Phone2 { get; set; }
        public string Company_Email { get; set; }
        public string Company_PIN { get; set; }
        public string CF1 { get; set; }
        public string CF2 { get; set; }
        public string CF3 { get; set; }
        public string CF4 { get; set; }
        public string CF5 { get; set; }
        public string CF6 { get; set; }
        public string CF7 { get; set; }
        public string CF8 { get; set; }
        public string CF9 { get; set; }
        public string CF10 { get; set; }
        public Nullable<bool> Company_IsActive { get; set; }
        public Nullable<bool> Company_IsDeleted { get; set; }
        public Nullable<System.DateTime> Company_DateCreated { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
