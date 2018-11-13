<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnReadEmailNum.aspx.cs" Inherits="AD.UnReadEmailNum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 128px;
            width: 1485px;
            margin-top: 0px;
        }
        #Label1{
            position:absolute;
          
        }
        #Label2{
            position:absolute;
          
        }
        #Button1{
            position:absolute;
          
        }
        .auto-style2 {
            left: 577px;
            top: 58px;
            height: 27px;
            width: 181px;
        }
        .auto-style4 {
            width: 754px;
        }
        .auto-style5 {
            left: 754px;
            top: 154px;
        }
        .auto-style6 {
            left: 758px;
            top: 59px;
            width: 161px;
            height: 25px;
        }
        .auto-style7 {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br /><br />
       <table class="auto-style1">
           <tr>
               <td class="auto-style4"> <asp:Label ID="Label1" runat="server" Text="Your Unread Email numbers:" CssClass="auto-style2"></asp:Label> </td>
               <td>
                   <asp:Label ID="Label2" runat="server" CssClass="auto-style6" ></asp:Label></td>          
           </tr>
           <tr>
               <td class="auto-style7"></td><td class="auto-style7"></td>
           </tr>
           <tr>
               <td></td><td></td>
           </tr>
           <tr>
               <td></td>
               <td class="auto-style4"><asp:Button ID="Button1" runat="server" Text="View" CssClass="auto-style5" OnClick="Button1_Click1" /></td>
           </tr>
           </table>
    </form>
</body>
</html>
