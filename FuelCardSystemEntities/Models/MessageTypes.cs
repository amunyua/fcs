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
    
    public partial class MessageTypes
    {
        public long message_type_id { get; set; }
        public string message_type { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
    }
}