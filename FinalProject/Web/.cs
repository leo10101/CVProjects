namespace AD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EmployeesBackup")]
    public partial class EmployeesBackup
    {
        [Key]
        [StringLength(10)]
        public string EmployeeID { get; set; }

        [StringLength(10)]
        public string Name { get; set; }

        public int? Age { get; set; }

        public double? Salary { get; set; }
    }
}
