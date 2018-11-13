<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeRepresentative.aspx.cs" Inherits="AD.ChangeRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            Current Representative&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="emN" runat="server" OnTextChanged="emN_TextChanged">Employee Name</asp:TextBox>
        </div>
        <p>
            Select New Representative&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="dr_NewRep" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="UserName">
                <asp:ListItem>Select Employee</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString4 %>" SelectCommand="select UserName from [User] where Role in('DeptRepre','DeptDelegate','DeptEmp')"></asp:SqlDataSource>
        </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="change" runat="server" Text="Change" OnClick="change_Click" />
            <asp:Label ID="Lab_successful" runat="server"></asp:Label>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send Notification" />
        </p>
        <asp:Label ID="lab_record" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</body>
</html>
