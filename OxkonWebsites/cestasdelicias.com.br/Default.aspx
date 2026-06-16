<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Cestas Delícias - Home</title>
<script src="/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
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
<script src="/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<table width="490" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><br/><script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','490','height','218','src','/imagens/banner','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','wmode','transparent','movie','/imagens/banner' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="490" height="218">
      <param name="movie" value="/imagens/banner.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="transparent" />
      <embed src="/imagens/banner.swf" width="490" height="218" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object>
</noscript></td>
  </tr>
  
    <tr>
    <td><br /><br /> <table>
  <tr>
    <td><img src="/imagens/flwLeft.png" /></td>
    <td style="color: #45322C; font-size:12px;"><b>Produtos</b></td>
    <td><img src="/imagens/flwRight.png" /></td>
  </tr>    
  </table><br /></td>
  </tr>

  <tr>
    <td>
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td colspan="2">
                    Para receber nossos Newsletter envie - nos seu e-mail.                 </td>
          <td width="23%">&nbsp;                    </td>
          </tr>
            <tr>
                <td width="46%">
                    E-mail:
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="textBox"></asp:TextBox>                </td>
                <td width="31%">
                    <asp:DropDownList ID="ddAcao" runat="server" CssClass="textBox">
                        <asp:ListItem Value="C">Cadastrar</asp:ListItem>
                        <asp:ListItem Value="D">Descadastrar</asp:ListItem>
                    </asp:DropDownList>                </td>
                <td>
                    <asp:Button ID="btNews" runat="server" Text="Enviar"  CssClass="btSmall" Width="91" Height="28"/>                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lbMSG" runat="server"></asp:Label>                </td>
            </tr>
        </table>
       </td>
  </tr>
</table>
</asp:Content>

