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
namespace AD
{
    public partial class RequisitionTrend : System.Web.UI.Page
    {
        ReportDocument rptd = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sign"].ToString() == "")
                Response.Redirect("~/LoginNew.aspx");
            Boolean results = empauthentication.SupAuthentication(Session["sign"].ToString());
            if (results == false)
                Response.Redirect("~/LoginNew.aspx");
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Model1 ctx = new Model1();
            rptd.Load(Server.MapPath("RequisitionTrend.rpt"));
            rptd.SetParameterValue("Month1", DropDownList1.SelectedValue);
            rptd.SetParameterValue("Month2", DropDownList2.SelectedValue);
            rptd.SetParameterValue("Month3", DropDownList3.SelectedValue);
            string[] deptList = new string[5] { "", "", "", "", "" };
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    deptList[i] = CheckBoxList1.Items[i].Value;
                }
            }
            rptd.SetParameterValue("Department", deptList);
            Stock s = ctx.Stocks.Where(x => x.Description == DropDownList5.SelectedValue).First();
            string ss = s.ItemCode;
            rptd.SetParameterValue("Item", ss);
            rptd.SetParameterValue("Category", DropDownList4.SelectedValue);

            CrystalReportViewer1.ReportSource = rptd;
            CrystalReportViewer1.DataBind();
        }
    }
}