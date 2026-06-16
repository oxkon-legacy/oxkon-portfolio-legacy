<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Pedidos.aspx.vb" Inherits="Cliente_Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Pedidos realizados</p>
    <p>
        Buscar:
        <asp:DropDownList ID="ddSituacao" runat="server" AutoPostBack="True">
            <asp:ListItem Value="T">Todos</asp:ListItem>
            <asp:ListItem Value="A">Aguardando Pagamento</asp:ListItem>
            <asp:ListItem Value="T">Transporte</asp:ListItem>
            <asp:ListItem Value="E">Entregue</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="gvPedidos" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="carCodigo" HeaderText="Cód Pedido" />
                <asp:BoundField DataField="carData" HeaderText="Data" />
                <asp:BoundField DataField="carValorTotal" HeaderText="Valor" />
                <asp:BoundField DataField="carSituacao" HeaderText="Situacao" />
                <asp:CommandField HeaderText="Detalhes" NewText="Select" SelectText="Abrir" 
                    ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        Legenda<br />
        A -Aguardando pagamento<br />
        T - Transporte
        <br />
        E - Entregue&nbsp;
    </p>
</asp:Content>

