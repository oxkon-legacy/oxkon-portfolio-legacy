<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Carrinho.aspx.vb" Inherits="Carrinho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        <!
-- body
        {
            font-family: Verdana, Arial, MS Sans Serif;
            font-size: 11px;
        }
        .textBox
        {
            font-family: Verdana, Arial, MS Sans Serif;
            font-size: 11px;
            border-style: solid;
            border-width: 1px;
            border-color: #443D33;
            background: #A79885;
            color: #442922;
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
        .padLeft
        {
            padding-left: 10px;
        }
        -- ></style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<asp:Panel ID="p2" runat="server">
    <p style="font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; color: #42352D;"><b>Itens -&gt;</b> Local e Tipo de Entrega -&gt; Cartão de Presente -&gt; Forma
    de Pagamento</p>
    <table width="493" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="/Imagens/siteMod1_03.png">&nbsp;</td>
  </tr>
  <tr>
    <td height="213" valign="top" bgcolor="#464340" style=" background-image:url(/Imagens/siteMod1_05.png); background-repeat:no-repeat; background-position:top; background-color:"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
            <asp:GridView ID="gvCarrinho" runat="server" AutoGenerateColumns="False" 
                BorderStyle="None" BorderWidth="0px" Font-Names="Arial" Font-Size="11px" 
                Style="margin-top: 0px" Width="100%">
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("proNome") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("proNome") %>'></asp:Label>
                            <asp:HiddenField ID="hfCodigo" runat="server" 
                                Value='<%# Bind("iteCodigo") %>' />
                            <asp:HiddenField ID="hfPeso" runat="server" Value='<%# Bind("proPeso") %>' />
                        </ItemTemplate>
                        <HeaderStyle BorderStyle="None" BorderWidth="0px" Font-Size="1px" />
                        <ItemStyle BorderStyle="None" BorderWidth="0px" CssClass="padLeft" 
                            ForeColor="White" Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("iteQTD") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="tbQTD" runat="server" AutoPostBack="true" 
                                Text='<%# Bind("iteQTD") %>' Width="27px"></asp:TextBox>
                        </ItemTemplate>
                        <ControlStyle CssClass="textBox" />
                        <HeaderStyle BorderStyle="None" BorderWidth="0px" Font-Size="1px" />
                        <ItemStyle BorderStyle="None" BorderWidth="0px" ForeColor="White" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="proValor">
                        <HeaderStyle BorderStyle="None" BorderWidth="0px" Font-Size="1px" />
                        <ItemStyle BorderStyle="None" BorderWidth="0px" ForeColor="White" />
                    </asp:BoundField>
                    <asp:BoundField>
                        <HeaderStyle BorderStyle="None" BorderWidth="0px" Font-Size="1px" />
                        <ItemStyle BorderStyle="None" BorderWidth="0px" ForeColor="White" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagens/siteMod1_07.png" 
                        ShowDeleteButton="True">
                        <HeaderStyle BorderStyle="None" BorderWidth="0px" Font-Size="1px" />
                        <ItemStyle BorderStyle="None" BorderWidth="0px" ForeColor="White" />
                    </asp:CommandField>
                </Columns>
                <AlternatingRowStyle BackColor="#4B4947" />
            </asp:GridView>
          </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
        <tr>
            <td align="right" style="padding-right: 20px;">
                <asp:Button ID="btContinuar" runat="server" CssClass="btSmall" Height="28px" 
                    Text="Continuar &gt;" Width="91px" />
            </td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td style=" background-image:url(/Imagens/tabRdp.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
</table>
       <p style="font-family: Verdana, Arial, MS Sans Serif; font-size: 12px; color: #42352D; font-weight: bold;">
                <b>Valor Total:
                    <asp:Label ID="lbTotal" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Maroon"></asp:Label>
                </b>
            </p>
            <p>
            </p>
            <p>
                &nbsp;</p>
            <p>
            </p>
            <p>
            </p>
        </p __designer:mapid="524">
    </asp:Panel>
</asp:Content>

