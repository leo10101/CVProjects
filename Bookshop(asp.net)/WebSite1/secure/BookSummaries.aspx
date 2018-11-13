<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookSummaries.aspx.cs" Inherits="BookSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Book Summary</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div>
            <asp:Label ID="labelBookSummaries" runat="server" Text="Book Summaries" Font-Bold="True" Font-Size="16pt"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" StyleSheet="table" 
                DataKeyNames ="BookID"
                AutoGenerateColumns="False" 
                OnRowDeleting="GridView1_RowDeleting" 
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                   <asp:BoundField DataField="BookID" ReadOnly="true" HeaderText="Book ID" SortExpression="BookID" />
                     <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:Textbox ID="tbxTitle" runat="server" Width="98%"></asp:Textbox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Author" SortExpression="Author">
                        <EditItemTemplate>
                            <asp:Textbox ID="tbxAuthor" runat="server"></asp:Textbox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAuthor" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <EditItemTemplate>
                            <asp:Textbox ID="tbxISBN" runat="server"></asp:Textbox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblISBN" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Stock" SortExpression="Stock">
                        <EditItemTemplate>
                            <asp:Textbox ID="tbxStock" runat="server"></asp:Textbox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIStock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:Textbox ID="tbxPrice" runat="server"></asp:Textbox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
                        <EditItemTemplate>
                           <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblICategory" runat="server" Text='<%# Bind("Category.Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ItemStyle-Width="5%"/>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ItemStyle-Width="5%"/>
                </Columns>
            </asp:GridView>

            <br />

        </div>
        </form>
</asp:Content>
