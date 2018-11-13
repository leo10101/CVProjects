<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerAdjustmentVoucherDetails.aspx.cs" Inherits="AD.Store.ManagerAdjustmentVoucherDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField CommandName="Select" HeaderText="Status" ShowHeader="True" Text="Approve" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:Button ID="bt_goback" runat="server" OnClick="Button1_Click" Text="Go Back" />
        <asp:Button ID="btn_Notification" runat="server" Height="21px"  Text="Send Notification" OnClick="btn_Notification_Click" />
        <p>
            <asp:Label ID="lab_successful" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
