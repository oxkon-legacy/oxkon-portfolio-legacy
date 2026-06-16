<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Informacoes.aspx.vb" Inherits="Informacoes" %>

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
    <img src="/imagens/perfil.png" /><br /><br />
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
                <a href="/Cliente/AlterarSenha.aspx"><img src="Imagens/altSenha.png" border="0" /></a></td>
                <td width="300">Acesse esta área caso você tenha esquecido sua senha, ou simplesmente deseja alterá - la.</td>
      </tr>
             <tr>
            <td>
                <a href="/Cliente/Cadastro.aspx"><img src="Imagens/edit.png" border="0" /></a></td>
                <td>Nesta área você poderá alterar suas informações de usuário.</td>
                </tr>
			<tr>
            <td>
                <a href="/Cliente/Pedidos.aspx"><img src="Imagens/conProd.png" border="0" /></a></td>
                <td>Você poderá verificar o status e andamento do seu pedido.</td>
        </tr>
    </table>
    <br /><br />
    
</asp:Content>

