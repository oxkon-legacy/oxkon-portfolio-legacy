<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contato.aspx.cs" Inherits="Contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Contato | Limpeza, lavagem e impermeabilizações</title>
    <meta name="description" content="Contato - Limpeza, lavagem, impermeabilização e principalmente higienização de superfícies estofadas, seus derivadas e de sistemas de ar condicionado veicular." />
    <meta name="keywords" content="melhorar,limpeza,lavagem,impermeabilização,higienização,estofadas,ar,condicionado,veicular" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="padding">
    <h1>Fale Conosco</h1>
    <h2 style="margin: 0 0 50px 0 !important;">Solicite um orçamento</h2>
    <div class="col-esquerda2">
    	<p>
        	Desejamos muito ouvi-lo! Envie suas sugestões, opinião ou dúvidas através do formulário de
            contato ao lado ou através de nossa Central de Atendimento. Abaixo as formas disponíveis
            para atendimento:          
        </p>
        <h1 class="htop">(11) 2280-5045</h1>
        <h2 style="margin: 0 0 50px 0 !important;">contato@fmelhorar.com.br</h2>
    </div>
    <div class="col-direita">
        <div class="lineForm">
                <span>Nome</span>
                <asp:TextBox ID="tbNome" runat="server" CssClass="inputContato"></asp:TextBox>
        </div>
        <div class="lineForm">
            <span>E-mail</span>
                <asp:TextBox ID="tbEmail" runat="server" CssClass="inputContato"></asp:TextBox>
        </div>
        <div class="lineForm">
            <span>Telefone</span>
                <asp:TextBox ID="tbTelefone" runat="server" CssClass="inputContato"></asp:TextBox>
        </div>
        <div class="lineForm">
            <span>Mensagem</span>
                <asp:TextBox ID="tbMSG" runat="server" TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
        </div>
        <div class="lineForm">
            <asp:Button ID="btEnviar" runat="server" OnClick="btEnviar_Click" Text="Enviar" CssClass="bt1" />
            <asp:Literal ID="ltMSG" runat="server"></asp:Literal>
        </div>
    </div>
</div>
</asp:Content>

