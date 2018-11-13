using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD
{
    public class AVPricecheck
    {
        public int AVnumber { get; set; }
        public DateTime? Date { get; set; }
        public int? ApproveBy { get; set; }
        public string ABName { get; set; }
        public int? ClerkResponsible { get; set; }
        public string CRName { get; set; }
    }
}