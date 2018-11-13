<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClerkHomePage.aspx.cs" Inherits="AD.Store.ClerkHomePage" %>

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
                    <asp:MenuItem NavigateUrl="~/StorePage/ClerkHomePage.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Retrieval Form.aspx" Text="Retrieval Form" Value="Retrieval Form"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Disbursement List.aspx" Text="Disbursement List" Value="Disbursement List"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/ClerkAdjustmentVoucher.aspx" Text="AdjustmentVoucher" Value="AdjustmentVoucher"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Delivered Items.aspx" Text="Delivered Items" Value="Delivered Items"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Purchase Order.aspx" Text="PurchaseOrder" Value="PurchaseOrder"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Stock Level.aspx" Text="StockLevel" Value="StockLevel"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/Update Department.aspx" Text="UpdateDepartment" Value="UpdateDepartment"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/StorePage/UpdateSupplier.aspx" Text="UpdateSupplier" Value="UpdateSupplier"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Welcome Back"></asp:Label>
        <asp:Label ID="lab_clerk" runat="server"></asp:Label>
        <br />
        <asp:Image ID="Image1" runat="server" />
        <br />
        <asp:Label ID="lab_id" runat="server" Text="EmployeeID"></asp:Label>
        <asp:Label ID="lab_employeeID" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_name" runat="server" Text="EmployeeName"></asp:Label>
        <asp:Label ID="lab_employeeName" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_rol" runat="server" Text="Role"></asp:Label>
        <asp:Label ID="lab_role" runat="server"></asp:Label>
    </form>
</body>
</html>
