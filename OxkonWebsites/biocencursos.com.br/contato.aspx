<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contato.aspx.cs" Inherits="Contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Biocen | Tire suas dúvidas sobre cursos e treinamentos</title>
    <meta name="description" content="Tire suas dúvidas sobre cursos e treinamentos através de nossa central de atendimento. Envie sugestões e críticas de nossos cursos..." />
    <meta name="keywords" content="cursos, treinamentos, contato, central de atendimento, biocen, sugestões, críticas" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="geral2">
    <div class="artigo"  style=" padding-left: 20px;">
        <span class="lightgray">Contate-nos</span>
        <h2>
        Para receber informações de cursos, tirar dúvidas, fazer sugestões / críticas, solicitar cursos, é só preencher o formulário abaixo ou enviar um e-mail para <a href="mailto:contato@biocencursos.com.br">contato@biocencursos.com.br</a>. 
            Pode nos contatar também pelos números (11) 5533-6588 / (11) 7993-4605 / (11) 
            4115-3053<br /><br />
        Para enviar seu currículo e fazer parte da BioCen e do nosso corpo docente, envie um e-mail para <a href="mailto:biocen@biocencursos.com.br">biocen@biocencursos.com.br</a>.<br /><br />
        Para inscrições e interesse por vagas nos cursos, fale com a nossa equipe pelo e-mail <a href="mailto:cursos@biocencursos.com.br">cursos@biocencursos.com.br</a>.<br /><br />
        Será um prazer conhecê-lo(a) e ajudá-lo(a)!
        </h2>
    </div>
    <div>
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
</asp:Content>

