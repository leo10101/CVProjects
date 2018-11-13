<%@ Page Language="C#"  MasterPageFile="~/Store Clerk.Master" CodeBehind="AddNewSupplier.aspx.cs" Inherits="AD.Store.AddNewSupplier" %>
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
            width: 250px;
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

	<div id="page" class="container container-fluid" style="width:100%;text-align:center;">
        <h2 style="color: #fbc531; font-weight: bold">Add New Supplier</h2>

			<table style="width:100%;">
				<tr>
					<td style="height:40px;">Supplier Code:</td>
					<td>
						<asp:TextBox ID="TB_suppCode" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_suppCode"></asp:RequiredFieldValidator>

					</td>
					<td>Supplier Name:</td>
					<td>
						<asp:TextBox ID="TB_suppName" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_suppName"></asp:RequiredFieldValidator>

					</td>
				</tr>
				<tr>
					<td style="height:40px;">Contact Title:</td>
					<td>
						<asp:TextBox ID="TB_contactTitle" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_contactTitle"></asp:RequiredFieldValidator>

					</td>
					<td>Contact Name:</td>
					<td>
						<asp:TextBox ID="TB_contactName" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_contactName"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td style="height:40px;">Phone:</td>
					<td>
						<asp:TextBox ID="TB_phone" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_phone"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid  Phone Number" ControlToValidate="TB_phone" ForeColor="Red" ValidationExpression="\+65\d{8}"></asp:RegularExpressionValidator>

					</td>
					<td>Fax:</td>
					<td>
						<asp:TextBox ID="TB_fax" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_fax"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid  Fax Number" ControlToValidate="TB_fax" ForeColor="Red" ValidationExpression="\+65\d{8}"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr>
					<td style="height:40px;">Address:</td>
					<td>
						<asp:TextBox ID="TB_address" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_address"></asp:RequiredFieldValidator>
					</td>
					<td>Postal Code:</td>
					<td>
						<asp:TextBox ID="TB_postalCode" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_postalCode"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid  Postal Code" ControlToValidate="TB_postalCode" ForeColor="Red" ValidationExpression="[1-9]\d{5}(?!\d)"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr>
					<td style="height:40px;">GST No.:</td>
					<td>
						<asp:TextBox ID="TB_gst" runat="server" style="color:black"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TB_gst"></asp:RequiredFieldValidator>
					</td>
				</tr>
			</table>
			<br />
			<table style="width:100%;">
				<tr>
					<td>
						<asp:Button class="btnYellow" ID="Btn_back" runat="server" Text="Back" OnClick="Btn_back_Click" />
					</td>
					<td>
						<asp:Button class="btnYellow" ID="Btn_add" runat="server" Text="Add" OnClick="Btn_add_Click" />
					</td>
				</tr>
			</table>

		</div>
</asp:Content>
