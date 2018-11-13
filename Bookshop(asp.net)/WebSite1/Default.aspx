<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Browse Books</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">

        <div class="container">
     
            <div class="controls form-inline">
        <asp:TextBox ID="txtKeyword" runat="server" class="form-control" Width="80%"></asp:TextBox>
        <asp:DropDownList ID="SearchCondition_ddl" runat="server" class="btn btn-primary dropdown-toggle">
            <asp:ListItem>Title</asp:ListItem>
            <asp:ListItem>Author</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" class="btn"/>
        </div>
         
        <ul class="list-group" style="list-style:none">
            <li>
                <asp:LinkButton ID="SortPrice_linkBtn" runat="server" OnClick="SortPrice_linkBtn_Click">Sort by Price (Low to High)</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="SortByTitle_linkBtn" runat="server" OnClick="SortByTitle_linkBtn_Click">Sort by Title (A-Z)</asp:LinkButton></li>
        </ul>
            

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" Style="padding:10px; text-indent:5px;">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="Price" HeaderText="Price"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <image src="images/<%# Eval("ISBN") %>.jpg" width="200" height="250"></image>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDetail" runat="server" OnClick="lbDetail_Click">Details</asp:LinkButton>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("title") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
            </div>
    </form>
</asp:Content>

