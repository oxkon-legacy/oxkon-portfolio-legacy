<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="agenda_cursos.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Biocen | Agenda de Cursos, Cursos Fechados</title>
    <meta name="description" content="Até o momento, estamos trabalhando com cursos sobre Microbiologia; Monitoramento de qualidade de água potável e de alimentos; Sistemas de Saneamento; Ecotoxicologia; Sistemas de Qualidade; Medições e Incertezas." />
    <meta name="keywords" content="Microbiologia, monitoramento de qualidade de agua, ecotoxologia, sistemas de qualidade, curso, cursos, sistemas de gestão, monitoramento ambiental" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="geral2">
    <div class="artigo">
        <span class="lightgray">Agenda:</span>
        <asp:Repeater ID="rptCursos" runat="server">
            <ItemTemplate>
                <p>
                    <a href="detalhes_curso.aspx?id=<%# DataBinder.Eval(Container.DataItem, "curCodigo")%>">
                        <%# DataBinder.Eval(Container.DataItem, "curCurso")%></a>
                    <br />
                    <%# DataBinder.Eval(Container.DataItem, "curDescricao")%></p>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </div>
</asp:Content>
