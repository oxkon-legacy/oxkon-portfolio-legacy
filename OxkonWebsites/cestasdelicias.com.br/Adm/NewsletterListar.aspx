<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="NewsletterListar.aspx.vb" Inherits="Adm_NewsletterListar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Newsletter</p>
    <p>
        <asp:Label ID="lbVer" runat="server"></asp:Label>
    </p>
    <asp:GridView ID="gvNewsletter" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="newCodigo" HeaderText="Cód" />
            <asp:BoundField DataField="newData" DataFormatString="{0: dd/MM/yyyy}" 
                HeaderText="Data" />
            <asp:BoundField DataField="newAssunto" HeaderText="Assunto" />
            <asp:CommandField HeaderText="Ação" SelectText="Ver" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

