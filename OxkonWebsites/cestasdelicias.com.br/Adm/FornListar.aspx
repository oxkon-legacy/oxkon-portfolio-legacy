<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="FornListar.aspx.vb" Inherits="Adm_FornListar" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Fornecedores</p>
<p>
    <asp:Button ID="btNovo" runat="server" Text="Novo" />
&nbsp;<asp:TextBox ID="tbNome" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Button ID="btGravar" runat="server" Text="Gravar" Visible="False" />
    <asp:GridView ID="gvForncedores" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="forCodigo" HeaderText="Cód" />
            <asp:BoundField DataField="forNome" HeaderText="Fornecedor" />
            <asp:TemplateField ShowHeader="False" HeaderText="Ação">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" 
                        ConfirmText="Deseja realmente deletar este fornecedor?" 
                        TargetControlID="LinkButton1">
                    </cc1:ConfirmButtonExtender>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
&nbsp;</p>
</asp:Content>

