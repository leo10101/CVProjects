namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PurchaseOrder")]
    public partial class PurchaseOrder
    {
        public int ID { get; set; }

        public int POnumber { get; set; }

        [StringLength(50)]
        public string ItemCode { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int? Qty { get; set; }

        public double? Price { get; set; }

        [StringLength(50)]
        public string SuppCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }
    }
}
