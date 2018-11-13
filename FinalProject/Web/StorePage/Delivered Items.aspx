<%@ Page Language="C#" MasterPageFile="~/Store Clerk.Master" AutoEventWireup="true" CodeBehind="Delivered Items.aspx.cs" Inherits="AD.Store.Delivered_Items" %>
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
            <h2 style="color: #fbc531; font-weight: bold">Delivered Items</h2>

			<table style="width:100%">
				<tr>
					<td style="text-align: right; width: 33%;padding-right:25px;height:40px;">
						<asp:Label ID="Label16" runat="server" Text="PO number:"></asp:Label>
					</td>
					<td style="text-align: left; width: 33%;padding-left:25px;height:40px;">
						<asp:TextBox ID="TextBox1" runat="server" ValidationGroup="Search" ForeColor="Black" ></asp:TextBox>
					</td>
					<td style="text-align: left; width: 33%;padding-left:25px;height:40px;">
						<asp:Button ID="Button1" class="btnYellow" runat="server" Text="Search" OnClick="Button1_Click" ValidationGroup="Search" />
					</td>
				</tr>
                <tr>
					<td style="height:40px; text-align: center" colspan="3">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="POnumber is required" ForeColor="Red" ValidationGroup="Search" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
                </tr>
				<tr>
					<td style="text-align: right; width: 33%;padding-right:25px;height:40px;">
						<asp:Label ID="Label15" runat="server" Text="Delivery Order number:"></asp:Label>
					</td>
					<td style="text-align: left; width: 33%;padding-left:25px;height:40px;">
						<asp:TextBox ID="TextBox2" runat="server" Width="200px" ReadOnly="True" CssClass="t1"  ForeColor="Black" ></asp:TextBox>
					</td>
                    <td style="text-align: left; width: 33%;padding-left:25px;height:40px;"><p>     </p></td>
				</tr>

				<tr>
					<td style="text-align: right; width: 33%;padding-right:25px;height:40px;">
						<asp:Label ID="Label13" runat="server" Text="Supplier:"></asp:Label>
					</td>
					<td style="text-align: left; width: 33%;padding-left:25px;height:40px;">
						<asp:TextBox ID="TextBox3" runat="server" Width="200px" Text="" ReadOnly="True" CssClass="t1"  ForeColor="Black" ></asp:TextBox>
					</td>
                    <td style="text-align: left; width: 33%;padding-left:25px;height:40px;"><p>     </p></td>
				</tr>
			</table>
            <div style="text-align:center;">
                <asp:Label ID="Label17" runat="server" ForeColor="Red"></asp:Label>
            </div>
			<div class="container container-fluid" style="text-align:center;margin-bottom:15px;margin-top:15px;" >
				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="width:100%">
					<Columns>
						<asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode">
							<ItemTemplate>
								<asp:Label ID="Label8" runat="server" Text='<%# Bind("ItemCode") %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="Description" SortExpression="Description">
							<ItemTemplate>
								<asp:Label ID="Label9" runat="server" Text='<%# Bind("Description") %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="POQty" SortExpression="Qty">
							<ItemTemplate>
								<asp:Label ID="Label11" runat="server" Text='<%# Bind("Qty") %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="DeliveredQty" SortExpression="DeliveredQty">
							<ItemTemplate>
								<asp:TextBox ID="Textbox4" runat="server" Text='' style="color:#000000;"></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
			</div>

			<div class="padding2" style="text-align: center">
				<asp:Button ID="Button2" class="btnYellow" runat="server" OnClick="Button2_Click" Text="Confirm" Width="124px" Visible="False" />
				
			</div>

		</div>
</asp:Content>