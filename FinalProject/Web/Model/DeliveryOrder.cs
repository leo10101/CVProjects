namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DeliveryOrder")]
    public partial class DeliveryOrder
    {
        public int ID { get; set; }

        public int DOnumber { get; set; }

        public int POnumber { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        public int? StoreUserID { get; set; }

        [StringLength(50)]
        public string StoreUserName { get; set; }

        [StringLength(50)]
        public string ItemCode { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int? POQty { get; set; }

        public int? DeliveredQty { get; set; }

        [StringLength(50)]
        public string SuppCode { get; set; }
    }
}
