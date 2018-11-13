<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeRequest.aspx.cs" Inherits="AD.MakeRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Select Category:"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString5 %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stock]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Select Item:"></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="Description">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString6 %>" SelectCommand="SELECT [Description] FROM [Stock] WHERE ([Category] = @Category)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="Category" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="addreq" runat="server" Text="Add" OnClick="addreq_Click" />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Font-Size="12px"  EnableModelValidation="True" Height="166px" Width="791px">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Category"  />
                            <asp:BoundField DataField="Item" HeaderText="Item" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
        <br />--%><%-- <asp:Button ID="cancelreq" runat="server" Text="Cancel" OnClick="cancelreq_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="sendreq" runat="server" Text="Send Request" />--%>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Quantity"></asp:Label>
        <asp:TextBox ID="txb_quantity" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="bt_save" runat="server" OnClick="bt_save_Click" Text="Save" />
        <br />
        <br />
        <br />
        <asp:Label ID="lab_item1" runat="server" Text="Item1"></asp:Label>
        <asp:Label ID="lab_quantity1" runat="server" Text="Quantity"></asp:Label>
        <asp:Label ID="q1" runat="server"></asp:Label>
        <asp:Label ID="c1" runat="server" Text="Category"></asp:Label>
        <asp:Label ID="ca1" runat="server"></asp:Label>
        <asp:Label ID="i1" runat="server" Text="Item"></asp:Label>
        <asp:Label ID="it1" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lab_item2" runat="server" Text="Item2"></asp:Label>
        <asp:Label ID="lab_quantity2" runat="server" Text="Quantity"></asp:Label>
        <asp:Label ID="q2" runat="server"></asp:Label>
        <asp:Label ID="c2" runat="server" Text="Category"></asp:Label>
        <asp:Label ID="ca2" runat="server"></asp:Label>
        <asp:Label ID="i2" runat="server" Text="Item"></asp:Label>
        <asp:Label ID="it2" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lab_item3" runat="server" Text="Item3"></asp:Label>
        <asp:Label ID="lab_quantity3" runat="server" Text="Quantity"></asp:Label>
        <asp:Label ID="q3" runat="server"></asp:Label>
        <asp:Label ID="c3" runat="server" Text="Category"></asp:Label>
        <asp:Label ID="ca3" runat="server"></asp:Label>
        <asp:Label ID="i3" runat="server" Text="Item"></asp:Label>
        <asp:Label ID="it3" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lab_item4" runat="server" Text="Item4"></asp:Label>
        <asp:Label ID="lab_quantity4" runat="server" Text="Quantity"></asp:Label>
        <asp:Label ID="q4" runat="server"></asp:Label>
        <asp:Label ID="c4" runat="server" Text="Category"></asp:Label>
        <asp:Label ID="ca4" runat="server"></asp:Label>
        <asp:Label ID="i4" runat="server" Text="Item"></asp:Label>
        <asp:Label ID="it4" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lab_item5" runat="server" Text="Item5"></asp:Label>
        <asp:Label ID="lab_quantity5" runat="server" Text="Quantity"></asp:Label>
        <asp:Label ID="q5" runat="server"></asp:Label>
        <asp:Label ID="c5" runat="server" Text="Category"></asp:Label>
        <asp:Label ID="ca5" runat="server"></asp:Label>
        <asp:Label ID="i5" runat="server" Text="Item"></asp:Label>
        <asp:Label ID="it5" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="bt_Cancel" runat="server" Text="Cancel" OnClick="bt_Cancel_Click" />
        <asp:Button ID="bt_sendRequest" runat="server" OnClick="bt_sendRequest_Click" Text="Send Request" />
        </form>
</body>
</html>
