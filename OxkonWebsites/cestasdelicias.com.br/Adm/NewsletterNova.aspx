<%@ Page Title="" ValidateRequest="false" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="NewsletterNova.aspx.vb" Inherits="Adm_NewsletterNova" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Enviar Newsletter</p>
<p>
    <table style="width:100%;">
        <tr>
            <td>
                Assunto</td>
            <td>
                <asp:TextBox ID="tbAssunto" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Mensagem</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                    <FTB:FreeTextBox ID="ftbMensagem" runat="Server" 
                        Text="&lt;b&gt;asdfds&lt;/b&gt;" Width="100%" />
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                E-mail
                <asp:TextBox ID="tbTeste" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btTeste" runat="server" Text="Testar" />
                <br />
                <asp:Button ID="btEnviar" runat="server" Text="Enviar" />
                <br />
                <asp:Label ID="lbMSG" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </p>
</asp:Content>

