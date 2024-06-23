<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="McDOrder.aspx.cs" Inherits="McDOrderSystem.McDOrder" MasterPageFile="~/Mcd.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>McD Order</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-bottom: 70px;">
        <div class="row">
            <div class="col-md-8">
                <h4>Sales Items</h4>
                <p>
                    Select category: &nbsp;
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCategories" DataTextField="CatTitle" DataValueField="CatId" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="form-select"></asp:DropDownList>
                    <br />
                </p>
                <asp:GridView ID="GridViewItems" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSourceItems" PageSize="5" OnSelectedIndexChanged="GridViewItems_SelectedIndexChanged" CssClass="table table-striped">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                        <asp:BoundField DataField="ItemTitle" HeaderText="ItemTitle" SortExpression="ItemTitle" />
                        <asp:BoundField DataField="ItemPrice" DataFormatString="{0:c2}" HeaderText="ItemPrice" SortExpression="ItemPrice" />
                        <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/{0}" HeaderText="Image">
                            <ControlStyle Width="50px" />
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
                    <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Width="50px" CssClass="form-control d-inline-block w-auto">1</asp:TextBox>&nbsp;
                    <asp:Button ID="btnAddItem" runat="server" Text="Add Item to Cart" OnClick="btnAddItem_Click" CssClass="btn btn-primary" />
                </p>
                <p>
                    <asp:Label ID="lblMessage1" runat="server" Text="" CssClass="text-danger"></asp:Label>
                </p>
            </div>
            <div class="col-md-4">
                <div>
                    <h4>Sales Cart</h4>
                    <p>
                        Sales id:
                        <asp:Label ID="lblSalesId" runat="server" Text=""></asp:Label>&nbsp;|
                        Date and time:
                        <asp:Label ID="lblDateTime" runat="server" Text=""></asp:Label>
                    </p>
                    <p>
                        <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCart" CssClass="table table-striped">
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
                        <asp:Button ID="btnComfirm" runat="server" Text="Confirm Sales" OnClick="btnComfirm_Click" CssClass="btn btn-success" />&nbsp;|
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel Sales" OnClick="btnCancel_Click" CssClass="btn btn-danger" />&nbsp;|
                        <asp:Button ID="btnNew" runat="server" Text="New Sales" OnClick="btnNew_Click" CssClass="btn btn-secondary" />
                    </p>
                    <p>
                        <asp:Label ID="lblMessage2" runat="server" Text="" CssClass="text-danger"></asp:Label>
                    </p>
                </div>
                <div class="mt-4">
                    <h4>Receipt</h4>
                    <p>
                        Sales id:
                        <asp:Label ID="lblReceiptSalesId" runat="server" Text=""></asp:Label>&nbsp;|
                        Date and time:
                        <asp:Label ID="lblReceiptDateTime" runat="server" Text=""></asp:Label>
                    </p>
                    <p>
                        Username:
                        <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                    </p>
                    <p>
                        <asp:GridView ID="GridViewReceipt" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                            <Columns>
                                <asp:BoundField DataField="ItemId" HeaderText="ItemId" />
                                <asp:BoundField DataField="ItemTitle" HeaderText="ItemTitle" />
                                <asp:BoundField DataField="ItemPrice" DataFormatString="{0:c2}" HeaderText="ItemPrice" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Subtotal" DataFormatString="{0:c2}" HeaderText="Subtotal" />
                            </Columns>
                        </asp:GridView>
                    </p>
                    <p>
                        <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label><br />
                        <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label><br />
                        <asp:Label ID="lblAmountAfterTax" runat="server" Text=""></asp:Label><br />
                        <asp:Label ID="lblRounding" runat="server" Text=""></asp:Label><br />
                        <asp:Label ID="lblAmountRounded" runat="server" Text=""></asp:Label><br />
                    </p>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:connMcD %>" SelectCommand="SELECT * FROM [Categories] ORDER BY [CatTitle]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:connMcD %>" SelectCommand="SELECT * FROM [Items] WHERE ([CatId] = @CatId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategory" Name="CatId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:connMcD %>" SelectCommand="spSalesGetItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblSalesId" Name="salesid" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
