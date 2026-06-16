<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

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
    <table style="width:100%;">
        <tr  style=" vertical-align: top;">
            <td width="55" height="40" colspan="2">
            <img src="/imagens/key.png" /></td>
        </tr>
        <tr  style=" vertical-align: top;">
            <td width="55" height="30">
                Usuário:</td>
            <td>
                <asp:TextBox ID="tbUsuario" runat="server" CssClass="textBox"></asp:TextBox>
            </td>
        </tr>
        <tr style=" vertical-align: top; height: 50px;">
            <td>
                Senha:</td>
            <td>
                <asp:TextBox ID="tbSenha" runat="server" TextMode="Password" CssClass="textBox"></asp:TextBox>
                &nbsp;<asp:CheckBox ID="cbLembrar" runat="server" Text="Lembrar" />
                <br />
                <asp:Label ID="lbMSG" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btLogin" runat="server" Text="Logar"  CssClass="btSmall" 
                    Height="28px" Width="91px"/>
                <br />
                <br />
                <a href="Cadastro.aspx" class="classe4"> Faça seu cadastro!</a><br />
                <br />
                <a href="LembrarSenha.aspx" class="classe4">Clique aqui se esqueceu sua senha?</a><br />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

