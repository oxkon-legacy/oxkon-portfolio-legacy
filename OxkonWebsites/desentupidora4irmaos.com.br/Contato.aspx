<%@ Page Title="Quatro Irmãos - Fale Conosco" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Contato.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
        width: 100%;
    }
    
    .textBox
{
font-family: Trebuchet MS, Arial, Helvetica, sans-serif;
border: solid 1px #C0C4CF;
padding-top: 4px;
padding-right: 4px;
padding-bottom: 4px;
padding-left: 4px;
margin-top: 2px;
margin-right: 2px;
margin-bottom: 2px;
margin-left: 2px;
}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="left" valign="top" style=" padding: 10px;">
      <p>
        <img src="/Imagens/tit_Contato.gif" alt="Empresa" width="219" height="31" />
      </p>
          <p style=" text-align: justify;"><br />
          </p>
          <p style=" text-align: justify;"><strong>Cobrimos orçamentos.</strong><br />
              Entre em contato conosco através dos telefones:
              <br />
              <br />
              (11) 2958-7070 ou (11) 2878-4343 e solicite um orçamento agora mesmo. Preencha o 
              formulário abaixo. Orçamento sem compromisso.
              <br />
              <br />
              <table cellpadding="0" cellspacing="0" class="style2">
                  <tr>
                      <td>
                          Nome</td>
                  </tr>
                  <tr>
                      <td>
                          <asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          Empresa</td>
                  </tr>
                  <tr>
                      <td>
                          <asp:TextBox ID="tbEmpresa" runat="server"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <table cellpadding="0" cellspacing="0" class="style2">
                              <tr>
                                  <td>
                                      Telefone</td>
                                  <td>
                                      E-Mail</td>
                              </tr>
                              <tr>
                                  <td>
                          <asp:TextBox ID="tbTelefone" runat="server"></asp:TextBox>
                                  </td>
                                  <td>
                          <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr>
                      <td>&nbsp;
                          </td>
                  </tr>
                  <tr>
                      <td>
                          Mensagem</td>
                  </tr>
                  <tr>
                      <td>
                          <asp:TextBox ID="tbMensagem" runat="server" Width="100%" Height="200px" 
                              TextMode="MultiLine" CssClass="textBox"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Button ID="btrEnviar" runat="server" Text="Enviar" BackColor="#336699" 
                              BorderColor="#000066" BorderStyle="Solid" BorderWidth="1px" Font-Names="Arial" 
                              Font-Size="12px" ForeColor="White" />
                          <asp:Label ID="lbMSG" runat="server" Font-Names="Arial" 
                              Font-Size="12pt" ForeColor="Red"></asp:Label>
                      </td>
                  </tr>
              </table>
          </p>
        </td>
      <td width="175" align="center" valign="top" style=" padding-top: 8px;"><img src="imagens/Contato.jpg" alt="Quatro_Irmaos" width="159" height="256" /><br />
          <br />&nbsp;</td>
    </tr>
  </table>
</asp:Content>
