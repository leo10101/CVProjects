<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewDepartment.aspx.cs" Inherits="AD.Store.AddNewDepartment" %>

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
					<td>Department Code:</td>
					<td>
						<asp:TextBox ID="TB_deptCode" runat="server"></asp:TextBox>

					</td>
					<td>Department Name:</td>
					<td>
						<asp:TextBox ID="TB_deptName" runat="server"></asp:TextBox>

					</td>
				</tr>
				<tr>
					<td>Head Title</td>
					<td>
						<asp:TextBox ID="TB_headTitle" runat="server"></asp:TextBox>

					</td>
					<td>Head Name:</td>
					<td>
						<asp:TextBox ID="TB_headName" runat="server"></asp:TextBox>
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
					<td>Telephone:</td>
					<td>
						<asp:TextBox ID="TB_phone" runat="server"></asp:TextBox>
					</td>
					<td>Fax:</td>
					<td>
						<asp:TextBox ID="TB_fax" runat="server"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>Rep Name:</td>
					<td>
						<asp:TextBox ID="TB_repName" runat="server"></asp:TextBox>
					</td>
					<td>Collection Point:</td>
					<td>
						<asp:TextBox ID="TB_collectionPoint" runat="server"></asp:TextBox>
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
			<br />
		</div>
	</form>
</body>
</html>
