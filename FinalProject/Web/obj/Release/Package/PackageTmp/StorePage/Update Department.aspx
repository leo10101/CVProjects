<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update Department.aspx.cs" Inherits="AD.Store.Update_Department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:GridView ID="GridView_department" runat="server" AutoGenerateColumns="False"
				OnRowDeleting="OnRowDeleting"
				OnRowEditing="OnRowEditing"
				OnRowCancelingEdit="OnRowCancelingEdit"
				OnRowUpdating="OnRowUpdating"
				DataKeyNames="DeptCode" >
				<Columns>
					<asp:TemplateField HeaderText="Department Code" SortExpression="DeptCode">
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("DeptCode") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Department Name" SortExpression="DeptName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeptName") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
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
					<asp:TemplateField HeaderText="Head Title" SortExpression="HeadTitle">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("HeadTitle") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("HeadTitle") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Head Name" SortExpression="HeadName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("HeadName") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label8" runat="server" Text='<%# Bind("HeadName") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Collection Point" SortExpression="CollectionPoint">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("CollectionPoint") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# Bind("CollectionPoint") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Rep Name" SortExpression="RepName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RepName") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label10" runat="server" Text='<%# Bind("RepName") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:CommandField ButtonType="Button" ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="False" />
				</Columns>
			</asp:GridView>
			<br />
			<asp:Button ID="Btn_addNew" runat="server" Text="Add New Department" OnClick="Btn_addNew_Click" Width="141px" />
		    <asp:Button ID="btn_Inform" runat="server" OnClick="btn_Inform_Click" Text="Inform Department" Width="138px" />
		</div>
	</form>
</body>
</html>
