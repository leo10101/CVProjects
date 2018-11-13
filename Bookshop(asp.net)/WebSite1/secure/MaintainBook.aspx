<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MaintainBook.aspx.cs" Inherits="secure_MaintainBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Manage Books</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>
        <div class="controls form-inline">
         <asp:TextBox ID="tbxSearch" runat="server" Width="411px" class="form-control" placeholder="Enter Book Title or Book ID" ValidationGroup="Search"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn" ValidationGroup="Search"/>
    </div></div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="tbxBookTitle">Book Title:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="tbxBookTitle" runat="server" Width="411px" class="form-control" ValidationGroup="Submit"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredField" ControlToValidate="tbxBookTitle" ForeColor="Red" ValidationGroup="Submit"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="ddlBookCategory">Book Category:</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlBookCategory" runat="server" Width="286px" class="form-control" ValidationGroup="Submit"></asp:DropDownList>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="tbxISBN">ISBN:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="tbxISBN" runat="server" Width="230px" class="form-control" ValidationGroup="Submit"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredField" ControlToValidate="tbxISBN" ForeColor="Red" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="ISBNCustomValidator" runat="server" ErrorMessage="Invalid Value" OnServerValidate="ISBNCustomValidator_ServerValidate" ControlToValidate="tbxISBN" ForeColor="Red" ValidationGroup="Submit">Invalid ISBN</asp:CustomValidator>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="tbxAuthor">Author:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="tbxAuthor" runat="server" Width="411px" class="form-control" ValidationGroup="Submit"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredField" ControlToValidate="tbxAuthor" ForeColor="Red" ValidationGroup="Submit"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="tbxStock">Number of Stock:</label><div class="col-sm-10">
            <asp:TextBox ID="tbxStock" runat="server" Width="69px" class="form-control" ValidationGroup="Submit"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredField" ControlToValidate="tbxStock" ForeColor="Red" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="StockCustomValidator" runat="server" ErrorMessage="Invalid Value" OnServerValidate="StockCustomValidator_ServerValidate" ValidationGroup="Submit" ControlToValidate="tbxStock" ForeColor="Red">Invalid Value</asp:CustomValidator>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="tbxPrice">Price:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="tbxPrice" runat="server" Width="69px" class="form-control" ValidationGroup="Submit"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredField" ControlToValidate="tbxPrice" ForeColor="Red" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="PriceCustomValidator" runat="server" ErrorMessage="Invalid Value" OnServerValidate="PriceCustomValidator_ServerValidate" ValidationGroup="Submit" ControlToValidate="tbxPrice" ForeColor="Red">Invalid Value</asp:CustomValidator>
        </div>
    </div>
    <asp:label class="control-label col-sm-2" id="labelBookID" runat="server">Book ID:</asp:label>
        <asp:TextBox ID="tbxBookID" runat="server" ReadOnly="True" Width="69px" Visible="False" ValidationGroup="Submit"></asp:TextBox>
    <br /><br />
        <br />

    <div class="text-center">
        
    <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-default" Font-Bold="True" Visible="False" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-default" Font-Bold="True" Visible="False" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-default" Font-Bold="True" Visible="False" OnClick="btnDelete_Click" />
    </div>
        </form>
</asp:Content>

