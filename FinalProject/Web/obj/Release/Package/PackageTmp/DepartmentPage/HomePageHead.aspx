<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePageHead.aspx.cs" Inherits="AD.HomePageHead" %>

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
                    <asp:MenuItem NavigateUrl="~/DepartmentPage/HomePageHead.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem Text="Show Request" Value="Show Request" NavigateUrl="~/DepartmentPage/ShowRequest.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Delegate Authority" Value="Delegate Authority" NavigateUrl="~/DepartmentPage/DelegateAuthority.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Change Representative" Value="Change Representative" NavigateUrl="~/DepartmentPage/ChangeRepresentative.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <p>
            Welcome Back,
            <asp:Label ID="lab_user" runat="server"></asp:Label>
        </p>
        <asp:Image ID="Image1" runat="server" Height="115px" ImageUrl="~/image/669400e44e72fb1297b21ca2b71fe0ac.jpeg" Width="140px"  />
        <br />
        <br />
        Employee ID:<asp:Label ID="lab_employeeID" runat="server"></asp:Label>
        <br />
        Employee Name:<asp:Label ID="lab_employeeName" runat="server"></asp:Label>
        <br />
        Department:<asp:Label ID="lab_department" runat="server"></asp:Label>
        <br />
        Role:
        <asp:Label ID="lab_userRole" runat="server"></asp:Label>
         <br />
         <asp:Label ID="lab_session" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</body>
</html>
