<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="AD.Email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style>
        #Send{
            position:absolute;
            height: 19px;
            right: 470px;
        }
        
         #status{
            position:absolute;

        }
        #UnProcessing{
            position:absolute;
            height: 19px;
            right: 718px;
            
        }

        .auto-style1 {
            height: 26px;
            width: 630px;
        }

        .auto-style3 {
            height: 26px;
            width: 135px;
        }
        .auto-style4 {
            width: 135px;
        }

        .auto-style7 {
            left: 597px;
            top: 610px;
            right: 818px;
        }

        .auto-style8 {
            margin-left: 0px;
        }
        .auto-style12 {
            height: 533px;
            width: 98%;
        }

        .auto-style13 {
            height: 41px;
            width: 135px;
        }
        .auto-style14 {
            height: 41px;
            width: 630px;
        }

        .auto-style15 {
            width: 630px;
        }

        .auto-style16 {
            width: 135px;
            height: 43px;
        }
        .auto-style17 {
            width: 630px;
            height: 43px;
        }

        .auto-style19 {
            height: 25px;
            width: 135px;
        }
        .auto-style20 {
            height: 25px;
            width: 630px;
        }
        .auto-style23 {
            height: 34px;
            width: 135px;
        }
        .auto-style24 {
            height: 34px;
            width: 630px;
        }
        .auto-style27 {
            height: 26px;
        }
        .auto-style30 {
            height: 38px;
            width: 135px;
        }
        .auto-style31 {
            height: 38px;
            width: 630px;
        }

        .auto-style32 {
            left: 822px;
            top: 610px;
            right: 508px;
            height: 19px;
            width: 155px;
        }

        .auto-style33 {
            height: 20px;
            width: 135px;
        }
        .auto-style34 {
            height: 20px;
            width: 630px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
         <br /><br />
        <table align="center" class="auto-style12">
            <tr>
                <td class="auto-style23">addresser</td>
                <td class="auto-style24"><asp:TextBox ID="to" runat="server"  Width="99%"></asp:TextBox>               
                </td>
            </tr>
            <tr>
                <td class="auto-style23">Email Password</td>
                <td class="auto-style24"><asp:TextBox ID="Txt_password" runat="server"  Width="99%" TextMode="Password"></asp:TextBox>               
                </td>
            </tr>
            <tr>
                <td class="auto-style33">receiver1</td>
                <td class="auto-style34">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString %>" SelectCommand="SELECT DISTINCT [Email] FROM [User]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">receiver2</td>
                <td class="auto-style15">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" AppendDataBoundItems="True">
                     <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">receiver3</td>
                <td class="auto-style15">
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email"  AppendDataBoundItems="True">
                         <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">receiver4</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style19">receiver5</td>
                <td class="auto-style20">
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">receiver6</td>
                <td class="auto-style15">
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">receiver7<br />
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">receiver8</td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Title</td>
                <td class="auto-style15"><asp:TextBox ID="subject" runat="server"  Width="99%" Height="50px" TextMode="MultiLine"/></td>
            </tr>
            <tr>
                <td class="auto-style4">Content</td>
                <td class="auto-style15"><asp:TextBox ID="body" runat="server"  Width="99%"  Height="98px" TextMode="MultiLine" CssClass="auto-style8"  />
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Attachment</td>
                <td class="auto-style17">
                    <asp:FileUpload ID="FileUpload1" runat="server" />        
                </td>
            </tr>
            <tr>
                <td></td>
                <td>  <asp:FileUpload ID="FileUpload2" runat="server" /></td>
            </tr>
             <tr>
                <td>
                    <asp:Button ID="UnProcessing" runat="server" Text="View UnRead Email" CssClass="auto-style32"  OnClick="UnProcessing_Click" Height="25px" />     
                    </td>
                <td><asp:FileUpload ID="FileUpload3" runat="server" /></td>
            </tr>
             <tr>
                <td class="auto-style27">
                    
                 </td>
                <td class="auto-style27"> <asp:FileUpload ID="FileUpload4" runat="server" /></td>
            </tr>
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style14">
                    <asp:Button ID="Send" OnClick="send_Click" runat="server" Text="Send" Width="70px" CssClass="auto-style7" Height="25px"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style30"></td>
                <td class="auto-style31"><asp:Label ID="status" runat="server" Text="" ></asp:Label>
                </td>
            </tr>

        </table>
        <br /><br />
    </form>
</body>
</html>
