<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="detalhes_curso.aspx.cs" Inherits="detalhes_curso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title>Biocen | Centro de Treinamento e Capacitação Profissional</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="geral2">
    <h1>
        <asp:Literal ID="ltCurso" runat="server"></asp:Literal></h1>
    <h2>
        <asp:Literal ID="ltDescricao" runat="server"></asp:Literal></h2>
    <asp:Literal ID="ltPagina" runat="server"></asp:Literal>
    <p>
        <asp:Literal ID="ltInscricao" runat="server"></asp:Literal></p>
</div>
</asp:Content>
