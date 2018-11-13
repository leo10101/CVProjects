using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//ZHAOYINQING 
namespace AD
{
    public class DepartmentBusinessLogic
    {
      
        public static List<User> ListAllUser()
        {
            using (Model1 entities = new Model1())
            {
               return entities.Users.ToList<User>();
            }
        }
   
        public static void ChangeCollectionPoint(string deptCode, string deptName, string collectionpoints)
        {
            using (Model1 entities = new Model1())
            {
                Department dept = entities.Departments.Where(p => p.DeptCode == deptCode).First<Department>();
                dept.DeptName = deptName;
                dept.CollectionPoint = collectionpoints;
                entities.SaveChanges();
            }
        }
      
        public static void ChangeRepresentative(int userid, string username, string role)
        {
            using (Model1 entities = new Model1())
            {
                User user = entities.Users.Where(p => p.UserID == userid).First<User>();
                user.UserName = username;
                user.Role = role;
                entities.SaveChanges();
            }
        }

        public static void ChangeDelegate(int id, string username, string role)
        {
            using (Model1 entities = new Model1())
            {
                User user = entities.Users.Where(p => p.UserID == id).First<User>();
                user.UserName = username;
                user.Role = role;
                entities.SaveChanges();
            }
        }

        public static List<User> ListUserByName(string username)
        {
            using (Model1 entities = new Model1())
            {
                return entities.Users.Where(p => p.UserName ==username).ToList<User>();
            }
        }
        
        public static List<string> ListUserByDeptName(string deptname)
        {
            using (Model1 entities = new Model1())
            {
              //  ArrayList userNames = new ArrayList();
                List<string> userList = entities.Users.Where(p => p.DeptName.Equals(deptname) && p.Role.Equals("DeptEmp")).Select(p=>p.UserName).ToList();
                //for (int i = 0; i < userList.Count; i++)
                //{
                //    userNames.Add(userList[i].UserName);
                //}
                return userList;
            }
        }
        public static List<RequestDetail> ListRequestByID(int RequestID)
        {
            using (Model1 entities = new Model1())
            {
                return entities.RequestDetails.Where(p => p.RequestID == RequestID).ToList<RequestDetail>();
            }
        }
        public static List<RequestDetail> GetRequestDetailsByID(int requestID)
        {
            using (Model1 entities = new Model1())
            {
                return entities.RequestDetails.Where(p => p.RequestID == requestID).ToList<RequestDetail>();
            }
        }
        public static List<User> GetUserExceptHead(string role)
        {
            using (Model1 entities = new Model1())
            {
                return entities.Users.Where(p => p.Role ==role).ToList<User>();
            }
        }
        public static void AddDelegate(int delegates, int userID, string userName, DateTime startDate, DateTime endDate)
        {
            using (Model1 entities = new Model1())
            {
                Delegate dele = new Delegate
                {
                    Delegate1 = delegates,
                    UserID = userID,
                    UserName=userName,
                    StartDate=startDate,
                    EndDate=endDate,
                };
                entities.Delegates.Add(dele);
                entities.SaveChanges();
            }
        }
       public static List<Request> GetRequest()
        {
            Model1 ctx = new Model1();
            List<Request> ReqList = ctx.Requests.ToList<Request>();
            ArrayList al = new ArrayList(ReqList);
          // Session["al"] = al;
            return ctx.Requests.ToList<Request>();
        }
        public static void ChangeRequestAsApprove(int requestID, string ApprovalStatus)
        {
            using (Model1 entities = new Model1())
            {
                Request req = entities.Requests.Where(p => p.RequestID == requestID).First<Request>();
                req.ApprovalStatus = ApprovalStatus;
                entities.SaveChanges();
            }
        }
        public static void ChangeRequestAsReject(int requestID, string ApprovalStatus,string comments)
        {
            using (Model1 entities = new Model1())
            {
                Request req = entities.Requests.Where(p => p.RequestID == requestID).First<Request>();
                req.ApprovalStatus = ApprovalStatus;
                req.Comment = comments;
                entities.SaveChanges();
            }
        }
        public static List<Stock> MakeRequest(string categroy,string description)
        {
            using (Model1 entities = new Model1())
            {
                return entities.Stocks.Where(p => p.Description == description && p.Category==categroy).ToList<Stock>();
            }
        }
        public static void AddRequest(int RequestID, string DeptCode, string DeptName, int UserID, string UserName,DateTime Date,string ApprovalStatus, int ApprovalBy,string ABName,string Comment ,string CollectionStatus,string CollectionPoint)
        {
            using (Model1 entities = new Model1())
            {
                Request request = new Request
                {
                    RequestID=RequestID,
                    DeptCode=DeptCode,
                    DeptName=DeptName,
                    UserID=UserID,
                    UserName=UserName,
                    Date=Date,
                    ApprovalStatus=ApprovalStatus,
                    ApprovalBy=ApprovalBy,
                    ABName=ABName,
                    Comment=Comment,
                    CollectionPoint=CollectionPoint,
                    CollectionStatus=CollectionStatus,
                };
                entities.Requests.Add(request);
                entities.SaveChanges();
            }
        }

        public static void AddRequestDetails(int RequestID,string ItemCode,string Description,int RequestQty,int CollectionQty,int DisbursementQty)
        {
            using (Model1 entities = new Model1())
            {
                RequestDetail requestDetail = new RequestDetail
                {
                    RequestID = RequestID,
                    ItemCode=ItemCode,
                    Description=Description,
                    RequestQty=RequestQty,
                    CollectionQty=CollectionQty,
                    DisbursementQty=DisbursementQty,
                 //   Item=Item,
                //    Unit_of_Measure=UnitOfMeasure,
                };
                entities.RequestDetails.Add(requestDetail);
                entities.SaveChanges();
            }
        }
        public static void changeDelegatefromdelegate(int delega, int userID, string userName, DateTime startDate, DateTime endDate)
        {
            using (Model1 entities = new Model1())
            {
                Delegate delegates = entities.Delegates.Where(p => p.Delegate1 == delega).First<Delegate>();
                delegates.Delegate1 = delega;
                delegates.UserID = userID;
                delegates.UserName = userName;
                delegates.StartDate = startDate;
                delegates.EndDate = endDate;
                entities.SaveChanges();
            }
        }
        public static List<RequestDetail> ListREBy(int ReID)
        {
            using (Model1 entities = new Model1())
            {
                return entities.RequestDetails.Where(p => p.RequestID == ReID).ToList<RequestDetail>();
            }
        }
        public static void AddReDetails(int ReID, string ItemCode, string desp, int qty,int Cqty,int Dqty)
        {
            using (Model1 entities = new Model1())
            {
                RequestDetail request = new RequestDetail
                {
                    RequestID = ReID,
                    ItemCode = ItemCode,
                    Description = desp,
                    RequestQty = qty,
                    CollectionQty = Cqty,
                    DisbursementQty=Dqty
                };
                entities.RequestDetails.Add(request);
                entities.SaveChanges();
            }
        }
        //Request gv delete
        public static void DeleteItem(int ReID, string itemCode)
        {
            using (Model1 entities = new Model1())
            {
                RequestDetail request = entities.RequestDetails.Where(p => p.RequestID == ReID && p.ItemCode == itemCode).First<RequestDetail>();
                entities.RequestDetails.Remove(request);
                entities.SaveChanges();
            }
        }
        public static List<Request> GetRequestByPending()
        {
            using (Model1 entities = new Model1())
            {
                return entities.Requests.Where(p => p.ApprovalStatus == "Pending").ToList<Request>();
            }
        }
        public static List<User> Listrepresentative(string deptcode)
        {
            using (Model1 entities = new Model1())
            {
                return entities.Users.Where(p => p.DeptCode == deptcode && (p.Role == "DeptEmp" || p.Role == "DeptRepre")).ToList<User>();
            }
        }
    }
}