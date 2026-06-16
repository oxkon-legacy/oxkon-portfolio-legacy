<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="AdmUsuarios.aspx.vb" Inherits="Adm_AdmUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Cadastro de usuários</p>
    <p>
        <asp:Button ID="btNovo" runat="server" Text="Novo" />
&nbsp;<asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="usuNome" HeaderText="Nome" />
                <asp:BoundField DataField="usuUsuario" HeaderText="Usuário" />
                <asp:CommandField HeaderText="Ação" SelectText="Editar" 
                    ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </p>
    <asp:Panel ID="pEditar" runat="server" Visible="false">
        <table style="width:100%;">
            <tr>
                <td>
                    Nome</td>
                <td>
                    <asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Usuário</td>
                <td>
                    <asp:TextBox ID="tbUsuario" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Senha</td>
                <td>
                    <asp:TextBox ID="tbSenha" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Confirmação da Senha</td>
                <td>
                    <asp:TextBox ID="tbConfirmacao" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hfUsuario" runat="server" Visible="False" />
                </td>
                <td>
                    <asp:Button ID="btGravar" runat="server" Text="Gravar" />
                    &nbsp;<br />
                    <asp:Label ID="lbMSG" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
    </p>
</asp:Content>

