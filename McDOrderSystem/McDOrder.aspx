<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="McDOrder.aspx.cs" Inherits="McDOrderSystem.McDOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>McD Order</title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="leftColumn">
            <h4>Sales Items</h4>
            <p>
                Select category: &nbsp;
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCategories" DataTextField="CatTitle" DataValueField="CatId" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                <br />
            </p>
            <asp:GridView ID="GridViewItems" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSourceItems" PageSize="5" OnSelectedIndexChanged="GridViewItems_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                    <asp:BoundField DataField="ItemTitle" HeaderText="ItemTitle" SortExpression="ItemTitle" />
                    <asp:BoundField DataField="ItemPrice" DataFormatString="{0:c2}" HeaderText="ItemPrice" SortExpression="ItemPrice" />

                    <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/{0}" HeaderText="Image">
                        <ControlStyle Width="30px" />
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
            <p>
                Item id:
    <asp:Label ID="lblItemId" runat="server" Text=""></asp:Label>&nbsp;|
    Item title:
    <asp:Label ID="lblItemTitle" runat="server" Text=""></asp:Label>&nbsp;|
    Item price:
    <asp:Label ID="lblItemPrice" runat="server" Text=""></asp:Label>&nbsp;
            </p>
            <p>
                Quantity:
    <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Width="50px">1</asp:TextBox>&nbsp;
    <asp:Button ID="btnAddItem" runat="server" Text="Add Item to Cart" OnClick="btnAddItem_Click" />
            </p>
            <p>
                <asp:Label ID="lblMessage1" runat="server" Text=""></asp:Label>
            </p>
        </div>
        <br />
        <div class="rightColumn">
            <h4>Sales Cart</h4>
            <p>
                Sales id:
    <asp:Label ID="lblSalesId" runat="server" Text=""></asp:Label>&nbsp;|
    Date and time:
    <asp:Label ID="lblDateTime" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCart">
                    <Columns>
                        <asp:BoundField DataField="ItemId" HeaderText="ItemId" SortExpression="ItemId" />
                        <asp:BoundField DataField="ItemTitle" HeaderText="ItemTitle" SortExpression="ItemTitle" />
                        <asp:BoundField DataField="ItemPrice" DataFormatString="{0:c2}" HeaderText="ItemPrice" SortExpression="ItemPrice" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Subtotal" DataFormatString="{0:c2}" HeaderText="Subtotal" ReadOnly="True" SortExpression="Subtotal" />
                    </Columns>
                </asp:GridView>
                Total amount:
    <asp:Label ID="lblTotalAmountCart" runat="server" Text="RM0.00"></asp:Label>
            </p>
            <p>
                <asp:Button ID="btnComfirm" runat="server" Text="Comfirm Sales" OnClick="btnComfirm_Click" />&nbsp;|
    <asp:Button ID="btnCancel" runat="server" Text="Cancel Sales" OnClick="btnCancel_Click" />&nbsp;|
    <asp:Button ID="btnNew" runat="server" Text="New Sales" OnClick="btnNew_Click" />
            </p>
            <p>
                <asp:Label ID="lblMessage2" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblAmountAfterTax" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblRounding" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblAmountRounded" runat="server" Text=""></asp:Label><br />
            </p>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:cubaan2 %>" SelectCommand="SELECT * FROM [Categories] ORDER BY [CatTitle]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:cubaan2 %>" SelectCommand="SELECT * FROM [Items] WHERE ([CatId] = @CatId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CatId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:cubaan2 %>" SelectCommand="spSalesGetItems" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSalesId" Name="salesid" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
