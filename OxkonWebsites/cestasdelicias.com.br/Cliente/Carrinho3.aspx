<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Carrinho3.aspx.vb" Inherits="Cliente_Carrinho3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
<!--
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
.btSmall{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; background-color: Transparent; background-image: url(/imagens/btSmall.png); border-style: none; border-width: 0px;}
    .style7
    {
        font-size: small;
        font-weight: bold;
    }
    .style8
    {
        width: 73px;
    }
-->
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Itens -> Local e Tipo de Entrega -> <b>Cartão de Presente -></b> Forma de Pagamento</p>
    <table __designer:mapid="19d" style="width:100%;">
        <tr __designer:mapid="19e">
            <td __designer:mapid="19f">
                <span class="style7">Cartão</span><br __designer:mapid="197" />
                <asp:CheckBox ID="cbCartao" runat="server" AutoPostBack="True" 
                    
                    Text="Você deseja que os itens comprados sejam empacotados e enviados como presente?" />
            </td>
        </tr>
        <tr __designer:mapid="1a2">
            <td __designer:mapid="1a3">
                <asp:Panel ID="pMensagem" runat="server" Visible="False">
                <br /><br />
                    <table style="width:100%;">
                        <tr>
                            <td class="style8">
                                De:</td>
                            <td>
                                <asp:TextBox ID="tbDE" runat="server" CssClass="textBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="tbDE" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#993300">Por favor, informe seu nome!</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Para:</td>
                            <td>
                                <asp:TextBox ID="tbPARA" runat="server" CssClass="textBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="tbPARA" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#993300">Por favor, informe o nome de quem irá receber!</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Mensagem:</td>
                            <td>
                                <asp:TextBox ID="tbMensagem" runat="server" Rows="3" TextMode="MultiLine" CssClass="textBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="tbMensagem" ErrorMessage="Por favor, informe a mensagem!" Font-Bold="True" ForeColor="#993300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <p><asp:Button ID="btContinuar" 
                            runat="server" Text="Continuar&gt;" CssClass="btSmall" Height="28px" 
                        Width="91px" /></p>
            </td>
        </tr>
    </table>
</asp:Content>


