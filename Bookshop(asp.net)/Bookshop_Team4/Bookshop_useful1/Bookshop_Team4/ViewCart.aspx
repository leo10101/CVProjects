<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="Bookshop_Team4.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
<asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="255px" style="margin-left: 208px" Width="562px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="b.BookID" HeaderText="Book ID" />
                <asp:BoundField DataField="b.Title" HeaderText="Book Title" />
                <asp:BoundField DataField="b.Price" HeaderText="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    <asp:Label ID="lblTotalPrice" runat="server" Font-Size="Medium" Text="Total Price:"></asp:Label>
    <asp:TextBox ID="txtTotalPrice" runat="server" Height="25px" Width="203px"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="btnCheckOut" runat="server" Height="35px" OnClick="btnCheckOut_Click" Text="Check Out" Width="138px" />
</asp:Content>
