<%@ Page Language="C#" MasterPageFile="~/DeptRepresentative.Master" AutoEventWireup="true" CodeBehind="ChangeCollectionPoint.aspx.cs" Inherits="AD.ChangeCollectionPoint" %>
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
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style1" style="text-align: right">
                            <asp:Label ID="Label1" runat="server" Text="Current Collection Point:"></asp:Label>&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
            <asp:TextBox ID="txb_Bcollection" runat="server" OnTextChanged="cpcurrent_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
            <asp:RadioButton ID="radio1" runat="server" Text="Administration Building" GroupName="AA" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
            <asp:RadioButton ID="radio2" runat="server" Text="Management School" GroupName="AA"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
            <asp:RadioButton ID="radio3" runat="server" Text="Medical School" GroupName="AA" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
            <asp:RadioButton ID="radio4" runat="server" Text="Engineering School" GroupName="AA" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
            <asp:RadioButton ID="radio5" runat="server" Text="Science School" GroupName="AA"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
            <asp:RadioButton ID="radio6" runat="server" Text="University Hospital" GroupName="AA"/>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <div style = "text-align:center">
                <asp:Label ID="Lab_successful" runat="server"></asp:Label>
            </div>
            <table style="width:100%">
                <tr>
                <td colspan="1" style="text-align:right">
        <asp:Button ID="changecc" runat="server" Text="Change" OnClick="changecc_Click" Width="225px"/>
                    </td>
                <td colspan="1" style="text-align:left">
         <asp:Button ID="btn_Send" runat="server" Text="Send Information" OnClick="btn_Send_Click" />
                    </td>
                </tr>
            </table>
            &nbsp;<table style="width:100%">
                <tr>
                <td colspan="1" style="text-align:right">
             <asp:Label ID="Lab_session" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                <td colspan="1" style="text-align:left">
         <asp:Label ID="lab_dept" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
</asp:Content>
