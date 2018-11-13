using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD
{
    public class POList
    {
        public string ItemCode { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public int? ReorderLevel { get; set; }
        public int? CurrentQty { get; set; }
        public int? ReorderedQty { get; set; }
        public int? Qty { get; set; }
        public string FirstSupp { get; set; }
        public double? Price { get; set; }
    }
}