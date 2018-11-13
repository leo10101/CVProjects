<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseOrder_CustomerOrder.aspx.cs" Inherits="AD.Store.PurchaseOrder_CustomerOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 509px">
    <form id="form1" runat="server">
        <div>
        	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="OnRowDeleting">
				<Columns>
					<asp:BoundField DataField="POnumber" HeaderText="POnumber" SortExpression="POnumber" />
					<asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
					<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
					<asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
					<asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />		
					<asp:CommandField ShowDeleteButton="True" />
				</Columns>
			</asp:GridView>
        	<br />
			<br />
		<asp:Label ID="Label5" runat="server" Text="POnumber"></asp:Label>
		<asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True"></asp:TextBox>
			<br />
			<br />
        </div>
    	<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
		</asp:DropDownList>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString4 %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
		<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="Description" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
		</asp:DropDownList>
		<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$  ConnectionStrings:LogicUniversityConnectionString4  %>" SelectCommand="SELECT [Description] FROM [Stock] WHERE ([Category] = @Category)">
			<SelectParameters>
				<asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" Type="String" />
			</SelectParameters>
		</asp:SqlDataSource>
		<br />
		<asp:Label ID="Label1" runat="server" Text="ItemCode:"></asp:Label>
		<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
		<br />
		<br />
		<asp:Label ID="Label2" runat="server" Text="Quantity:"></asp:Label>
		<asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
		<br />
		<br />
		<asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="RadioButton1_CheckedChanged" />
		<asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" />
		<asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton3_CheckedChanged" />
		<br />
		<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
		<br />
		<asp:Label ID="Label3" runat="server" Text="Price:"></asp:Label>
		<asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" ReadOnly="True"></asp:TextBox>
		<br />
		<br />
		<asp:Label ID="Label4" runat="server" Text="TotalPrice:"></asp:Label>
		<asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
		<br />
		<br />
		<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="Button2" runat="server" Text="Place Order" OnClick="Button2_Click" />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
    </form>
</body>
</html>
