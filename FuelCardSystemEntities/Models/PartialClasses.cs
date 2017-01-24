using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace FuelCardSystemEntities.Models
{
    /// <summary>
    /// These partial classes are required for data validation
    /// <seealso cref="Metadata.cs"/>
    /// <Modified Author>Surendra Yadav</Modified>
    /// <Modified date>18-May-2015</Modified>
    /// </summary>
    [MetadataType(typeof(CommunicationTemplatesMetadata))]
    public partial class CommunicationTemplates
    {
    }

    [MetadataType(typeof(MessageMetadata))]
    public partial class Message
    {
    }

    public partial class Customer
    {
        public int TotalVehicles { get; set; }
    }

    public partial class VwCustomers
    {
        public int TotalVehicles { get; set; }
    }
}
