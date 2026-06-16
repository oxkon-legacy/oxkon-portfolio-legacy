<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="AdmCadastro.aspx.cs" Inherits="Adm_AdmCadatro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        Cadastro</h1>
        <table style="width:100%;">
            <tr>
                <td>
                    Razão Social</td>
                <td>
                    <asp:TextBox ID="tbRazao" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    CNPJ</td>
                <td>
                    <asp:TextBox ID="tbCNPJ" runat="server" MaxLength="14"></asp:TextBox>
&nbsp;Somente números</td>
            </tr>
            <tr>
                <td>
                    E-mail</td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    CEP</td>
                <td>
                    <asp:TextBox ID="tbCEP" runat="server" MaxLength="8"></asp:TextBox>
&nbsp;Somente números</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="tbGeral" runat="server" Rows="10" TextMode="MultiLine" 
                        Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btGravar" CssClass="bt" runat="server" Text="Gravar" 
                        onclick="btGravar_Click" UseSubmitBehavior="false" />
                    <br />
                    <asp:Label ID="lbMSG" runat="server" CssClass="Alerta"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Content>

