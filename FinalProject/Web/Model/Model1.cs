namespace AD
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model117")
        {
        }

        public virtual DbSet<AdjustmentVoucher> AdjustmentVouchers { get; set; }
        public virtual DbSet<AdjustmentVoucherDetail> AdjustmentVoucherDetails { get; set; }
        public virtual DbSet<CollectionPoint> CollectionPoints { get; set; }
        public virtual DbSet<Delegate> Delegates { get; set; }
        public virtual DbSet<DeliveryOrder> DeliveryOrders { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<RequestDetail> RequestDetails { get; set; }
        public virtual DbSet<Stock> Stocks { get; set; }
        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<TenderPriceList> TenderPriceLists { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdjustmentVoucher>()
                .Property(e => e.ABName)
                .IsUnicode(false);

            modelBuilder.Entity<AdjustmentVoucher>()
                .Property(e => e.CRName)
                .IsUnicode(false);

            modelBuilder.Entity<AdjustmentVoucherDetail>()
                .Property(e => e.ItemCode)
                .IsUnicode(false);

            modelBuilder.Entity<AdjustmentVoucherDetail>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<AdjustmentVoucherDetail>()
                .Property(e => e.Reason)
                .IsUnicode(false);

            modelBuilder.Entity<AdjustmentVoucherDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<CollectionPoint>()
                .Property(e => e.CollectionPoint1)
                .IsUnicode(false);

            modelBuilder.Entity<CollectionPoint>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Delegate>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<DeliveryOrder>()
                .Property(e => e.StoreUserName)
                .IsUnicode(false);

            modelBuilder.Entity<DeliveryOrder>()
                .Property(e => e.ItemCode)
                .IsUnicode(false);

            modelBuilder.Entity<DeliveryOrder>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<DeliveryOrder>()
                .Property(e => e.SuppCode)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.DeptCode)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.DeptName)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.ContactTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.ContactName)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.HeadTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.HeadName)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.CollectionPoint)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.RepName)
                .IsUnicode(false);

            modelBuilder.Entity<PurchaseOrder>()
                .Property(e => e.ItemCode)
                .IsUnicode(false);

            modelBuilder.Entity<PurchaseOrder>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<PurchaseOrder>()
                .Property(e => e.SuppCode)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.DeptCode)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.DeptName)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.ABName)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.Comment)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.CollectionStatus)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.CollectionPoint)
                .IsUnicode(false);

            modelBuilder.Entity<RequestDetail>()
                .Property(e => e.ItemCode)
                .IsUnicode(false);

            modelBuilder.Entity<RequestDetail>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.ItemCode)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.Category)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.UnitOfMeasure)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.FirstSupp)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.SecondSupp)
                .IsUnicode(false);

            modelBuilder.Entity<Stock>()
                .Property(e => e.ThirdSupp)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.SuppCode)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.SuppName)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.ContactTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.ContactName)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.PostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.GSTNo)
                .IsUnicode(false);

            modelBuilder.Entity<TenderPriceList>()
                .Property(e => e.ItemCode)
                .IsUnicode(false);

            modelBuilder.Entity<TenderPriceList>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<TenderPriceList>()
                .Property(e => e.UnitOfMeasure)
                .IsUnicode(false);

            modelBuilder.Entity<TenderPriceList>()
                .Property(e => e.SuppCode)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Role)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.DeptName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.DeptCode)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Delegates)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
