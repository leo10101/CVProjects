<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="text-align:center">
    <asp:Literal ID="Literal1" runat="server">You have successfully logged out.</asp:Literal>
    Click <a href="Default.aspx">here</a> to return to the homepage.
    </div>
</asp:Content>

