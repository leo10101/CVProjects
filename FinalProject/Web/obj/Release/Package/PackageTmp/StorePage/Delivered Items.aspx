<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delivered Items.aspx.cs" Inherits="AD.Store.Delivered_Items" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<br />
			<asp:TextBox ID="TextBox1" runat="server" Width="175px">Please enter PO number</asp:TextBox>
			<br />
			<asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
			<br />
			<asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
			<asp:Label ID="Label13" runat="server" Text="Supplier:"></asp:Label>
			<asp:Label ID="Label14" runat="server" Text=""></asp:Label>
			<br />
			<br />
			<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
				<Columns>

				<asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode">
					<ItemTemplate>
						<asp:Label ID="Label8" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Description" SortExpression="Description">
					<ItemTemplate>
						<asp:Label ID="Label9" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="POQty" SortExpression="Qty">
					<ItemTemplate>
						<asp:Label ID="Label11" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="DeliveredQty" SortExpression="DeliveredQty">
					<ItemTemplate>
						<asp:Textbox ID="Textbox2" runat="server" Text=''></asp:Textbox>
					</ItemTemplate>
				</asp:TemplateField>

			</Columns>
			</asp:GridView>
        	<br />
			<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm" />
			<br />
        </div>
        <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
