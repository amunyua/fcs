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
    
    public partial class VehicleModel
    {
        public long VehicleModel_Id { get; set; }
        public string VehicleModel_Name { get; set; }
        public Nullable<bool> VehicleModelIsActive { get; set; }
        public Nullable<bool> VehicleModelIsDeleted { get; set; }
        public Nullable<System.DateTime> VehicleModelDateCreated { get; set; }
        public Nullable<long> VehicleId { get; set; }
        public Nullable<decimal> TankCapacity { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
