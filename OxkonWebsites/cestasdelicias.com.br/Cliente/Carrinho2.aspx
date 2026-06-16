<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Carrinho2.aspx.vb" Inherits="Cliente_Carrinho2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.padLeft{ padding-left: 10px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
        .style7
        {
            width: 89px;
        }
.btSmall
        {
            font-family: Verdana, Arial, MS Sans Serif;
            font-size: 11px;
            background-color: Transparent;
            background-image: url(/imagens/btSmall.png);
            border-style: none;
            border-width: 0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Itens -> <b>Local e Tipo de Entrega -></b> Cartão de Presente -> Forma de Pagamento</p>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" 
            __designer:mapid="29">
            <tr style=" background-image: url(/imagens/topotb.png); height: 19px;">
            <td>
            &nbsp;
            </td>
            
            </tr>
      <tr __designer:mapid="2a">
        <td height="64" valign="top" background="/imagens/siteMod1_10.jpg" 
              __designer:mapid="2b"><table width="100%" border="0" cellspacing="0" 
                cellpadding="0" __designer:mapid="2c">
          <tr __designer:mapid="2d">
            <td width="120" height="30" __designer:mapid="2e">&nbsp;</td>
            <td width="183" __designer:mapid="2f">&nbsp;</td>
            <td colspan="2" __designer:mapid="30">&nbsp;</td>
          </tr>
          <tr __designer:mapid="31">
            <td __designer:mapid="32">&nbsp;</td>
            <td __designer:mapid="33">&nbsp;</td>
            <td width="113" __designer:mapid="34">
            <asp:TextBox ID="tbCEP" runat="server" MaxLength="8" BackColor="Transparent" 
                    BorderStyle="None" BorderWidth="0px" Font-Names="Arial" Font-Size="11px" 
                    ForeColor="#958F8A" Width="100%" CssClass="padLeft"></asp:TextBox>
              </td>
            <td width="72" __designer:mapid="36">
                <asp:Button ID="btCalcular" runat="server" Text="Calcular" 
                    BackColor="Transparent" BorderStyle="None" BorderWidth="0px" Font-Names="Arial" 
                    Font-Size="11px" ForeColor="#FFCCCC" Height="16px" Width="47px" />
              </td>
          </tr>
          
        </table></td>
      </tr>
      <tr>
          <td style=" background-image:url(/Imagens/rodapetb.png); background-repeat:no-repeat; height: 30px;">
          &nbsp;
          </td>
          </tr>
    </table>
    <br /><br />    
    <asp:Panel ID="pEnderecoEntrega" runat="server" Visible="False">
        <table style="width:100%;">
            <tr>
                <td class="style7">
                    Endereço:</td>
                <td>
                    <asp:TextBox ID="tbEntEndereco" runat="server" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Número:</td>
                <td>
                    <asp:TextBox ID="tbEntNumero" runat="server" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Complemento:</td>
                <td>
                    <asp:TextBox ID="tbEntComp" runat="server" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Bairro:</td>
                <td>
                    <asp:TextBox ID="tbEntBairro" runat="server" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Cidade:</td>
                <td>
                    <asp:TextBox ID="tbEntCidade" runat="server" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Estado:</td>
                <td>
                    <asp:DropDownList ID="ddEntEstado" runat="server" CssClass="textBox">
                        <asp:ListItem Value="AC">AC</asp:ListItem>
                        <asp:ListItem Value="AL">AL</asp:ListItem>
                        <asp:ListItem Value="AP">AP</asp:ListItem>
                        <asp:ListItem Value="AM">AM</asp:ListItem>
                        <asp:ListItem Value="BA">BA</asp:ListItem>
                        <asp:ListItem Value="CE">CE</asp:ListItem>
                        <asp:ListItem Value="DF">DF</asp:ListItem>
                        <asp:ListItem Value="ES">ES</asp:ListItem>
                        <asp:ListItem Value="GO">GO</asp:ListItem>
                        <asp:ListItem Value="MA">MA</asp:ListItem>
                        <asp:ListItem Value="MT">MT</asp:ListItem>
                        <asp:ListItem Value="MS">MS</asp:ListItem>
                        <asp:ListItem Value="MG">MG</asp:ListItem>
                        <asp:ListItem Value="PA">PA</asp:ListItem>
                        <asp:ListItem Value="PB">PB</asp:ListItem>
                        <asp:ListItem Value="PR">PR</asp:ListItem>
                        <asp:ListItem Value="PE">PE</asp:ListItem>
                        <asp:ListItem Value="PI">PI</asp:ListItem>
                        <asp:ListItem Value="RJ">RJ</asp:ListItem>
                        <asp:ListItem Value="RN">RN</asp:ListItem>
                        <asp:ListItem Value="RS">RS</asp:ListItem>
                        <asp:ListItem Value="RO">RO</asp:ListItem>
                        <asp:ListItem Value="RR">RR</asp:ListItem>
                        <asp:ListItem Value="SC">SC</asp:ListItem>
                        <asp:ListItem Selected="True" Value="SP">SP</asp:ListItem>
                        <asp:ListItem Value="SE">SE</asp:ListItem>
                        <asp:ListItem Value="TO">TO</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p style=" padding-left: 10px;" __designer:mapid="e6">
        <asp:RadioButton ID="rbSedex" runat="server" AutoPostBack="True" Checked="True" 
                GroupName="Entrega" Text="Em até 1 dia últil" />
            <br __designer:mapid="3a" />
            <asp:RadioButton ID="rbMarcado" runat="server" AutoPostBack="True" 
                GroupName="Entrega" 
            Text="Com hora marcada(Apenas para o Estado de SP)" />
            <br />
        &nbsp;<br /> 
        &nbsp; 
        <asp:Label ID="lbData" runat="server" Text="Data da entrega"></asp:Label>
        :
        <asp:TextBox ID="tbData" runat="server" Width="80px" CssClass="textBox"></asp:TextBox>
        <br /><br />
        &nbsp;
        <asp:Label ID="lbHora" runat="server" Text="Hora da entrega:"></asp:Label>
        &nbsp;<asp:TextBox ID="tbHora" runat="server" Width="80px" CssClass="textBox"></asp:TextBox>
&nbsp;<asp:Label ID="lbMSG" runat="server" ForeColor="#993300" Font-Bold="True"></asp:Label>
            </p>
    <p style=" padding-left: 12px; color: #42352D; font-weight: bold; margin-bottom: 0px;" 
        __designer:mapid="e6">
        Frete:
        <asp:Label ID="lbFrete" runat="server" Text="0,00" Font-Bold="True" 
            Font-Size="14px" ForeColor="Maroon"></asp:Label><br />------------------------------------------------------------------------------</p>
    <p style=" padding-left: 12px; color: #42352D; font-weight: bold; padding-left: 10px; margin-top: 0px;" 
        __designer:mapid="e6">
        Valor total:
        <asp:Label ID="lbTotal" runat="server" Text="0,00" Font-Bold="True" 
            Font-Size="14px" ForeColor="Maroon"></asp:Label>
            </p>
    <p style=" color: #BEAFA5; padding-left: 10px; text-align: right;" 
        __designer:mapid="e6">
        <asp:Button ID="btContinuar" runat="server" Text="Continuar &gt;"  
            CssClass="btSmall" Height="28px" Width="91px"/>
    </p>
</asp:Content>


