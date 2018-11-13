namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AdjustmentVoucher")]
    public partial class AdjustmentVoucher
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AVnumber { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        public int? ApproveBy { get; set; }

        [StringLength(50)]
        public string ABName { get; set; }

        public int? ClerkResponsible { get; set; }

        [StringLength(50)]
        public string CRName { get; set; }
    }
}
