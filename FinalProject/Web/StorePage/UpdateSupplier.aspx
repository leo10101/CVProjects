﻿<%@ Page Language="C#" MasterPageFile="~/Store Clerk.Master" AutoEventWireup="true" CodeBehind="UpdateSupplier.aspx.cs" Inherits="AD.Store.UpdateSupplier" %>
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
        <h2 style="color: #fbc531; font-weight: bold">Update Supplier</h2>

			<asp:GridView ID="GridView_supplier" runat="server" class="table table-responsive" AutoGenerateColumns="False"
				OnRowDeleting="OnRowDeleting"
				OnRowEditing="OnRowEditing"
				OnRowCancelingEdit="OnRowCancelingEdit"
				OnRowUpdating="OnRowUpdating"
				DataKeyNames="SuppCode"
                style="width:100%;font-size:small;">
				<Columns>
					<asp:TemplateField HeaderText="Supplier Code" SortExpression="SuppCode">
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("SuppCode") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Supplier Name" SortExpression="SuppName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SuppName") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("SuppName") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Contact Title" SortExpression="ContactTitle">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ContactTitle") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactTitle") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Contact Name" SortExpression="ContactName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ContactName") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Phone" SortExpression="Phone">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Phone") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label5" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Fax" SortExpression="Fax">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Fax") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label6" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Address" SortExpression="Address">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Postal Code" SortExpression="PostalCode">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("PostalCode") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label8" runat="server" Text='<%# Bind("PostalCode") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="GST No" SortExpression="GSTNo">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("GSTNo") %>' style="color:black"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# Bind("GSTNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:CommandField ButtonType="Button" ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="False" />
				</Columns>
			</asp:GridView>
			<br />

            <div>
                <asp:Button ID="Btn_addNew" class="btnYellow" runat="server" Text="Add New Supplier" OnClick="Btn_addNew_Click" />

		        <asp:Button ID="btn_InformSupplier" class="btnYellow" runat="server" OnClick="btn_InformSupplier_Click" Text="Inform Supplier" />

            </div>
			
            <div style="margin-bottom:25px;">
                <asp:Label ID="Label10" runat="server"></asp:Label>
            </div>
		    

	</div>
</asp:Content>
