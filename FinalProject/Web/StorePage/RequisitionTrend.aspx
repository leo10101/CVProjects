<%@ Page Language="C#" MasterPageFile="~/StoreSupervisor.Master" AutoEventWireup="true" CodeBehind="RequisitionTrend.aspx.cs" Inherits="AD.RequisitionTrend" %>
<%--YANGXU--%>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
            padding-top: 10px;
            opacity: 0.9;
        }
        .auto-style2 {
            width: 25%;
            height: 40px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div id="page" class="container container-fluid" style="text-align: center;">
        <h2 style="color: #fbc531; font-weight: bold">Requisition Trend</h2>
        <br />
        <br />
        <table style="text-align: center; width:100%">
            <tr>
                <td style="height:40px;width:25%;text-align:center;">
                    <asp:Label ID="Label1" runat="server" Text="Select Months:"></asp:Label>
                </td>
                <td style="height:40px;width:25%;text-align:center;color:black;">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height:40px;width:25%;text-align:center;color:black;">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="150px">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height:40px;width:25%;text-align:center;color:black;">
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="150px">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:center;" class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Select Category:"></asp:Label>
                </td>
                <td style="text-align:center;color:black;" class="auto-style2">
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Category" DataValueField="Category" Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString36 %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
                </td>
                <td style="text-align:center;" class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Select Item:"></asp:Label>
                </td>
                <td style="text-align:center;color:black;" class="auto-style2">
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="Description" Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString37 %>" SelectCommand="SELECT [Description] FROM [Stock] WHERE ([Category] = @Category)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList4" Name="Category" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    <asp:Label ID="Label4" runat="server" Text="Select Departments:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center">
     
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="DeptName" DataValueField="DeptCode" Width="100%">
            </asp:CheckBoxList>
          
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString38 %>" SelectCommand="SELECT [DeptName], [DeptCode] FROM [Department]"></asp:SqlDataSource>
                </td>
            </tr>

        </table>




        <asp:Button ID="Button1" class="btnYellow" runat="server" Text="Generate Report" OnClick="Button1_Click" />
        <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />--%>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </div>

</asp:Content>
