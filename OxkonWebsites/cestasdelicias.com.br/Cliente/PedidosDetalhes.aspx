<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PedidosDetalhes.aspx.vb" Inherits="Cliente_PedidosDetalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Detalhes do pedido
        <asp:Label ID="lbPedido" runat="server"></asp:Label>
    </p>
    <asp:Panel ID="pPag" runat="server">
        Se você já efetuou o pagamento,
        <asp:LinkButton ID="lbConfirmar" runat="server">Clique aqui</asp:LinkButton>
        &nbsp;para confirmar!<asp:Label ID="lbMSG" runat="server"></asp:Label>
    </asp:Panel>
    <p>
        <table style="width:100%;">
            <tr>
                <td>
                    Valor total</td>
                <td>
                    <asp:Label ID="lbValorTotal" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Forma de pagamento</td>
                <td>
                    <asp:Label ID="lbFormaPagamento" runat="server"></asp:Label>
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
                    Entrega</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    CEP</td>
                <td>
                    <asp:Label ID="lbCEP" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Endereço</td>
                <td>
                    <asp:Label ID="lbEndereco" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Número</td>
                <td>
                    <asp:Label ID="lbNumero" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Complemento</td>
                <td>
                    <asp:Label ID="lbComplemento" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Bairro</td>
                <td>
                    <asp:Label ID="lbBairro" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Cidade</td>
                <td>
                    <asp:Label ID="lbCidade" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Estado</td>
                <td>
                    <asp:Label ID="lbEstado" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Tipo</td>
                <td>
                    <asp:Label ID="lbTipoEntrega" runat="server"></asp:Label>
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
                    Cartão</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Dê</td>
                <td>
                    <asp:Label ID="lbDe" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Para</td>
                <td>
                    <asp:Label ID="lbPara" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Mensagem</td>
                <td>
                    <asp:Label ID="lbMensagem" runat="server"></asp:Label>
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
                    Itens</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gvItens" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="iteQTD" HeaderText="QTD" />
                            <asp:BoundField DataField="proNome" HeaderText="Produto" />
                            <asp:BoundField DataField="proValor" HeaderText="Valor" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

