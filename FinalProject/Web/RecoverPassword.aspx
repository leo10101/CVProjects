<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="AD.RecoverPassword" %>
<%--CHENYIQING--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 377px">
    <form id="form1" runat="server">
        <div style="height: 433px; width: 819px;">
             <div>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Text="Reset Password" Style="margin-left: 500px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lbl_Email" runat="server" Text="Email Address" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>&nbsp<asp:TextBox ID="tbx_Email" runat="server" Width="167px" Height="25px" ValidationGroup="a"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="tbx_Email"
                ValidationExpression="^\S+@\S+$" ForeColor="Red" ValidationGroup="a"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbx_Email" ErrorMessage="Please enter email address" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            <br />
             <asp:Label ID="Label3" runat="server" Text="New Password"></asp:Label>
                 <asp:TextBox ID="tbx_Password" runat="server" ValidationGroup="b" TextMode="Password"></asp:TextBox>
                 &nbsp
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_Password" ErrorMessage="Please enter new password" ForeColor="Red" ValidationGroup="b"></asp:RequiredFieldValidator>
            <br />
                 <asp:Label ID="Label4" runat="server" Text="Confirm New Password "></asp:Label>
                 <asp:TextBox ID="tbx_Confirm" runat="server" ValidationGroup="b" TextMode="Password"></asp:TextBox>
            <br />
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbx_Confirm" ControlToValidate="tbx_Password" ErrorMessage="The passwords entered are inconsistent" ForeColor="Red" ValidationGroup="b"></asp:CompareValidator>
                 <asp:Label ID="lbl_Status" runat="server" Style="margin-left: 450px" Font-Names="Arial" Font-Size="Medium"></asp:Label>
            <br />
        </div>
             <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
             <asp:TextBox ID="tbx_UserName" runat="server" Height="16px" ValidationGroup="a"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx_UserName" ErrorMessage="Please enter  your UsrerName" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            <asp:Button ID="btn_GoToLogin" runat="server" Text="Login" OnClick="btn_GoToLogin_Click" Font-Names="Arial" Font-Size="Medium" CausesValidation="False" Style="margin-left: 133px" Width="100px" Height="26px"/>
             <asp:Button ID="Button1" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Height="28px" Text="Clear" Width="95px" OnClick="Button1_Click" />
             <asp:Label ID="Label5" runat="server" Font-Bold="True" Text=" Verification code"></asp:Label>
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px" Width="100px" ValidationGroup="b"/>
             <asp:TextBox ID="tbx_Verification" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Verification code" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbx_Verification" ValidationGroup="b"></asp:RequiredFieldValidator>


             <asp:Button ID="Verification" runat="server" Font-Names="Arial"  Text="Send verification code" OnClick="Verification_Click" ValidationGroup="a" />
           
             <asp:Label ID="lbl_Inform" runat="server" Width="89px"></asp:Label>
             <asp:Button ID="Verify" runat="server" Height="25px" Text="Verify" Width="72px" OnClick="Verify_Click"  />
        </div>
    </form>
</body>
</html>
