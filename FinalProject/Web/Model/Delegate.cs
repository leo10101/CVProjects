namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Delegate")]
    public partial class Delegate
    {
        [Key]
        [Column("Delegate")]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Delegate1 { get; set; }

        public int UserID { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndDate { get; set; }

        public virtual User User { get; set; }
    }
}
