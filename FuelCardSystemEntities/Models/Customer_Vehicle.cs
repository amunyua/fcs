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
    
    public partial class Customer_Vehicle
    {
        public long CustomerVehicleId { get; set; }
        public Nullable<long> Customer_Id { get; set; }
        public Nullable<long> Vehicle_Id { get; set; }
        public Nullable<long> VehicleModel_Id { get; set; }
        public string VehicleRegNo { get; set; }
        public Nullable<decimal> TankCapacity { get; set; }
        public string DaystoFuel { get; set; }
        public Nullable<System.TimeSpan> StartTime { get; set; }
        public Nullable<System.TimeSpan> EndTime { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<long> ProductID { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}
