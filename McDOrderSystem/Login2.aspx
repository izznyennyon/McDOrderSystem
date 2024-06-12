﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="McDOrderSystem.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h1>Log in</h1>
        <p>
            <label for="txtUserName">Enter email as your username:</label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="login-input" Placeholder="Email"></asp:TextBox>
        </p>
        <p>
            <label for="txtPassword">Enter Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input" Placeholder="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="login-button" OnClick="btnRegister_Click" />
        </p>
        <asp:Label ID="lblMessage" runat="server" Text="Status:" CssClass="status-label"></asp:Label>
    </div>
</asp:Content>