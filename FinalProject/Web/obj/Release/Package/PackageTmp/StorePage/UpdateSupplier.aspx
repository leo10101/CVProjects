<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSupplier.aspx.cs" Inherits="AD.Store.UpdateSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:GridView ID="GridView_supplier" runat="server" AutoGenerateColumns="False"
				OnRowDeleting="OnRowDeleting"
				OnRowEditing="OnRowEditing"
				OnRowCancelingEdit="OnRowCancelingEdit"
				OnRowUpdating="OnRowUpdating"
				DataKeyNames="SuppCode">
				<Columns>
					<asp:TemplateField HeaderText="Supplier Code" SortExpression="SuppCode">
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("SuppCode") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Supplier Name" SortExpression="SuppName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SuppName") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("SuppName") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Contact Title" SortExpression="ContactTitle">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ContactTitle") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactTitle") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Contact Name" SortExpression="ContactName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Phone" SortExpression="Phone">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label5" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Fax" SortExpression="Fax">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label6" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Address" SortExpression="Address">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Postal Code" SortExpression="PostalCode">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("PostalCode") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label8" runat="server" Text='<%# Bind("PostalCode") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="GST No" SortExpression="GSTNo">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("GSTNo") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# Bind("GSTNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:CommandField ButtonType="Button" ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="False" />
				</Columns>
			</asp:GridView>
			<br />
			<asp:Button ID="Btn_addNew" runat="server" Text="Add New Supplier" OnClick="Btn_addNew_Click" />

		    <asp:Button ID="btn_InformSupplier" runat="server" OnClick="btn_InformSupplier_Click" Text="Inform Supplier" />

		</div>
	</form>
</body>
</html>
