namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TenderPriceList")]
    public partial class TenderPriceList
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PriceCode { get; set; }

        [StringLength(50)]
        public string ItemCode { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        [StringLength(50)]
        public string UnitOfMeasure { get; set; }

        public double? Price { get; set; }

        [StringLength(50)]
        public string SuppCode { get; set; }

        public virtual Stock Stock { get; set; }
    }
}
