namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Stock")]
    public partial class Stock
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Stock()
        {
            TenderPriceLists = new HashSet<TenderPriceList>();
        }

        [Key]
        [StringLength(50)]
        public string ItemCode { get; set; }

        public int? BinNo { get; set; }

        [StringLength(50)]
        public string Category { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int? ReorderLevel { get; set; }

        public int? CurrentQty { get; set; }

        public int? ReorderedQty { get; set; }

        public int? OrderedQty { get; set; }

        [StringLength(50)]
        public string UnitOfMeasure { get; set; }

        [StringLength(50)]
        public string FirstSupp { get; set; }

        [StringLength(50)]
        public string SecondSupp { get; set; }

        [StringLength(50)]
        public string ThirdSupp { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TenderPriceList> TenderPriceLists { get; set; }
    }
}
