<%@ Page Language="C#" MasterPageFile="~/Store Clerk.Master" AutoEventWireup="true" CodeBehind="Purchase Order.aspx.cs" Inherits="AD.Store.Purchase_Order" %>
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
            padding-top: 10px;
            opacity: 0.9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div id="page" class="container container-fluid" style="text-align:center;">
        <h2 style="color: #fbc531; font-weight: bold">Purchase Order</h2>

        <table style="width:100%;">
            <tr>
                <td style="height:40px;width:33%;text-align:center;color:black;">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                        AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Supplier</asp:ListItem>
                    </asp:DropDownList>
                </td>

                <td style="height:40px;width:33%;text-align:center">
                    <asp:Label ID="Label17" runat="server" Text="PO number:"></asp:Label>
                     <asp:Label ID="Label16" runat="server" ForeColor="White"></asp:Label>
                </td>

                <td style="height:40px;width:33%;text-align:center">
                    <asp:Button ID="Button1" class="btnYellow" runat="server" Text="Custom Order" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>

        <br />
        <asp:Label ID="Label18" runat="server" ForeColor="Red"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False"
            Style="text-align: center;width:100%;font-size:small">
            <Columns>
                <asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ReorderLevel" SortExpression="ReorderLevel">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("ReorderLevel") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ReorderedQty" SortExpression="ReorderedQty">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("ReorderedQty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="CurrentQty" SortExpression="CurrentQty">
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("CurrentQty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qty" SortExpression="Qty">
                    <ItemTemplate>
                        <asp:TextBox ID="textbox1" runat="server" Text='<%# Bind("Qty") %>' Style="text-align: center; width: 100%; height: 100%; background-color: transparent;" ForeColor="white"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="FirstSupp" SortExpression="FirstSupp">
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("FirstSupp") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" >
                </asp:CommandField>
            </Columns>
            <RowStyle CssClass="rowHover" />
        </asp:GridView>
        <div class="padding2" style="text-align: center">
		    <asp:Button ID="Button2" class="btnYellow" runat="server" Text="Confirm" OnClick="Button2_Click" />
        </div>

    </div>

</asp:Content>
