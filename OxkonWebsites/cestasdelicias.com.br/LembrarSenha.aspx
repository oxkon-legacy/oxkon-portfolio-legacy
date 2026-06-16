<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LembrarSenha.aspx.vb" Inherits="LembrarSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
<!--
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
.btSmall{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; background-color: Transparent; background-image: url(/imagens/btSmall.png); border-style: none; border-width: 0px;}
-->
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img src="/imagens/envKey.png" /></p>
    <p>
        <b>Obs.:</b> Informe seu e-mail de cadastro,<br /> que enviaremos sua senha!<br /><br />
        <asp:TextBox ID="tbEmail" runat="server" CssClass="textBox"></asp:TextBox>
&nbsp;<asp:Button ID="btEnviar" runat="server" Text="Enviar Senha" CssClass="btSmall" 
            Height="28px" Width="90px" Font-Size="10px" />
    </p>
<p>
        <asp:Label ID="lbMSG" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

