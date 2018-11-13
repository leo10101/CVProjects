<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Disbursement List.aspx.cs" Inherits="AD.Store.Disbursement_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DeptName" DataValueField="DeptName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogicUniversityConnectionString23 %>" SelectCommand="SELECT DISTINCT [DeptName] FROM [Department]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="CollectionPoint" DataValueField="CollectionPoint">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$  ConnectionStrings:LogicUniversityConnectionString23  %>" SelectCommand="SELECT [CollectionPoint] FROM [Department] WHERE ([DeptName] = @DeptName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="DeptName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="RequestID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RequestID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemCode">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description]">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RequestQty]">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("RequestQty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CollectionQty">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CollectionQty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DisbursementQty" SortExpression="DisbursementQty">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox" runat="server" Text='<%# Bind("CollectionQty") %>'></asp:TextBox>
                    </ItemTemplate>
                    
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="Disburse" OnClick="Button1_Click" style="height: 29px" />
    </form>

    </body>
</html>
