using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;
//Jerome
namespace AD.StorePage
{
    public partial class ReorderTrendPg : System.Web.UI.Page
    {
        ReportDocument rptd = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if does not run, Copy aspnet_client folder from c:\inetpub\wwwroot folder to the new website root folder.
            //issues with chart loading, visit stackoverflow.com/questions/46447294/crystal-report-image-issue
            rptd.Load(Server.MapPath("ReorderTrend.rpt"));
            rptd.SetParameterValue("Month1", DropDownList1.SelectedValue);
            rptd.SetParameterValue("Month2", DropDownList2.SelectedValue);
            rptd.SetParameterValue("Month3", DropDownList3.SelectedValue);
            CrystalReportViewer1.ReportSource = rptd;
            CrystalReportViewer1.DataBind();
        }
    }
}