using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD
{
    public class RequestSTATUS
    {
        public string ApprovalStatus { get; set; }
        public int RequestID { get; set; }
        public string ItemCode { get; set; }
        public string Description { get; set; }
        public int? RequestQty { get; set; }
        public int? CollectionQty { get; set; }
        public int? DisbursementQty { get; set; }
    }

}