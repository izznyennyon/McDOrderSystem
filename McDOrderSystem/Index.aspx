<%@ Page Title="" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="McDOrderSystem.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
    @font-face {
        font-family: 'KOMIKAX';
        src: url('fonts/KOMIKAX_.ttf') format('truetype');
    }

    .card {
        border: 1px solid #ccc;
        padding: 16px;
        margin: 16px;
        border-radius: 8px;
        text-align: center;
        width: calc(33.333% - 40px); /* Adjust the width to fit 3 cards per row */
        box-sizing: border-box;
        font-family: 'KOMIKAX', sans-serif; /* Apply the custom font */
    }

        .card img {
            width: 100px;
        }

        .card h1 {
            font-size: 1.5em;
            margin: 0.5em 0;
        }

        .card p.price {
            color: green;
            font-size: 1.2em;
            margin: 0.5em 0;
        }

        .card .add-to-cart-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-family: 'KOMIKAX', sans-serif; /* Apply the custom font */
        }

            .card .add-to-cart-btn:hover {
                background-color: #45a049;
            }

    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .menu {
        font-family: 'KOMIKAX', sans-serif; /* Apply the custom font */
        left: 50px;
        top: 10px;
        position:relative;
    }

    @media (max-width: 768px) {
        .card {
            width: calc(50% - 32px); /* Two cards per row on medium screens */
        }
    }

    @media (max-width: 480px) {
        .card {
            width: calc(100% - 32px); /* Single card per row on small screens */
        }
    }

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="menu">MENU</h2>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:connMcD %>"
            SelectCommand="SELECT [ItemTitle], [ItemPrice], [ItemImage] FROM [Items]"></asp:SqlDataSource>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="card">
                    <img src='images/<%# Eval("ItemImage") %>' alt='<%# Eval("ItemTitle") %>' />
                    <h1><%# Eval("ItemTitle") %></h1>
                    <p class="price"><%# Eval("ItemPrice", "{0:c2}") %></p>
                    <asp:Button runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("ItemTitle") %>' CssClass="add-to-cart-btn" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>