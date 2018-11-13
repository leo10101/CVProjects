namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CollectionPoint")]
    public partial class CollectionPoint
    {
        [Key]
        [Column("CollectionPoint")]
        [StringLength(50)]
        public string CollectionPoint1 { get; set; }

        [StringLength(100)]
        public string Description { get; set; }
    }
}
