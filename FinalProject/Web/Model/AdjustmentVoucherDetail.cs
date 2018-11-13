namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AdjustmentVoucherDetail
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AVnumber { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string ItemCode { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int? Qty { get; set; }

        public double? Price { get; set; }

        [StringLength(50)]
        public string Reason { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}
