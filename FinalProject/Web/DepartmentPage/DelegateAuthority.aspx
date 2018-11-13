<%@ Page Language="C#" MasterPageFile="~/DeptHead.Master" AutoEventWireup="true" CodeBehind="DelegateAuthority.aspx.cs" Inherits="AD.DelegateAuthority" %>
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
			min-height: 700px;
			font-size: 18px;
			font-family: Arial, Helvetica, sans-serif;
			padding-top:60px;
			opacity:0.9;
		}

		#Content2 {
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

        <div id="page" class="container container-fluid">
            <table class="auto-style8">
                <tr>
                    <td class="auto-style15">
            <asp:Button ID="Button1" runat="server" Text="Current Delegate" OnClick="Button1_Click" Width="400px" /><br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <asp:TextBox ID="emp" runat="server" Width="392px">emp</asp:TextBox>
                    </td>
                    <td class="auto-style5"><asp:TextBox ID="Time" runat="server" Width="278px">YY/MM/DD</asp:TextBox>
                    </td>
                    <td class="auto-style6">
            <asp:Button ID="revoke" runat="server" Text="Revoke" OnClick="revoke_Click" Height="41px" Width="338px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">

            <asp:Button ID="Button2" runat="server" Text="ChooseNewDelegate" OnClick="Button2_Click" Width="398px" />
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style14"></td>
                </tr>
            <tr>
                    <td class="auto-style9">

            <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="401px">
            </asp:DropDownList>
                    </td>
                    <td class="auto-style10"></td>
                    <td class="auto-style11"></td>
                </tr>
            </table>
        </div>
      <table style="width:100%; text-align:center">
          <tr>
              <td style="text-align:right" class="auto-style17" >
                    <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" Width="375px"></asp:Calendar>
              </td>
              <td>
                    <asp:Calendar ID="Calendar3" runat="server" OnSelectionChanged="Calendar3_SelectionChanged" Width="375px"></asp:Calendar>
                                </td>
          </tr>
      </table>
      <table style="width:100%;text-align:center">
          <tr>
              <td>&nbsp;</td>
              <td>
                        <asp:Button ID="delegate" runat="server" Text="Delegate" OnClick="delegate_Click" />
                  <br />
            <asp:Label ID="Lab_successful" runat="server"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </td>
              <td>&nbsp;</td>
          </tr>
      </table>
</asp:Content>

