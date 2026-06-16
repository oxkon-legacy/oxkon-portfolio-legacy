<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="AdmCursos.aspx.cs" Inherits="Adm_Cliente_Cursos_AdmCursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Cursos</h1>
    <p>
        <asp:Button ID="btNovo" CssClass="bt" runat="server" Text="Novo" 
            OnClick="btNovo_Click" />
        </p>
    <asp:GridView ID="gvCursos" runat="server" AutoGenerateColumns="False" 
        EnableModelValidation="True" Width="100%">
        <Columns>
            <asp:BoundField DataField="curCodigo" HeaderText="Código" />
            <asp:HyperLinkField DataNavigateUrlFields="curCodigo" 
                DataNavigateUrlFormatString="AdmCursosEditar.aspx?id={0}" DataTextField="curCurso" 
                DataTextFormatString="{0}" HeaderText="Curso" />
        </Columns>
    </asp:GridView>
</asp:Content>

