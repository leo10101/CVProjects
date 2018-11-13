<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupervisorHomePage.aspx.cs" Inherits="AD.Store.SupervisorHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
            <Items>
                <asp:MenuItem NavigateUrl="~/Store/SupervisorHomePage.aspx" Text="Home" Value="Home"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Store/Re_orderTrendReport.aspx" Text="Re_order Trend Report" Value="Re_order Trend Report"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Store/RequisitionTrendReport.aspx" Text="Requisition Trend Report" Value="Requisition Trend Report"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/StorePage/SupervisorAdjustmentVoucher.aspx" Text="Adjustment Voucher" Value="Adjustment Voucher"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Welcome Back"></asp:Label>
        <asp:Label ID="lab_supervisor" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" />
        <br />
        <asp:Label ID="lab_id" runat="server" Text="EmployeeID"></asp:Label>
        <asp:Label ID="lab_employeeID" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_name" runat="server" Text="EmployeeName"></asp:Label>
        <asp:Label ID="lab_employeeName" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_dept" runat="server" Text="Department"></asp:Label>
        <asp:Label ID="lab_department" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_rol" runat="server" Text="Role"></asp:Label>
        <asp:Label ID="lab_role" runat="server"></asp:Label>
    </form>
</body>
</html>
