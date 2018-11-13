using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD
{
    public class StoreBusinessLogic
    {
        
        //department update businesslogic
        public static List<Department> AllDepartment()
        {
            using (Model1 entities = new Model1())
            {
                return entities.Departments.ToList<Department>();
            }
        }
        //
        public static void AddNewDepartment(string deptcode, string deptname, string contactname,
          string phone, string fax, string headname, string collectionpoint, string repname,
          string contacttitle, string headtitle)
        {
            using (Model1 entities = new Model1())
            {
                Department department = new Department()
                {
                    DeptCode = deptcode,
                    DeptName = deptname,
                    ContactName = contactname,
                    Phone = phone,
                    Fax = fax,
                    HeadName = headname,
                    CollectionPoint = collectionpoint,
                    RepName = repname,
                    ContactTitle = contacttitle,
                    HeadTitle = headtitle,
                };
                entities.Departments.Add(department);
                entities.SaveChanges();
            }
        }
        public static void EditDepartment(string deptcode, string deptname, string contactname,
         string phone, string fax, string headname, string collectionpoint, string repname,
         string contacttitle, string headtitle)
        {
            using (Model1 entities = new Model1())
            {
                Department department = entities.Departments.Where(p => p.DeptCode == deptcode).First<Department>();
                department.DeptName = deptname;
                department.ContactName = contactname;
                department.Phone = phone;
                department.Fax = fax;
                department.HeadName = headname;
                department.CollectionPoint = collectionpoint;
                department.RepName = repname;
                department.HeadTitle = headtitle;
                department.ContactTitle = contacttitle;
                entities.SaveChanges();
            }
        }

        public static void DeleteDepartment(string deptcode)
        {
            using (Model1 entities = new Model1())
            {
                Department department = entities.Departments.Where(p => p.DeptCode == deptcode).First<Department>();
                entities.Departments.Remove(department);
                entities.SaveChanges();
            }
        }

        //stock level businessLogic
        public static List<Stock> AllStock()
        {
            using (Model1 entities = new Model1())
            {
                return entities.Stocks.ToList<Stock>();
            }
        }
        public static List<Stock> GetStockByCategory(string category)
        {
            using (Model1 entities = new Model1())
            {
                return entities.Stocks.Where(p => p.Category == category).ToList<Stock>();
            }
        }
        //supplier update business logic
        public static List<Supplier> AllSupplier()
        {
            using (Model1 entities = new Model1())
            {
                return entities.Suppliers.ToList<Supplier>();
            }
        }
        public static void AddNewSupplier(string suppcode, string suppname, string contacttitle, string contactname,
           string phone, string fax, string address, string postcode, string gst)
        {
            using (Model1 entities = new Model1())
            {
                Supplier supplier = new Supplier()
                {
                    SuppCode = suppcode,
                    SuppName = suppname,
                    ContactTitle = contacttitle,
                    ContactName = contactname,
                    Phone = phone,
                    Fax = fax,
                    Address = address,
                    PostalCode = postcode,
                    GSTNo = gst,
                };
                entities.Suppliers.Add(supplier);
                entities.SaveChanges();
            }
        }
        public static void EditSupplier(string suppcode, string suppname, string contacttitle, string contactname, string phone, string fax, string address, string postcode, string gst)
        {
            using (Model1 entities = new Model1())
            {
                Supplier supplier = entities.Suppliers.Where(p => p.SuppCode == suppcode).First<Supplier>();
                supplier.SuppName = suppname;
                supplier.ContactTitle = contacttitle;
                supplier.ContactName = contactname;
                supplier.Phone = phone;
                supplier.Fax = fax;
                supplier.Address = address;
                supplier.PostalCode = postcode;
                supplier.GSTNo = gst;
                entities.SaveChanges();
            }
        }
        public static void DeleteSupplier(string suppcode)
        {
            using (Model1 entities = new Model1())
            {
                Supplier supplier = entities.Suppliers.Where(p => p.SuppCode == suppcode).First<Supplier>();
                entities.Suppliers.Remove(supplier);
                entities.SaveChanges();
            }
        }

        public static List<AdjustmentVoucher> GetAdjust()
        {
            using (Model1 entities = new Model1())
            {
                return entities.AdjustmentVouchers.ToList<AdjustmentVoucher>();
            }
        }
        public static List<AdjustmentVoucherDetail> GetAdjustbYidSuper(int id)
        {
            using (Model1 entities = new Model1())
            {
                return entities.AdjustmentVoucherDetails.Where(p => p.AVnumber == id&&p.Price<250).ToList<AdjustmentVoucherDetail>();
            }
        }

        public static List<AdjustmentVoucherDetail> GetAdjustbYidMang(int id)
        {
            using (Model1 entities = new Model1())
            {
                return entities.AdjustmentVoucherDetails.Where(p => p.AVnumber == id && p.Price >=250).ToList<AdjustmentVoucherDetail>();
            }
        }
        public static void EditAdjust(int avnumber, string itemcode, string status)
        {
            using (Model1 entities = new Model1())
            {
                //AdjustmentVoucherDetail adjustdetail = entities.AdjustmentVoucherDetails.Where(p => p.AVnumber == avnumber && p.ItemCode==itemcode).First<AdjustmentVoucherDetail>();
                AdjustmentVoucherDetail adjustdetail = entities.AdjustmentVoucherDetails.Where(p => p.AVnumber == avnumber && p.ItemCode == itemcode).First<AdjustmentVoucherDetail>();
                adjustdetail.Status = status;
                entities.SaveChanges();
            }
        }

        public static void AddAdjustmentVoucherDetails(int AVnumber, string ItemCode, string Description, int Qty, double Price, string Reason)
        {
            using (Model1 entities = new Model1())
            {
                AdjustmentVoucherDetail AdjustmentVoucherDetail = new AdjustmentVoucherDetail
                {
                    AVnumber = AVnumber,
                    ItemCode = ItemCode,
                    Description = Description,
                    Qty = Qty,
                    Price = Price,
                    Reason = Reason
                };
                entities.AdjustmentVoucherDetails.Add(AdjustmentVoucherDetail);
                entities.SaveChanges();
            }
        }
        //YANGXU
        //purchase order businesslogic
        public static void AddPO(int POnum, string ItemCode, string desp, int qty, double price, string suppCode)
        {
            using (Model1 entities = new Model1())
            {
                PurchaseOrder pod = new PurchaseOrder
                {
                    POnumber = POnum,
                    ItemCode = ItemCode,
                    Description = desp,
                    Qty = qty,
                    Price = price,
                    SuppCode = suppCode,
                };
                entities.PurchaseOrders.Add(pod);
                entities.SaveChanges();
            }
        }
        //YANGXU
        public static void AddDO(int DOnum, int POnum, string ItemCode, string desp, int POQty, int DeliveredQty, string suppcode)
        {
            using (Model1 entities = new Model1())
            {
                DeliveryOrder pod = new DeliveryOrder
                {
                    DOnumber = DOnum,
                    POnumber = POnum,
                    ItemCode = ItemCode,
                    Description = desp,
                    POQty = POQty,
                    DeliveredQty = DeliveredQty,
                    SuppCode = suppcode,
                };
                entities.DeliveryOrders.Add(pod);
                entities.SaveChanges();
            }
        }
        //YANGXU
        public static List<PurchaseOrder> ListPoBy(int POnum)
        {
            using (Model1 entities = new Model1())
            {
                return entities.PurchaseOrders.Where(p => p.POnumber == POnum).ToList<PurchaseOrder>();
            }
        }
        //YANGXU
        public static List<Supplier> ListSupp()
        {
            using (Model1 entities = new Model1())
            {
                return entities.Suppliers.ToList<Supplier>();
            }
        }
        //YANGXU
        //RePO delete
        public static void DeleteItem(int POnum, string itemCode)
        {
            using (Model1 entities = new Model1())
            {
                PurchaseOrder pod = entities.PurchaseOrders.Where(p => p.POnumber == POnum && p.ItemCode == itemCode).First<PurchaseOrder>();
                entities.PurchaseOrders.Remove(pod);
                entities.SaveChanges();
            }
        }

        //YANGXU
        public static List<POList> GetPOListAll()
        {
            using (Model1 entities = new Model1())
            {
                IQueryable<POList> polist = from a in entities.Stocks
                                            from b in entities.TenderPriceLists
                                            where a.ItemCode == b.ItemCode && a.FirstSupp == b.SuppCode
                                            && a.ReorderLevel > (a.CurrentQty + a.OrderedQty)
                                            select new POList
                                            {
                                                ItemCode = a.ItemCode,
                                                Category = a.Category,
                                                Description = a.Description,
                                                ReorderLevel = a.ReorderLevel,
                                                ReorderedQty = a.ReorderedQty,
                                                CurrentQty = a.CurrentQty,
                                                Qty = ((a.ReorderLevel - a.CurrentQty) / a.ReorderedQty + 1) * a.ReorderedQty,
                                                FirstSupp = a.FirstSupp,
                                                Price = b.Price
                                            };

                return polist.ToList();
            }
        }
        //YANGXU
        //PO POSupp
        public static List<POList> GetPOListAll(string supp)
        {
            using (Model1 entities = new Model1())
            {
                IQueryable<POList> polist = from a in entities.Stocks
                                            from b in entities.TenderPriceLists
                                            where a.ItemCode == b.ItemCode && a.FirstSupp == b.SuppCode
                                            && a.ReorderLevel > (a.CurrentQty + a.OrderedQty) && a.FirstSupp == supp
                                            select new POList
                                            {
                                                ItemCode = a.ItemCode,
                                                Category = a.Category,
                                                Description = a.Description,
                                                ReorderLevel = a.ReorderLevel,
                                                ReorderedQty = a.ReorderedQty,
                                                CurrentQty = a.CurrentQty,
                                                Qty = ((a.ReorderLevel - a.CurrentQty) / a.ReorderedQty + 1) * a.ReorderedQty,
                                                FirstSupp = a.FirstSupp,
                                                Price = b.Price
                                            };

                return polist.ToList();
            }
        }
        //YANGXU
        public static List<RequestSTATUS> GetRetriecvalStatus()
        {
            using (Model1 entities = new Model1())
            {
                //string approvals = "Approve";
                IQueryable<RequestSTATUS> requestStatus = from a in entities.RequestDetails
                                                          from b in entities.Requests
                                                          where a.RequestID == b.RequestID && b.ApprovalStatus == "Approve"
                                                          && a.RequestQty > a.CollectionQty
                                                          select new RequestSTATUS
                                                          {
                                                              RequestID = b.RequestID,
                                                              ItemCode = a.ItemCode,
                                                              Description = a.Description,
                                                              RequestQty = a.RequestQty,
                                                              CollectionQty = a.CollectionQty,
                                                              DisbursementQty = a.DisbursementQty
                                                          };
                return requestStatus.ToList();
            }
        }

        //YANGXU
        public static void UpdateOrder(int RequestID, string Description, int RequestQty, int CollectionQty)
        {
            using (Model1 entities = new Model1())
            {
                RequestDetail reD = entities.RequestDetails.Where(p => (p.RequestID == RequestID) && (p.Description == Description)).First<RequestDetail>();
                reD.CollectionQty = CollectionQty;

                entities.SaveChanges();
            }
        }
        public static void Disburse(int RequestID, string itemcode, int DisbursementQty)
        {
            using (Model1 entities = new Model1())
            {
                RequestDetail reD = entities.RequestDetails.Where(p => (p.RequestID == RequestID) && (p.ItemCode == itemcode)).First<RequestDetail>();
                reD.DisbursementQty = DisbursementQty;

                entities.SaveChanges();
            }
        }

        public static void UpdateStock(string itemCode, int orderedQty)
        {
            using (Model1 entities = new Model1())
            {
                Stock s = entities.Stocks.Where(p => p.ItemCode == itemCode).First<Stock>();
                s.OrderedQty = orderedQty;
                entities.SaveChanges();
            }
        }
        public static void UpdateStock(string itemCode, int currentQty, int orderedQty)
        {
            using (Model1 entities = new Model1())
            {
                Stock s = entities.Stocks.Where(p => p.ItemCode == itemCode).First<Stock>();
                s.CurrentQty = currentQty;
                s.OrderedQty = orderedQty;
                entities.SaveChanges();
            }
        }

        public static List<AVPricecheck> GetAVListSup()
        {
            using (Model1 entities = new Model1())

                {
                    IQueryable<AVPricecheck> avlistsup = from a in entities.AdjustmentVouchers
                                                join b in entities.AdjustmentVoucherDetails on a.AVnumber equals b.AVnumber into Adjv
                                                let adjvlast = Adjv.OrderByDescending(a=>a.AVnumber).FirstOrDefault()
                                                where adjvlast.Price < 250
                                                select new AVPricecheck
                                                {
                                                    AVnumber=a.AVnumber,
                                                    Date = a.Date,
                                                    ApproveBy=a.ApproveBy,
                                                    ABName=a.ABName,
                                                    ClerkResponsible=a.ClerkResponsible,
                                                    CRName=a.CRName
                                                };

                    return avlistsup.ToList();
                }
        }

        public static List<AVPricecheck> GetAVListMan()
        {
            using (Model1 entities = new Model1())

            {
                IQueryable<AVPricecheck> avlistman = from a in entities.AdjustmentVouchers
                                                     join b in entities.AdjustmentVoucherDetails on a.AVnumber equals b.AVnumber into Adjv
                                                     let adjvlast = Adjv.OrderByDescending(a => a.AVnumber).FirstOrDefault()
                                                     where adjvlast.Price > 250
                                                     select new AVPricecheck
                                                     {
                                                         AVnumber = a.AVnumber,
                                                         Date = a.Date,
                                                         ApproveBy = a.ApproveBy,
                                                         ABName = a.ABName,
                                                         ClerkResponsible = a.ClerkResponsible,
                                                         CRName = a.CRName
                                                     };

                return avlistman.ToList();
            }
        }












    }
}