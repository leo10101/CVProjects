<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerHomePage.aspx.cs" Inherits="AD.Store.ManagerHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="~/Store/SupervisorHomePage.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Manager_AdjustmentVoucher.aspx" Text="AdjustmentVoucher" Value="AdjustmentVoucher"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Welcome Back"></asp:Label>
        <asp:Label ID="lab_name" runat="server"></asp:Label>
        <br/>
        <asp:Image ID="Image1" runat="server" />
        <br/>
        <asp:Label ID="lab_emp" runat="server" Text="EmployeeID"></asp:Label>
        <asp:Label runat="server" Text="lab_employeeid"></asp:Label>
        <br/>
        <asp:Label ID="lab_empName" runat="server" Text="EmployeeName"></asp:Label>
        <asp:Label ID="lab_employeeName" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_dept" runat="server" Text="Department"></asp:Label>
        <asp:Label ID="lab_department" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_rol" runat="server" Text="Role"></asp:Label>
        <asp:Label ID="lab_role" runat="server"></asp:Label>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
