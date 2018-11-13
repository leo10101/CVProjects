<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowRequest.aspx.cs" Inherits="AD.ShowRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:HyperLinkField HeaderText="More Details" NavigateUrl="~/DepartmentPage/ShowRequestDetails.aspx" Text="View Details" />
                    <asp:BoundField DataField="RequestID" HeaderText="RequestID" SortExpression="RequestID" />
                </Columns>
            </asp:GridView>
            <br />
        <asp:Label ID="Lab_Request" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Lab_successful" runat="server"></asp:Label>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
