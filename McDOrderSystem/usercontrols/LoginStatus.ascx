﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="McDOrderSystem.UserControl.LoginStatus1" %>
<style>
    @font-face {
        font-family: 'FormulaSerialExtraBold';
        src: url('fonts/Formula-Serial-Extrabold-Regular.ttf') format('truetype');
        font-family: 'KOMIKAX';
        src: url('fonts/KOMIKAX_.ttf') format('truetype');
    }

    .button-link {
        background-color: #F7B32B; /* Background color similar to the one in the image */
        color: white;
        border: 2px solid white; /* White border */
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        font-family: 'KOMIKAX', sans-serif; /* Apply the custom font */
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 20px; /* Rounded corners */
        transition: background-color 0.3s ease, color 0.3s ease;
    }

        .button-link:hover {
            background-color: white;
            color: #F7B32B; /* Text color changes to match background on hover */
        }

    .custom-font {
        font-family: 'KOMIKAX', sans-serif; /* Apply the custom font */
    }
</style>
<asp:HyperLink ID="HyperLinkIndex" runat="server" NavigateUrl="~/Index.aspx" CssClass="button-link">Home Page</asp:HyperLink>
&nbsp;&nbsp;
<asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="button-link">Login</asp:HyperLink>
&nbsp;&nbsp;

<asp:HyperLink ID="HyperLinkRegister" runat="server" NavigateUrl="~/Register.aspx" CssClass="button-link">Register</asp:HyperLink>
&nbsp;&nbsp;

<asp:Label ID="lblLoginStatus" runat="server" CssClass="custom-font"></asp:Label>
&nbsp;&nbsp;

<asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" Style="height: 35px" />