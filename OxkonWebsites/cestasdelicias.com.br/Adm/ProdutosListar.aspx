<%@ Page Title="" Language="VB" ValidateRequest="False" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="ProdutosListar.aspx.vb" Inherits="Adm_ProdutosListar" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Produtos</p>
    <p>Categoria:
        <asp:DropDownList ID="ddCategorias" runat="server" AutoPostBack="True">
        </asp:DropDownList>
&nbsp;Fornecedor:
        <asp:DropDownList ID="ddForn" runat="server" AutoPostBack="True">
        </asp:DropDownList>
    </p>
<p>
    <asp:Button ID="btNovo" runat="server" Text="Novo" />
    <asp:GridView ID="gvProdutos" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="proCodigo" HeaderText="Cód" />
            <asp:BoundField DataField="proNome" HeaderText="Produto" />
            <asp:BoundField DataField="proEstoque" HeaderText="Estoque" />
            <asp:BoundField DataField="proValor" HeaderText="Valor" />
            <asp:BoundField DataField="catNome" HeaderText="Categoria" />
            <asp:CommandField HeaderText="Acão" SelectText="Ver" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    </p>
    <asp:Panel ID="pEditar" runat="server" Visible="False">
        <table style="width:100%;">
            <tr>
                <td>
                    Produto</td>
                <td>
                    <asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Valor (R$)</td>
                <td>
                    <asp:TextBox ID="tbValor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Estoque</td>
                <td>
                    <asp:TextBox ID="tbEstoque" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Categoria</td>
                <td>
                    <asp:DropDownList ID="ddCategoriasE" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Fornecedor</td>
                <td>
                    <asp:DropDownList ID="ddFornE" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Peso (KG)</td>
                <td>
                    <asp:TextBox ID="tbPeso" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Foto da lista</td>
                <td>
                    <asp:FileUpload ID="fuLista" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Foto dos detalhes</td>
                <td>
                    <asp:FileUpload ID="fuDetalhes" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Status</td>
                <td>
                    <asp:CheckBox ID="cbStatus" runat="server" Text="Ativo" />
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
                    Descrição</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <FTB:FreeTextBox ID="ftbDesc" runat="Server" 
                        Text="&lt;b&gt;asdfds&lt;/b&gt;" Width="100%" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btGravar" runat="server" Text="Gravar" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
    </p>
</asp:Content>

