<%@ Page Language="C#" MasterPageFile="~/Store Clerk.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder_CustomerOrder.aspx.cs" Inherits="AD.Store.PurchaseOrder_CustomerOrder" %>
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
            padding-bottom: 30px;
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

    <div id="page" class="container container-fluid" style="text-align: center">
        <h2 style="color: #fbc531; font-weight: bold">Purchase Order</h2>


        <table style="column-span: all; text-align: center; width: 100%;">
            <tr>
                <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label5" runat="server" Text="PO Number:"></asp:Label>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 75px; height: 40px;">
                    <asp:TextBox ID="TextBox5" runat="server" ForeColor="Black" AutoPostBack="True" ValidationGroup="Search" Width="250px"></asp:TextBox>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Button ID="Button3" class="btnYellow" runat="server" OnClick="Button3_Click" Text="Search" ValidationGroup="Search" />
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="PO number is required" ForeColor="Red" ValidationGroup="Search" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>


        <div class="containner container-fluid" style="padding-bottom: 20px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="OnRowDeleting" DataKeyNames="ItemCode" RowStyle-CssClass="rowHover" Style="font-size: small; width: 100%;">
                <Columns>
                    <asp:BoundField DataField="POnumber" HeaderText="POnumber" SortExpression="POnumber" />
                    <asp:BoundField DataField="SuppCode" HeaderText="SuppCode" SortExpression="SuppCode" />
                    <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>

        <table style="column-span: all; text-align: center; width: 100%;">
            <tr >
                 <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label6" runat="server" Text="Category:"></asp:Label>
                </td>
                <td style="text-align: center;width: 33%;padding-left:25px" >
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" Width="250px" ValidationGroup="Add" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" ForeColor="Black">
                        <asp:ListItem Value="0">Category</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString30 %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
                </td>
                 <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <p />
                </td>
            </tr>
            <tr>
                 <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label10" runat="server" Text="Description:"></asp:Label>
                </td>
                <td style="text-align: center;padding-top:10px;padding-bottom:10px;width: 33%;padding-left:25px;" >
                    <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="250px" ValidationGroup="Add" AppendDataBoundItems="false" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="Description" ForeColor="Black">
                        <asp:ListItem Value="0">Description</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString31 %>" SelectCommand="SELECT [Description] FROM [Stock] WHERE ([Category] = @Category)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                 <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <p />
                </td>
            </tr>
            <tr>
                <td style="text-align: center;padding-left: 25px" colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Category is required" ValidationGroup="Add" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" Display="Dynamic" ErrorMessage="Description is required" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label1" runat="server" Text="ItemCode:"></asp:Label>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 75px; height: 40px;">
                    <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" ReadOnly="True" Width="250px"></asp:TextBox>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <p />
                </td>
            </tr>

            <tr>
                <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label2" runat="server" Text="Quantity:"></asp:Label>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 75px; height: 40px;">
                    <asp:TextBox ID="TextBox2" runat="server" ForeColor="Black" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged" Width="250px"></asp:TextBox>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <p />
                </td>
            </tr>

            <tr>
                <td style="text-align: center; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="RadioButton1_CheckedChanged" GroupName="radio" />
                </td>
                <td style="text-align: center; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" GroupName="radio" />
                </td>
                <td style="text-align: center; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton3_CheckedChanged" GroupName="radio" />
                    <asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>

            <tr>
                <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label3" runat="server" Text="Price:"></asp:Label>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 75px; height: 40px;">
                    <asp:TextBox ID="TextBox3" runat="server" ForeColor="Black" AutoPostBack="True" ReadOnly="True" Width="251px"></asp:TextBox>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <p />
                </td>
            </tr>

            <tr>
                <td style="text-align: right; width: 33%; padding-left: 25px; height: 40px;">
                    <asp:Label ID="Label4" runat="server" Text="TotalPrice:"></asp:Label>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 75px; height: 40px;">
                    <asp:TextBox ID="TextBox4" runat="server" ForeColor="Black" ReadOnly="True" Width="250px"></asp:TextBox>
                </td>
                <td style="text-align: left; width: 33%; padding-left: 25px; height: 40px;">
                    <p />
                </td>
            </tr>

            <tr>
                <td colspan="3">
                    <asp:Button ID="Button1" class="btnYellow" runat="server" OnClick="Button1_Click" Text="Add" ValidationGroup="Add" />
                </td>

            </tr>
        </table>

        <div>
            <asp:Label ID="Label7" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
        </div>

        <%--<div class="padding2">
            <asp:Button ID="Button2" class="btnYellow" runat="server" Text="Place Order" OnClick="Button2_Click" />
        </div>--%>
    </div>
</asp:Content>
