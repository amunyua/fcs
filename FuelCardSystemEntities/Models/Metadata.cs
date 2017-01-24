using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations.Schema;

namespace FuelCardSystemEntities.Models
{
    /// <summary>
    /// The following MetaData classes are required for validation at server side (PartialClasses.cs is required for it)
    /// <remarks>Created by Surendra Yadav</remarks>
    /// <Modified Author Name>Surendra</Modified>
    /// <Modified Date>18-May-2015</Modified>
    /// </summary>
    public class CommunicationTemplatesMetadata
    {
        [AllowHtml]
        public string Template_Content{ get; set; }
    }

    public class MessageMetadata
    {
        [AllowHtml]
        public string message_body { get; set; }
    }
}
