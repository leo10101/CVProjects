namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Request")]
    public partial class Request
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RequestID { get; set; }

        [StringLength(50)]
        public string DeptCode { get; set; }

        [StringLength(50)]
        public string DeptName { get; set; }

        public int? UserID { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        [StringLength(50)]
        public string ApprovalStatus { get; set; }

        public int? ApprovalBy { get; set; }

        [StringLength(50)]
        public string ABName { get; set; }

        [StringLength(100)]
        public string Comment { get; set; }

        [StringLength(50)]
        public string CollectionStatus { get; set; }

        [StringLength(50)]
        public string CollectionPoint { get; set; }
    }
}
