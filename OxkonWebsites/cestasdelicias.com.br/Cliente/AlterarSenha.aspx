<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AlterarSenha.aspx.vb" Inherits="Cliente_AlterarSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
<!--
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
.btSmall{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; background-color: Transparent; background-image: url(/imagens/btSmall.png); border-style: none; border-width: 0px;}
    .style7
    {
    }
    .style8
    {
        width: 141px;
    }
-->
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img src="../Imagens/altKey.png" /></p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style8">
                    Senha atual:</td>
                <td>
                    <asp:TextBox ID="tbSenhaA" runat="server" TextMode="Password" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Nova Senha:</td>
                <td>
                    <asp:TextBox ID="tbSenhaN" runat="server" TextMode="Password" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Confirmar Nova Senha:</td>
                <td>
                    <asp:TextBox ID="tbSenhaC" runat="server" TextMode="Password" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7" colspan="2"><br />
                    <asp:Button ID="Button1" runat="server" Text="Gravar"  CssClass="btSmall" 
                        Height="28px" Width="91px"/>
                    <br />
                    <asp:Label ID="lbMSG" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
                </td>
            </tr>
        </table>
    </p>
</asp:Content>

