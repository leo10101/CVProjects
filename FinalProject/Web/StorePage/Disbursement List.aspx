<%@ Page Language="C#" MasterPageFile="~/Store Clerk.Master" AutoEventWireup="true" CodeBehind="Disbursement List.aspx.cs" Inherits="AD.Store.Disbursement_List" %>
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
        
        .btnYellow{
            font-family:Arial;
            font-size:large;
            height:35px;
            width:200px;
            color:#333333;
            background-color:#fbc531;
            border: none;
            margin:10px;
            font-weight:bold;
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
        <h2 style="color:#fbc531;font-weight:bold">Disbursement List</h2>
        
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DeptName" DataValueField="DeptName" style="font-size:medium;color:#333333;width:250px;height:35px;border-width:1px;border-color:#fbc531;margin:10px;">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString34 %>" SelectCommand="SELECT [DeptName] FROM [Department]"></asp:SqlDataSource>
        
        <br /><br />
       
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="CollectionPoint" DataValueField="CollectionPoint" style="font-size:medium;color:#333333;width:250px;height:35px;border-width:1px;border-color:#fbc531;margin:10px;">
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString35 %>" SelectCommand="SELECT [CollectionPoint] FROM [Department] WHERE ([DeptName] = @DeptName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="DeptName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <br /><br />
       <div>
           <asp:Label ID="lb_Inform" runat="server" ForeColor="Red"></asp:Label>
       </div>
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="width:100%;">
            <Columns>
                <asp:TemplateField HeaderText="RequestID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RequestID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemCode">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RequestQty">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("RequestQty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CollectionQty">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CollectionQty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DisbursementQty" >
					<ItemTemplate>
						<asp:textbox ID="textbox1" runat="server" Text='<%# Bind("DisbursementQty") %>' style="color:#333333"></asp:textbox>
					</ItemTemplate>
				</asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" class="btnYellow" runat="server" Text="Disburse" OnClick="Button1_Click"/>
        <asp:Button ID="Button2" class="btnYellow" runat="server" Text="Load" OnClick="Button2_Click" />
        
	</div>
</asp:Content>