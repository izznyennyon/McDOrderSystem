<%@ Page Title="" Language="C#" MasterPageFile="~/Mcd.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="McDOrderSystem.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1> Log in Page </h1>
 <p>
     Enter email as your username : 
     <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
 </p>
 <p>
     Enter Password : 
     <asp:TextBox ID="txtPassword" runat="server"
         TextMode ="Password"></asp:TextBox>
 </p>
 <p>
     <asp:Button ID="btnLogin" runat="server" Text="login" OnClick="btnRegister_Click" />

 </p>
 <p>
     <asp:Label ID="lblMessage" runat="server" Text="Status:"></asp:Label>
     </p>
</asp:Content>
