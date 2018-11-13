<%@ Page Language="C#" MasterPageFile="~/Store Clerk.Master" AutoEventWireup="true" CodeBehind="Stock Level.aspx.cs" Inherits="AD.Store.Stock_Level" %>
<%--YANGXU--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>

	<style>
		.padding {
			padding-top: 30px;
			padding-right: 10%;
		}

		.padding2 {
			padding-top: 30px;
			padding-bottom: 60px;
		}
        
        .btnYellow {
            font-family: Arial;
            font-size: large;
            height: 35px;
            width: 200px;
            color: #333333;
            background-color: #fbc531;
            border: none;
            margin: 10px;
            font-weight: bold;
        }

		#left {
			float: left;
			padding-top: 30px;
			padding-bottom: 30px;
		}

		#right {
			float: right;
			padding-top: 30px;
			padding-bottom: 30px;
		}

		#GridView1 tr.rowHover:hover {
			background-color: #DDDDDD;
			font-weight: lighter;
		}

		#GridView1 tr {
			color: Black;
			height: 0px;
			text-align: center;
			font-weight: lighter;
			colspan ="100%";
			font-size: 15px;
		}

		#GridView1 th {
			background-color: #808080;
			border: none;
			text-align: center;
			font-weight: bolder;
			font-size: 25px;
			padding: 8px;
			color: Black;
			height: 30px;
		}

		#page {
				background-color: #666666;
			color: white;
			border: none;
			min-height: 500px;
			font-size: 18px;
			font-family: Arial, Helvetica, sans-serif;
			padding-top:10px;
			opacity:0.9;
		}
		</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div id="page" class="container container-fluid" style="text-align: center">
            <h2 style="color: #fbc531; font-weight: bold">Stock Level</h2>

			<table style="width:100%">
				<tr>
					<td style="text-align: center; width: 33%; padding-left: 25px; height: 40px;">
						<asp:Label ID="Label1" runat="server" Text="Select Category"></asp:Label>
					</td>
					<td style="text-align: center; width: 33%; padding-left: 25px; height: 40px;">
						<asp:DropDownList ID="DropDownList_category" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" style="width:250px;color:black;"></asp:DropDownList>
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
					</td>
					<td style="text-align: center; width: 33%; padding-left: 25px; height: 40px;">
						<asp:Button ID="Btn_search" class="btnYellow" runat="server" Text="Search" OnClick="Btn_search_Click" />
					</td>
				</tr>
			</table>
			<br />
			<asp:GridView ID="GridView_stock" runat="server" AutoGenerateColumns="False" style="width:100%;font-size:medium">
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
</asp:Content>