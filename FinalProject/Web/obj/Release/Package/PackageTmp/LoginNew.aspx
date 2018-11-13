<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginNew.aspx.cs" Inherits="AD.LoginNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div>
        <br />
        <br />
                 <div style="width: 700px; background-color: inherit;">
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
        <asp:Label ID="lbl_Title" runat="server" Text="Welcome, please log in" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Style="margin-left: 500px"></asp:Label><br /><br />
        <asp:Label ID="lbl_UserName" runat="server" Text="UserName" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>&nbsp
        <asp:TextBox ID="tbx_UserName" runat="server" Width="167px" Height="25px" Style="margin-left: 50px"></asp:TextBox><br /><br />
        <asp:Label ID="lbl_Password" runat="server" Text="Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>&nbsp<asp:TextBox ID="tbx_Password" runat="server" Width="167px" Height="25px" TextMode="Password" Style="margin-left: 82px"></asp:TextBox>&nbsp;<br /><br />
        <asp:Button ID="btn_Login" runat="server" Text="Log In" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px; height: 41px;" OnClick="btn_Login_Click"/>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Forget Passwod? Click me</asp:LinkButton>
                 <br />
                 
                 <br />
                 &nbsp
        <asp:Label ID="lbl_Status" runat="server" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>
    </div>
        </div>
    </form>
</body>
</html>
