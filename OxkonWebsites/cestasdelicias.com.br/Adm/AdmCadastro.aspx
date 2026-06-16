<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="AdmCadastro.aspx.vb" Inherits="Adm_AdmCadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Cadastro da Empresa</p>
    <p>
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
                    <asp:Button ID="Button1" runat="server" Text="Gravar" />
                    <br />
                    <asp:Label ID="lbMSG" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </p>
</asp:Content>

