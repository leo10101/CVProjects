<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Bookshop_Team4.BrowseBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <asp:Image ID="Image1" runat="server" Width="300px" />
    <br />
    <asp:Label ID="lblTitle" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="Title:"></asp:Label>
    <asp:TextBox ID="txtTitle" runat="server" Height="25px" Width="260px"></asp:TextBox>
    <br />
    <asp:Label ID="lblISBN" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="ISBN:"></asp:Label>
    <asp:TextBox ID="txtISBN" runat="server" Height="25px" Width="260px"></asp:TextBox>
    <br />
    <asp:Label ID="lblAuthor" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="Author:"></asp:Label>
    <asp:TextBox ID="txtAuthor" runat="server" Height="25px" Width="260px"></asp:TextBox>
    <br />
    <asp:Label ID="lblCat" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="Category:"></asp:Label>
    <asp:TextBox ID="txtCat" runat="server" Height="25px" Width="260px"></asp:TextBox>
    <br />
    <asp:Label ID="lblQuantity" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="Quantity:"></asp:Label>
    <asp:TextBox ID="txtQuantity" runat="server" Height="25px" Width="260px"></asp:TextBox>
    <br />
    <asp:Label ID="lblPrice" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="Price"></asp:Label>
    <asp:TextBox ID="txtPrice" runat="server" Height="25px" Width="260px"></asp:TextBox>
<br />
<br />
<br />
<asp:Button ID="btnAddToCart" runat="server" Height="38px" Text="Add to Cart" Width="225px" OnClick="btnAddToCart_Click" />
</asp:Content>

