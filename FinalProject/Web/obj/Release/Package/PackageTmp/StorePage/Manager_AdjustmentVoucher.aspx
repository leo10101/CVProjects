<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager_AdjustmentVoucher.aspx.cs" Inherits="AD.Store.Manager_AdjustmentVoucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
        </div>
    </form>
</body>
</html>
