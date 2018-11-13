namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RequestDetail
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RequestID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string ItemCode { get; set; }

        [StringLength(50)]
        public string Description { get; set; }

        public int? RequestQty { get; set; }

        public int? CollectionQty { get; set; }

        public int? DisbursementQty { get; set; }
    }
}
