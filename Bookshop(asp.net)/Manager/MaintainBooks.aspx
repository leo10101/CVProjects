<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintainBooks.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-secondary" OnClick="btnSearch_Click"/></td>
                    <td>
                        <br />
                        <asp:TextBox ID="tbxSearch" runat="server" Width="411px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td> <asp:Label ID="labelBookTitle" runat="server" Text="Book Title:"></asp:Label></td>
                    <td> 
                        <br />
                        <asp:TextBox ID="tbxBookTitle" runat="server" Width="411px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="labelBookCategory" runat="server" Text="Book Category:"></asp:Label></td>
                    <td> 
                        <br />
                        <asp:DropDownList ID="ddlBookCategory" runat="server" Width="286px">
            </asp:DropDownList>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="labelISBN" runat="server" Text="ISBN:"></asp:Label></td>
                    <td>
                        <br />
                        <asp:TextBox ID="tbxISBN" runat="server" Width="230px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="labelAuthor" runat="server" Text="Author:"></asp:Label></td>
                    <td>
                        <br />
                        <asp:TextBox ID="tbxAuthor" runat="server" Width="411px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="labelStock" runat="server" Text="Number of Stock:"></asp:Label></td>
                    <td>
                        <br />
                        <asp:TextBox ID="tbxStock" runat="server" Width="69px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="labelPrice" runat="server" Text="Price:"></asp:Label></td>
                    <td>
                        <br />
                        <asp:TextBox ID="tbxPrice" runat="server" Width="69px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td> <asp:Label ID="labelBookID" runat="server" Text="Book ID:" Visible="False"></asp:Label></td>
                    <td> 
                        <br />
                        <asp:TextBox ID="tbxBookID" runat="server" ReadOnly="True" Width="69px" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" Height="49px" Width="211px" CssClass="btn btn-secondary btn-lg" Font-Bold="True" Visible="False" OnClick="btnUpdate_Click"/>
            &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="49px" Width="211px" CssClass="btn btn-secondary btn-lg" Font-Bold="True" Visible="False" OnClick="btnSubmit_Click"/>
            <br />
            <br />
&nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" Height="49px" Width="211px" CssClass="btn btn-secondary btn-lg" Font-Bold="True" Visible="False" OnClick="btnDelete_Click"/>
        </div>
    </form>
</body>
</html>
