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
                <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" />
                <asp:BoundField DataField="TotalItemsSold" HeaderText="Total Items Sold" />
            </Columns>
        </asp:GridView>

        <h2>Detailed Sales Report</h2>
        <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="SalesId" HeaderText="Sales ID" />
                <asp:BoundField DataField="ItemTitle" HeaderText="Item" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="SalesDate" HeaderText="Sales Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="ItemPrice" HeaderText="Price" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
