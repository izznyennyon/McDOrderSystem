<%@ Page Title="" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true"
    CodeBehind="Report.aspx.cs" Inherits="McDOrderSystem.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sales Report</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }

    h2 {
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
        <div>
        <h2>Executive Summary of Sales</h2>
        <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="TotalSales" HeaderText="Total Sales" />
                <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" DataFormatString="{0:c2}" />
                <asp:BoundField DataField="TotalItemsSold" HeaderText="Total Items Sold" />
            </Columns>
        </asp:GridView>

        <h2>Detailed Sales Report</h2>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataReport" AutoGenerateColumns="False" DataKeyNames="SalesId,ItemId" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="SalesId" HeaderText="Sales Id" ReadOnly="True" SortExpression="SalesId" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="ItemId" HeaderText="Item Id" ReadOnly="True" SortExpression="ItemId" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="ItemPrice" HeaderText="Price" SortExpression="ItemPrice" DataFormatString="{0:RM0.00}" />
                <asp:BoundField DataField="SalesDate" HeaderText="Sales Date" SortExpression="SalesDate" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:Button ID="btnUser" runat="server" Text="User Registration" OnClick="btnUser_Click" />
    <asp:SqlDataSource ID="SqlDataReport" runat="server" ConnectionString="<%$ ConnectionStrings:connMcD %>" SelectCommand="SELECT Sales.SalesId, Sales.Username, Sales.ItemId, Sales.Quantity, Items.ItemPrice, Sales.SalesDate FROM Sales INNER JOIN Items ON Sales.ItemId = Items.ItemId"></asp:SqlDataSource>
</asp:Content>
