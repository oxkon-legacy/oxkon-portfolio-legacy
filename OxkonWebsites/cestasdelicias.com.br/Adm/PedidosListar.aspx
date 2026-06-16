<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="PedidosListar.aspx.vb" Inherits="Adm_PedidosListar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Pedidos</p>
    <asp:Panel ID="pFiltro" runat="server" GroupingText="Filtro de Busca">
        Situação:
        <asp:CheckBox ID="cb1" runat="server" Checked="True" 
    Text="Aguardando pagamento" />
        <asp:CheckBox ID="cb2" runat="server" Checked="True" 
    Text="Transporte" />
        <asp:CheckBox ID="cb3" runat="server" 
    Text="Entregue" />
        <br />
        Data inicial
        <asp:TextBox ID="tbDataI" runat="server" Width="80px"></asp:TextBox>
        &nbsp;Data Final
        <asp:TextBox ID="tbDataF" runat="server" Width="80px"></asp:TextBox>
        &nbsp;<asp:Button ID="btFiltro" runat="server" Text="Filtrar" />
    </asp:Panel>
    <p>
        <asp:GridView ID="gvPedidos" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="carCodigo" HeaderText="Pedido" />
                <asp:BoundField DataField="carData" HeaderText="Data" />
                <asp:BoundField DataField="cliNome" HeaderText="Cliente" />
                <asp:BoundField DataField="Situacao" HeaderText="Situação" />
                <asp:CommandField HeaderText="Ação" SelectText="Detalhes" 
                    ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
</p>
    <asp:Panel ID="pDetalhes" runat="server" Visible="False">
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btVoltar" runat="server" Text="Voltar" />
                </td>
            </tr>
            <tr>
                <td>
                    Mudar situação</td>
                <td>
                    <asp:DropDownList ID="ddSituacao" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="A">Aguardando Pagamento</asp:ListItem>
                        <asp:ListItem Value="T">Tranporte</asp:ListItem>
                        <asp:ListItem Value="E">Entregue</asp:ListItem>
                    </asp:DropDownList>
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
                    Cliente</td>
                <td>
                    <asp:Label ID="lbCliente" runat="server"></asp:Label>
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
                    Valor produtos</td>
                <td>
                    <asp:Label ID="lbValorProdutos0" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Valor frete</td>
                <td>
                    <asp:Label ID="lbValorFrete" runat="server"></asp:Label>
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
    </asp:Panel>
    <p>
</p>
</asp:Content>

