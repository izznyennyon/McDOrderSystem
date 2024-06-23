<%@ Page Title="" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="McDOrderSystem.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border: 1px solid #ccc;
            padding: 16px;
            margin: 16px;
            border-radius: 8px;
            text-align: center;
            width: calc(33.333% - 40px); /* Adjust the width to fit 3 cards per row */
            box-sizing: border-box;
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

        .card button {
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
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>MENU</h2>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:connMcD %>"
            SelectCommand="SELECT [ItemTitle], [ItemPrice], [ItemImage] FROM [Items]"></asp:SqlDataSource>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="card">
                    <img src='images/<%# Eval("ItemImage") %>' alt='<%# Eval("ItemTitle") %>' />
                    <h1><%# Eval("ItemTitle") %></h1>
                    <p class="price">$<%# Eval("ItemPrice", "{0:F2}") %></p>
                    <button type="button">Add to Cart</button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
