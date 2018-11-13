using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace AD
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["index"] = 0;

            System.Timers.Timer timer = new System.Timers.Timer(60000);

            timer.Elapsed += new System.Timers.ElapsedEventHandler(Send);

            timer.Start();
        }
        void Session_Start(object sender, EventArgs e)
        {
            Session["sign"] = "";
            Session["id"] = "";
            Session["Title"] = "";
            Session["content"] = "";
            Session["Request"] = "";
            Session["CRName"] = "";
            Application["NoClicked"] = 0;
            Application["AVnumber"] = 0;

        }


        public void Send(object sender, System.Timers.ElapsedEventArgs e)

        {
            System.DateTime currentTime = new System.DateTime();
            currentTime = System.DateTime.Now;
            int year = currentTime.Year;
            int month = currentTime.Month;
            //int day = (int)currentTime.DayOfWeek;
            int day = currentTime.Day;
            int hour = currentTime.Hour;
            int minute = currentTime.Minute;
            if (year == 2018 && month == 8 && day == 6 && hour == 10 && minute == 50)

            {
                string to = "logicuniversityofficial@gmail.com";
                string title = "Deliver Notification";
                string content = "Today is Deliver day,please Deliver your order,Thank you!";
                string Password = "logicuniversity1";
                string[] email = new string[]
              {
                  "lustoreclerk@gmail.com"

              };
                string info = SendEmail.sendEmail(to, Password, title, content, email);
                //Session["inform"] = info;

            }




        }
        public string getcontent()
        {
            string content = "";
            Model1 ctx = new Model1();
            List<Stock> list = new List<Stock>();
            list = ctx.Stocks.Where(x => x.CurrentQty < x.ReorderLevel).ToList();
            for (int i = 0; i < list.Count(); i++)
            {
                content = content + list[i].ItemCode.ToString() + ",\t";

            }
            content = content + "\n These Items'CurrentQty are less than their ReorderLevel,please purchase as soon as possible";
            return content;
        }
        public void Notification(object sender, System.Timers.ElapsedEventArgs e)
        {
            System.DateTime currentTime = new System.DateTime();
            currentTime = System.DateTime.Now;
            int year = currentTime.Year;
            int month = currentTime.Month;
            //int day = (int)currentTime.DayOfWeek;
            int day = currentTime.Day;
            int hour = currentTime.Hour;
            int minute = currentTime.Minute;
            string cont = "";
            string Password = "logicuniversity1";
            //if (year == 2018 && day == 5 && hour == 6 && minute == 12)       
            //if (year == 2018 && month == 8 && day == 6 && hour == 6 && minute == 10)
            //{
                cont = getcontent();

            //}
            if (year == 2018 && month == 8 && day == 6 && hour == 6 && minute == 18)
            {
                string to = "logicuniversityofficial@gmail.com";
                string title = "Stock Level below Notification!";
                string[] email = new string[]
                 {
                  "lustoreclerk@gmail.com"

                 };
                string info = SendEmail.sendEmail(to, Password, title, cont, email);
            }
        }
    }
}