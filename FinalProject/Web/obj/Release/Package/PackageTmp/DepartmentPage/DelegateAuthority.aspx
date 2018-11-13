<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DelegateAuthority.aspx.cs" Inherits="AD.DelegateAuthority" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
        <div>
            Current Delegate:<br />
            <br />
&nbsp;
            <asp:TextBox ID="emp" runat="server">emp</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Time" runat="server">YY/MM/DD</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="revoke" runat="server" Text="Revoke" OnClick="revoke_Click" />
            <br />
            <br />
            Choose New Delegate:<br />
            <br />
            <asp:DropDownList ID="drop_employee" runat="server" OnSelectedIndexChanged="drop_employee_SelectedIndexChanged">
<%--                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Mario Speedwagon</asp:ListItem>
                <asp:ListItem>Petey Cruiser</asp:ListItem>
                <asp:ListItem>Anna Sthesia</asp:ListItem>--%>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;<asp:Calendar ID="Calendar3" runat="server" OnSelectionChanged="Calendar3_SelectionChanged"></asp:Calendar>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="delegate" runat="server" Text="Delegate" OnClick="delegate_Click" />
            <asp:Label ID="Lab_successful" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
