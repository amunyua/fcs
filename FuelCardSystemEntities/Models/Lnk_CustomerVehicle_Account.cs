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
    
    public partial class Lnk_CustomerVehicle_Account
    {
        public long Lnk_id { get; set; }
        public Nullable<long> Lnk_CustomerVehicleId { get; set; }
        public Nullable<long> Lnk_AccountNumber { get; set; }
        public Nullable<bool> Lnk_IsDeleted { get; set; }
        public Nullable<bool> Lnk_IsActive { get; set; }
        public Nullable<System.DateTime> Lnk_DateCreated { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
