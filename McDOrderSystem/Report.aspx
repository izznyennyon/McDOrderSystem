<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="McDOrderSystem.Report" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Report</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Executive Summary of Sales</h2>
            <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="TotalSales" HeaderText="Total Sales" />
                    <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" />
                    <asp:BoundField DataField="TotalItemsSold" HeaderText="Total Items Sold" />
                </Columns>
            </asp:GridView>

            <h2>Detailed Sales Report</h2>
            <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="SalesId" HeaderText="Sales ID" />
                    <asp:BoundField DataField="ItemTitle" HeaderText="Item" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="SalesDate" HeaderText="Sales Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="Price" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
