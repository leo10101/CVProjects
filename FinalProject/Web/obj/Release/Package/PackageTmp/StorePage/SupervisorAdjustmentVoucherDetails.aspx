<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupervisorAdjustmentVoucherDetails.aspx.cs" Inherits="AD.Store.SupervisorAdjustmentVoucherDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <p>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField CommandName="Select" HeaderText="Status" ShowHeader="True" Text="Approve" />
                </Columns>
            </asp:GridView>
        </p>
        </div>
        <p>
            <%-- <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Approve" />--%>
        </p>
        <asp:Button ID="bt_back" runat="server" Text="Go Back" OnClick="lab_approve_Click" />
        <asp:Button ID="btn_Notification" runat="server" OnClick="btn_Notification_Click" Text="Send Notification" />
        <p>
            &nbsp;</p>
        <asp:Label ID="lab_successful" runat="server"></asp:Label>
    </form>
</body>
</html>
