<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock Level.aspx.cs" Inherits="AD.Store.Stock_Level" %>

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
					<td>
						<asp:Label ID="Label1" runat="server" Text="Select Category"></asp:Label>
					</td>
					<td>
						<asp:DropDownList ID="DropDownList_category" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
					</td>
					<td>
						<asp:Button ID="Btn_search" runat="server" Text="Search" OnClick="Btn_search_Click" />
					</td>
				</tr>
			</table>
			<br />
			<asp:GridView ID="GridView_stock" runat="server" AutoGenerateColumns="False">
				<Columns>
					<asp:BoundField DataField="BinNo" HeaderText="Bin No" SortExpression="BinNo" />
					<asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
					<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
					<asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level" SortExpression="ReorderLevel" />
					<asp:BoundField DataField="CurrentQty" HeaderText="Current Qty" SortExpression="CurrentQty" />
					<asp:BoundField DataField="ReorderedQty" HeaderText="Reordered Qty" SortExpression="ReorderedQty" />
					<asp:BoundField DataField="UnitofMeasure" HeaderText="Unit of Measur" SortExpression="UnitofMeasur" />
				</Columns>
			</asp:GridView>

		</div>
	</form>
</body>
</html>
