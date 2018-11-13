<%@ Page Language="C#" MasterPageFile="~/DeptEmployee.Master" AutoEventWireup="true" CodeBehind="MakeRequest.aspx.cs" Inherits="AD.MakeRequest" %>
<%--CHENYIQING--%>
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

	    #left {
	        float: left;
	        padding-top: 30px;
	        padding-bottom: 30px;
	        C: \Users\zhaoyinqing\Desktop\ADteam6\杨旭给的\8.5\0804ADPROJGuo\AD-Intergration-final-final-final-final\AD\DepartmentPage\MakeRequest.aspx
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

		#Content2 {
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

        <div id="page" class="container container-fluid">
        <table class="w-100">
            <tr>
                                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
        <asp:Label ID="Label3" runat="server" Text="Current Request ID:"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
        <asp:Label ID="Label2" runat="server" Text="Select Category:"></asp:Label>
                </td>
                <td style="color:black">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" style="color:black" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" Width="150px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString24 %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                </td>
            </tr>
                        <tr>
                                            <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
        <asp:Label ID="Label4" runat="server" Text="Select Item:"></asp:Label>
                                            </td>
                <td style="color:black">
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" style="color:black" DataTextField="Description" DataValueField="Description" Width="150px"></asp:DropDownList>
                </td>
            </tr>
                        <tr>
                                            <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString39 %>" SelectCommand="SELECT [Description] FROM [Stock] WHERE ([Category] = @Category)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
                                    <tr>
                                                        <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
        <asp:Label ID="Label5" runat="server" Text="Input Quantity:"></asp:Label>
                                                        </td>
                <td>
        <asp:TextBox ID="Textbox2" runat="server" Text="Quantity" ValidationGroup="a" style="color:black"></asp:TextBox>
                                        </td>
            </tr>
                                    </table>
        <div style="text-align:center;width:100%">
        <div style="text-align:center;width:100%">
        <div style="text-align:center;width:100%">
        <asp:Button ID="Button1" class="btnYellow" runat="server" OnClick="Button1_Click" Text="Add" ValidationGroup="a" />
        </div>
        </div >

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" width="100%">
            <Columns>
                <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="RequestQty" HeaderText="RequestQty" SortExpression="RequestQty" />
                <asp:BoundField />
                <asp:CommandField HeaderText="Delete" SelectText="Delete" ShowHeader="True" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        </div>
        <br />
        <div style="text-align:center;width:100%">
            <asp:Button ID="Button2" class="btnYellow" runat="server"  OnClick="Button2_Click" Text="MakeRequest" />
        <div style="text-align:center;width:100%">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        </div>

		</div>
</asp:Content>