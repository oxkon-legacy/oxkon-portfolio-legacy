<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="CategoriasListar.aspx.vb" Inherits="Adm_CategoriasListar" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Cagorias</p>
    <p>
        <asp:Button ID="btNova" runat="server" Text="Nova" />
&nbsp;<asp:TextBox ID="tbNome" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Button ID="btGravar" runat="server" Text="Gravar" Visible="False" />
        <asp:GridView ID="gvCategorias" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Cód">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("catCodigo") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("catCodigo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Categoria">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("catNome") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("catNome") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Ação" ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete"></asp:LinkButton>
                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" 
                            ConfirmText="Deseja realmente deletar esta categoria?" 
                            TargetControlID="LinkButton1">
                        </cc1:ConfirmButtonExtender>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</p>
<p>&nbsp;</p>
</asp:Content>

