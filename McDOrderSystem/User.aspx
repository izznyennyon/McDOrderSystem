<%@ Page Title="" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true" 
    CodeBehind="User.aspx.cs" Inherits="McDOrderSystem.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <title>User Registration</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }

    h1 {
        color: #333;
    }

    .gridview {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .gridview th {
            background-color: #f2f2f2;
            color: #333;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }

        .gridview .header {
            background-color: #4CAF50;
            color: white;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>User List</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="gridview">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="PasswordHash" HeaderText="PasswordHash" SortExpression="PasswordHash" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:CheckBoxField DataField="Enabled" HeaderText="Enabled" SortExpression="Enabled" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnReport" runat="server" Text="Report" OnClick="btnReport_Click" />

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connMcD %>" DeleteCommand="DELETE FROM [UserAccounts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [UserAccounts] ([UserName], [PasswordHash], [Role], [Enabled]) VALUES (@UserName, @PasswordHash, @Role, @Enabled)" SelectCommand="SELECT * FROM [UserAccounts]" UpdateCommand="UPDATE [UserAccounts] SET [UserName] = @UserName, [PasswordHash] = @PasswordHash, [Role] = @Role, [Enabled] = @Enabled WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="PasswordHash" Type="String" />
        <asp:Parameter Name="Role" Type="String" />
        <asp:Parameter Name="Enabled" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="PasswordHash" Type="String" />
        <asp:Parameter Name="Role" Type="String" />
        <asp:Parameter Name="Enabled" Type="Boolean" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
