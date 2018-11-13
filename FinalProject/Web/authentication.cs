using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD
{
    public class empauthentication
    {
      
        public static Boolean  EmpAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if (u.Role != "DeptEmp" && u.Role != "DeptRepre")
                return false;
            else
                return true;
        }

        public static Boolean repAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if ( u.Role != "DeptRepre")
                return false;
            else
                return true;
        }

        public static Boolean DeleAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if ( u.Role != "DeptDele"&& u.Role != "DeptDelegate")
                return false;
            else
                return true;
        }

        public static Boolean HeadAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if (u.Role != "DeptHead")
                return false;
            else
                return true;
        }
        public static Boolean HeadandrepAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if (u.Role != "DeptHead"&&u.Role != "DeptDele" && u.Role != "DeptDelegate")
                return false;
            else
                return true;
        }

        public static Boolean ClerkAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if (u.Role != "StoreClerk")
                return false;
            else
                return true;
        }

        public static Boolean SupAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if (u.Role != "StoreSuper")
                return false;
            else
                return true;
        }
        public static Boolean ManagerAuthentication(string username)
        {
            Model1 ctx = new Model1();
            User u = ctx.Users.Where(x => x.UserName == username).First();
            if (u.Role != "StoreManager")
                return false;
            else
                return true;
        }





    }
}