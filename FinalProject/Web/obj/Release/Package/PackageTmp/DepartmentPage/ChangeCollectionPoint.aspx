<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeCollectionPoint.aspx.cs" Inherits="AD.ChangeCollectionPoint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <br />
            <br />
            Current Collection Point:
            <asp:TextBox ID="txb_Bcollection" runat="server" OnTextChanged="cpcurrent_TextChanged"></asp:TextBox>
            <br />
            <br />
            <asp:RadioButton ID="radio1" runat="server" Text="Administration Building" />
            <br />
            <asp:RadioButton ID="radio2" runat="server" Text="Management School" />
            <br />
            <asp:RadioButton ID="radio3" runat="server" Text="Medical School" />
            <br />
            <asp:RadioButton ID="radio4" runat="server" Text="Engineering School" />
            <br />
            <asp:RadioButton ID="radio5" runat="server" Text="Science School" />
            <br />
            <asp:RadioButton ID="radio6" runat="server" Text="University Hospital" />
        </div>
         <%--   <asp:Button ID="cancelcc" runat="server" Text="Cancel" OnClick="cancelcc_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
        <asp:Button ID="changecc" runat="server" Text="Change" OnClick="changecc_Click" />
         <asp:Label ID="Lab_successful" runat="server" Text="Label"></asp:Label>
         <p>
             <asp:Label ID="Lab_session" runat="server" Text="Label" Visible="False"></asp:Label>
             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send Notification" Width="145px" />
         </p>
         <asp:Label ID="lab_dept" runat="server" Text="Label" Visible="False"></asp:Label>
         <br />
    </form>
</body>
</html>
