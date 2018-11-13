<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginNew.aspx.cs" Inherits="AD.LoginNew" %>
<%--CHENYIQING--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 47px;
        }

        .btnYellow{
            font-family:Arial;
            font-size:large;
            height:35px;
            width:200px;
            color:#333333;
            background-color:#fbc531;
            border: none;
            margin:10px;
            font-weight:bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #333333; color: #fbc531; width: 100%; height: 700px;">

        <div>
            <br />
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        Current System Time：
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000">
                        </asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <br />
                <br />
                <table style="width:100%;text-align:center">
                    <tr style="column-span:all; align-content:center;">
                        <td colspan="2" class="auto-style1">
                            <asp:Label ID="lbl_Title" runat="server" Text="Welcome, please log in" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large"></asp:Label>
                        </td>
                    </tr>
                    <tr><td><br /></td></tr>
                    <tr><td><br /></td></tr>
                    <tr>
                        <td style="text-align:right;width:50%;padding-right:75px;">
                            <asp:Label ID="lbl_UserName" runat="server" Text="UserName" Font-Names="Arial" Font-Size="Large"></asp:Label>
                        </td>
                        <td style="text-align:left;width:50%;">
                            <asp:TextBox ID="tbx_UserName" runat="server" Width="175px" Height="25px" Style="color: #000000;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbx_UserName"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:50%;padding-right:75px;">
                            <asp:Label ID="lbl_Password" runat="server" Text="Password" Font-Names="Arial" Font-Size="Large"></asp:Label>
                        </td>
                        <td style="text-align:left;width:50%;">
                            <asp:TextBox ID="tbx_Password" runat="server" Width="175px" Height="25px" TextMode="Password" Style="color: #000000"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbx_Password"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td><br /></td></tr>
                    <tr style=" align-content:center;">
                        <td colspan="2" >
                            <asp:Button ID="btn_Login" class="btnYellow" runat="server" Text="Log In" OnClick="btn_Login_Click" />
                        </td>
                    </tr>
                    <tr style="column-span:all; align-content:center;">
                        <td colspan="2" >
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="color:#ffffff;border-color:#fbc531;border-width:1px;border-radius:5px;"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr style="column-span:all; align-content:center;">
                        <td colspan="2" >
                            <asp:Label ID="lbl_Status" runat="server" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>
                        </td>
                    </tr>
                </table>
           

        </div>
    </form>
</body>
</html>
