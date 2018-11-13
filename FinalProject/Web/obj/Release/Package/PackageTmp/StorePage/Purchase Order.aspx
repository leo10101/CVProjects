<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase Order.aspx.cs" Inherits="AD.Store.Purchase_Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<asp:Button ID="Button1" runat="server" Text="Custom Order" OnClick="Button1_Click1" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
				 <asp:ListItem Value="-1">Supplier</asp:ListItem>
			</asp:DropDownList>
        </div>
    	<asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting"  AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
			<Columns>
				<asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode">
					<ItemTemplate>
						<asp:Label ID="Label7" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Category" SortExpression="Category">
					<ItemTemplate>
						<asp:Label ID="Label8" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Description" SortExpression="Description">
					<ItemTemplate>
						<asp:Label ID="Label9" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="ReorderLevel" SortExpression="ReorderLevel">
					<ItemTemplate>
						<asp:Label ID="Label10" runat="server" Text='<%# Bind("ReorderLevel") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="ReorderedQty" SortExpression="ReorderedQty">
					<ItemTemplate>
						<asp:Label ID="Label11" runat="server" Text='<%# Bind("ReorderedQty") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="CurrentQty" SortExpression="CurrentQty">
					<ItemTemplate>
						<asp:Label ID="Label12" runat="server" Text='<%# Bind("CurrentQty") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Qty" SortExpression="Qty">
					<ItemTemplate>
						<asp:textbox ID="textbox1" runat="server" Text='<%# Bind("Qty") %>'></asp:textbox>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="FirstSupp" SortExpression="FirstSupp">
					<ItemTemplate>
						<asp:Label ID="Label14" runat="server" Text='<%# Bind("FirstSupp") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Price" SortExpression="Price">
					<ItemTemplate>
						<asp:Label ID="Label15" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>



				<asp:CommandField ShowDeleteButton="True" />
			</Columns>
		</asp:GridView>
		<asp:Button ID="Button2" runat="server" Text="Place Order" OnClick="Button2_Click" />
    </form>
</body>
</html>
