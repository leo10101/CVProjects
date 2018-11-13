<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewSupplier.aspx.cs" Inherits="AD.Store.AddNewSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<table>
				<tr>
					<td>Supplier Code:</td>
					<td>
						<asp:TextBox ID="TB_suppCode" runat="server"></asp:TextBox>

					</td>
					<td>Supplier Name:</td>
					<td>
						<asp:TextBox ID="TB_suppName" runat="server"></asp:TextBox>

					</td>
				</tr>
				<tr>
					<td>Contact Title:</td>
					<td>
						<asp:TextBox ID="TB_contactTitle" runat="server"></asp:TextBox>

					</td>
					<td>Contact Name:</td>
					<td>
						<asp:TextBox ID="TB_contactName" runat="server"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td>
						<asp:TextBox ID="TB_phone" runat="server"></asp:TextBox>

					</td>
					<td>Fax:</td>
					<td>
						<asp:TextBox ID="TB_fax" runat="server"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>Address:</td>
					<td>
						<asp:TextBox ID="TB_address" runat="server"></asp:TextBox>
					</td>
					<td>Postal Code:</td>
					<td>
						<asp:TextBox ID="TB_postalCode" runat="server"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>GST No.:</td>
					<td>
						<asp:TextBox ID="TB_gst" runat="server"></asp:TextBox>
					</td>
				</tr>
			</table>
			<br />
			<table>
				<tr>
					<td>
						<asp:Button ID="Btn_back" runat="server" Text="Back" OnClick="Btn_back_Click" />
					</td>
					<td>
						<asp:Button ID="Btn_add" runat="server" Text="Add" OnClick="Btn_add_Click" />
					</td>
				</tr>
			</table>

		</div>
	</form>
</body>
</html>
