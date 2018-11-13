<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Book Detail</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <div class="container" >
        <asp:Image ID="Image1" runat="server" Width="300px" class="img-responsive center-block" />
    <br />
    <div style="display:grid; grid-template-columns:1fr 1fr; font-size:medium;">
    <span style="text-align:right; padding-right:50px">Title: </span>
    <asp:TextBox ID="txtTitle" runat="server" Height="25px" Width="260px" BorderWidth="0"></asp:TextBox>
    <span style="text-align:right; padding-right:50px">ISBN: </span>
    <asp:TextBox ID="txtISBN" runat="server" Height="25px" Width="260px" BorderWidth="0"></asp:TextBox>
    <span style="text-align:right; padding-right:50px">Author: </span>
    <asp:TextBox ID="txtAuthor" runat="server" Height="25px" Width="260px" BorderWidth="0"></asp:TextBox>
    <span style="text-align:right; padding-right:50px">Category: </span>
    <asp:TextBox ID="txtCat" runat="server" Height="25px" Width="260px" BorderWidth="0"></asp:TextBox>
    <span style="text-align:right; padding-right:50px">Quantity: </span>
    <asp:TextBox ID="txtQuantity" runat="server" Height="25px" Width="260px" BorderWidth="0"></asp:TextBox>
    <span style="text-align:right; padding-right:50px">Price: </span>
    <asp:TextBox ID="txtPrice" runat="server" Height="25px" Width="260px" BorderWidth="0"></asp:TextBox>
        </div>

<asp:Button ID="btnAddToCart" runat="server" Height="38px" Text="Add to Cart" Width="225px" OnClick="btnAddToCart_Click" class="center-block" />
    </div>
    </form>
</asp:Content>

