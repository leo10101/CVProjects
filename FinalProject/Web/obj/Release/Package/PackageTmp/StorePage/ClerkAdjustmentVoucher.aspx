<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClerkAdjustmentVoucher.aspx.cs" Inherits="AD.Store.Adjustment_Voucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 868px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
            <br />
            <br />
        </div>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="Description" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString2 %>" SelectCommand="SELECT [Description] FROM [Stock] WHERE ([Category] = @Category)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="bt_addSave" runat="server" Text="Add&Save" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server">
        </asp:GridView>
        <br />
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Qty"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Reason"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Suppiler Code"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="First Supplier"></asp:Label>
        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="RadioButton1_CheckedChanged" />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Second Supplier"></asp:Label>
        <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" />
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Third Supplier"></asp:Label>
        <asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton3_CheckedChanged" />
        <br />
        <asp:Button ID="Button_InfoSup" runat="server" Text="Inform Supervisor" OnClick="Button_InfoSup_Click" />
        <asp:Button ID="btn_InfoManager" runat="server" OnClick="btn_InfoManager_Click" Text="Inform Manager" />
    </form>
</body>
</html>
