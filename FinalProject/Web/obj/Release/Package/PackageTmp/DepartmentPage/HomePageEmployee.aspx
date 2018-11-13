<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePageEmployee.aspx.cs" Inherits="AD.HomePageEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu3" runat="server" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="~/DepartmentPage/HomePageEmployee.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/DepartmentPage/MakeRequest.aspx" Text="MakeRequest" Value="MakeRequest"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/DepartmentPage/ChangeCollectionPoint.aspx" Text="ChangeCollectionPoint" Value="ChangeCollectionPoint"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <br />
            Welcome Back
            <asp:Label ID="lab_user" runat="server"></asp:Label>
        </div>
        <p>
            <asp:Image ID="Image1" runat="server" Height="207px" Width="246px" ImageUrl="~/image/image.jpg" />
        </p>
        <p>
            <asp:Label ID="EmID" runat="server" Text="Employee ID:"></asp:Label>
            <asp:Label ID="lab_employeeID" runat="server"></asp:Label>
            </p>
        <p>
            <asp:Label ID="EmN" runat="server" Text="Employee Name:"></asp:Label>
            &nbsp;<asp:Label ID="lab_employeeName" runat="server"></asp:Label>
            </p>
        <p>
            <asp:Label ID="Dep" runat="server" Text="Department:"></asp:Label>
            &nbsp;<asp:Label ID="lab_department" runat="server"></asp:Label>
            </p>
        <p>
            <asp:Label ID="Role" runat="server" Text="Role:"></asp:Label>
        <asp:Label ID="lab_userRole" runat="server"></asp:Label>
        </p>
          <asp:Label ID="lab_session" runat="server" Text="Label"></asp:Label>
          <p>
              &nbsp;</p>
          <br />
    </form>
</body>
</html>
