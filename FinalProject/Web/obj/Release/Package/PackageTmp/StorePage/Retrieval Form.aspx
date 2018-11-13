<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retrieval Form.aspx.cs" Inherits="AD.Store.Retrieval_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
            <Columns>
                <asp:TemplateField HeaderText="RequestID" >
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("RequestID") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Description" >
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="RequestQty" >
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("RequestQty") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="CollectionQty" SortExpression="Qty">
					<ItemTemplate>
						<asp:textbox ID="textbox1" runat="server" Text='<%# Bind("RequestQty") %>'></asp:textbox>
					</ItemTemplate>
				</asp:TemplateField>
                </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="Collect" Height="28px" OnClick="Button1_Click" />
    </form>
</body>
</html>
