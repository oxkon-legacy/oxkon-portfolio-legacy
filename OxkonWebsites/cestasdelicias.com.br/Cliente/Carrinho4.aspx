<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Carrinho4.aspx.vb" Inherits="Cliente_Carrinho4" %>

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
-->
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Itens -> Local e Tipo de Entrega -> Cartão de Presente -> <b>Forma de Pagamento</b></p>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" 
            __designer:mapid="29">
            <tr style=" background-image: url(/imagens/tbpg1.png); height: 19px;">
            <td>&nbsp;
            
            </td>
            
            </tr>
      <tr __designer:mapid="2a">
        <td height="91" valign="top" background="/imagens/tbpg2.jpg" 
              __designer:mapid="2b">
    <p style="padding-left: 10px;"> <span class="style7">Crédito</span><br /><br />
            
            <asp:RadioButton ID="rbVisa" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Visa" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="rbMaster" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Master" />
            &nbsp;&nbsp;
            <asp:RadioButton ID="rbDinners" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Dinners" />
            &nbsp;&nbsp;&nbsp; 
        <asp:RadioButton ID="rbAmericanExpress" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="American Express" /><br />
            <asp:RadioButton ID="rbHipercar" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Hipercar" />
            &nbsp;&nbsp;
            <asp:RadioButton ID="rbAura" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Aura" />
                                                </p>
          </td>
      </tr>
      <tr>
          <td style=" background-image:url(/Imagens/tbpg3.png); background-repeat:no-repeat; height: 30px;">
          &nbsp;
              <br />
          </td>
          </tr>
    </table>
                                                <p>&nbsp;
            
                                                    </p>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" 
            __designer:mapid="29">
            <tr style=" background-image: url(/imagens/tbpg1.png); height: 19px;">
            <td>&nbsp;
            
            </td>
            
            </tr>
      <tr __designer:mapid="2a">
        <td valign="top" background="/imagens/tbpg2.jpg" 
              __designer:mapid="2b">
    <p style="padding-left: 10px; font-size: small;">
            
            <span class="style7">Boleto Bancário</span><br /><br __designer:mapid="218" />
            <asp:RadioButton ID="rbBoleto" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Boleto Bancário" />
            </p>
          </td>
      </tr>
      <tr>
          <td style=" background-image:url(/Imagens/tbpg3.png); background-repeat:no-repeat; height: 30px;">
          &nbsp;
              <br />
          </td>
          </tr>
    </table>
                                                <p>&nbsp;
            
                                                    </p>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" 
            __designer:mapid="29">
            <tr style=" background-image: url(/imagens/tbpg1.png); height: 19px;">
            <td>&nbsp;
            
            </td>
            
            </tr>
      <tr __designer:mapid="2a">
        <td valign="top" background="/imagens/tbpg2.jpg" 
              __designer:mapid="2b">
    <p style="padding-left: 10px;">
            
            <span class="style7">Tranfêrencia ou Depósito Bancário</span><br /><br />
            <asp:RadioButton ID="rbBradesco" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Bradesco" />
            <asp:RadioButton ID="rbItau" runat="server" AutoPostBack="True" 
                Font-Bold="False" GroupName="p" Text="Itaú" />
            </p>
          </td>
      </tr>
      <tr>
          <td style=" background-image:url(/Imagens/tbpg3.png); background-repeat:no-repeat; height: 30px;">
          &nbsp;
              <br />
          </td>
          </tr>
    </table>
    <p style="text-align: center">
            <asp:Literal ID="ltFinalizar" runat="server"></asp:Literal>
        </p>
</asp:Content>