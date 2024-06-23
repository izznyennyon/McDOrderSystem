<%@ Page Title="" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="McDOrderSystem.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    @font-face {
        font-family: 'FormulaSerialExtraBold';
        src: url('fonts/Formula-Serial-Extrabold-Regular.ttf') format('truetype');
        font-family: 'KOMIKAX';
        src: url('fonts/KOMIKAX_.ttf') format('truetype');
    }

        .custom-font {
        font-family: 'KOMIKAX', sans-serif; /* Apply the custom font */
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
    <h1 class="custom-font">Register</h1>
    <p>
        <label for="txtUserName">Enter your username:</label>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="login-input" Placeholder="Username"></asp:TextBox>
    </p>
    <p>
        <label for="txtPassword">Enter Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input" Placeholder="Password"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnRegister" runat="server" Text="REGISTER" CssClass="login-button" OnClick="btnRegister_Click" />
    </p>
    <asp:Label ID="lblMessage" runat="server" CssClass="status-label"></asp:Label>
</div>
</asp:Content>
