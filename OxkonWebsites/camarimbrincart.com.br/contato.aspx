<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Protected Sub rblDescobriu_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        If rblDescobriu.SelectedValue = "Outro" Then
            pEspecifico.Visible = True
        Else
            pEspecifico.Visible = False
        End If
        
    End Sub

    Protected Sub btrEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Descobriu As String = ""
        If rblDescobriu.SelectedValue = "Outro" Then
            Descobriu = tbOutros.Text
        Else
            Descobriu = rblDescobriu.SelectedValue
        End If
        
        Dim mail As New Mail
        Dim r As String = mail.Enviar("contato@camarimbrincart.com.br", "", "contato@camarimbrincart.com.br", "Contato via Site", "Contato via Site<br><br>Nome: " + tbNome.Text + "<br>Email: " + tbEmail.Text + "<br>Telefone: " + tbTelefone.Text + "<br>Endereço:" + txtEndereco.Text + "<br> Quantidade de Crianças:" + txtQuantidade.Text + "<br> Mensagem: " + tbMSG.Text + "<br>Como descobriu: " + Descobriu)
        If r = "" Then
            tbEmail.Text = ""
            tbMSG.Text = ""
            tbNome.Text = ""
            tbOutros.Text = ""
            txtEndereco.Text = ""
            txtQuantidade.Text = ""
            pEspecifico.Visible = False
            tbTelefone.Text = ""
            rblDescobriu.ClearSelection()
            
            lbMSG.Text = "Sua mensagem foi enviada com sucesso!<br>Em breve entraremos em contato."
        Else
            lbMSG.Text = "Ops, erro ao enviar e-mail!<br>" + r
        End If
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Brinc & Art - Camarim Fashion</title>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<style type="text/css">
<!--
body {
	margin-top: 20px;
}
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 100%;
        background-image: url('imagens/BGContato.jpg');
        background-repeat:no-repeat;
    }
    .style3
    {
        height: 23px;
        padding-left:15px;
    }
    .style5
    {
        height: 22px;
    }
    .style6
    {
        height: 29px;
    }
    .style7
    {
        height: 148px;
        padding-left: 10px;
    }
    .btEnviar
    {
        background-image: url(imagens/btEnviar.jpg);
        background-repeat:no-repeat;
    }
    .style8
    {
        height: 19px;
    }
    .style9
    {
        width: 170px;
        padding-left:15px;
    }
    .style10
    {
        width: 29px;
    }
    .style11
    {
        height: 64px;
    }
    .style12
    {
        width: 179px;
    }
    .style13
    {
        width: 18px;
    }
-->
</style></head>

<body style=" background-image:url(imagens/BG.jpg)" onload="MM_preloadImages('imagens/designByGlow.png','imagens/btHomeFx.png','imagens/btServicosFx.png','imagens/btEmpresaFx.png','imagens/btFotosFX.png','imagens/btContatosFx.png')">
    <form id="form1" runat="server">
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="469" valign="top" background="imagens/imgBrinc_03.jpg"><table width="188" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40" height="30">&nbsp;</td>
        <td width="104">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="index.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('home','','imagens/btHomeFx.png',1)"><img src="imagens/btHome.png" alt="Home" name="home" width="148" height="24" border="0" id="home" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="servicos.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Servicos','','imagens/btServicosFx.png',1)"><img src="imagens/btServicos.png" alt="Serviços" name="Servicos" width="148" height="26" border="0" id="Servicos" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="qsomos.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Empresa','','imagens/btEmpresaFx.png',1)"><img src="imagens/btEmpresa.png" alt="Quem Somos" name="Empresa" width="148" height="24" border="0" id="Empresa" /></a></td>
      </tr>
      <tr>
       
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="contato.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('contato','','imagens/btContatosFx.png',1)"><img src="imagens/btContato.png" alt="Contato" name="contato" width="148" height="29" border="0" id="contato" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#762faf"><img src="imagens/qfale.jpg" alt="Quem somos" width="180" height="58" /></td>
  </tr>
  <tr>
    <td height="100" bgcolor="#762faf" style="font-family:Geneva, Arial, Helvetica, sans-serif; font-size:12px; line-height: 16px; color:#FFFFFF; letter-spacing: 1px; padding: 20px; text-align:justify;">
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td style="width:365px;">
                    <table cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td class="style8">
                                </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:TextBox ID="tbNome" runat="server" BackColor="Transparent" 
                                    BorderStyle="None" BorderWidth="0px" Font-Names="Arial" Font-Size="11px" 
                                    ForeColor="#FFFF99" Height="19px" Width="353px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <table cellpadding="0" cellspacing="0" class="style1">
                                    <tr>
                                        <td class="style9">
                                            <asp:TextBox ID="tbEmail" runat="server" BackColor="Transparent" 
                                                BorderWidth="0px" Width="156px" Font-Names="Arial" Font-Size="11px" 
                                                ForeColor="#FFFF99" BorderStyle="None"></asp:TextBox>
                                        </td>
                                        <td class="style10">&nbsp;
                                            </td>
                                        <td>
                                            <asp:TextBox ID="tbTelefone" runat="server" BackColor="Transparent" 
                                                BorderWidth="0px" Font-Names="Arial" Font-Size="11px" ForeColor="#FFFF99" 
                                                Width="133px" BorderStyle="None"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                </td>
                        </tr>
                        <tr>
                            <td><table cellpadding="0" cellspacing="1" class="style1">
                                <tr>
                                    <td class="style12" style=" padding-left: 10px;">
                                        <asp:TextBox ID="txtEndereco" runat="server" BackColor="Transparent" 
                                            BorderStyle="None" BorderWidth="0px" Width="95%" Font-Names="Arial" 
                                            Font-Size="11px" ForeColor="#FFFF99"></asp:TextBox>
                                    </td>
                                    <td class="style13">&nbsp;
                                        </td>
                                    <td>
                                        <asp:TextBox ID="txtQuantidade" runat="server" BackColor="Transparent" 
                                            BorderStyle="None" BorderWidth="0px" Width="74px" Font-Names="Arial" 
                                            Font-Size="11px" ForeColor="#FFFF99"></asp:TextBox>
                                                </td>
                                </tr>
                                </table>
                                </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <asp:TextBox ID="tbMSG" runat="server" BackColor="Transparent" 
                                    BorderStyle="None" BorderWidth="0px" Font-Names="Arial" Font-Size="11px" 
                                    ForeColor="#FFFF99" TextMode="MultiLine" Height="137px" Width="340px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td style="height: 19px; padding-left: 20px;">
                                <asp:Button ID="btrEnviar" runat="server" BackColor="Transparent" 
                                    BorderStyle="None" BorderWidth="0px" Text="Enviar" CssClass="btEnviar" 
                                    Font-Names="Arial" Font-Size="11px" ForeColor="#FFFF99" Height="19px" 
                                    Width="99px" onclick="btrEnviar_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style=" vertical-align: top;">
                    <table cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td align="center">
                                <img src="imagens/titFrContato.jpg" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;
                                </td>
                        </tr>
                        <tr>
                            <td style=" padding-left:25px;">
                                <asp:RadioButtonList ID="rblDescobriu" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="rblDescobriu_SelectedIndexChanged">
                                    <asp:ListItem>Busca pelo Google</asp:ListItem>
                                    <asp:ListItem>Atrav&eacute;s de um amigo (Indica&ccedil;&atilde;o)</asp:ListItem>
                                    <asp:ListItem>Atrav&eacute;s de impressos (Promocional)</asp:ListItem>
                                    <asp:ListItem Value="Outro"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style=" padding-left:25px;">
                                <asp:Panel ID="pEspecifico" runat="server" Width="175px" Visible="False">
                                    Especifique:<asp:TextBox ID="tbOutros" runat="server" BackColor="Transparent" 
                                        BorderColor="#3A1757" BorderStyle="Solid" BorderWidth="1px" Font-Names="Arial" 
                                        Font-Size="11px" ForeColor="#FFFF99" Width="175px"></asp:TextBox>
                                </asp:Panel>
                                <p>
                                    <asp:Label ID="lbMSG" runat="server"></asp:Label>
                                </p>
                            </td>
                        </tr>
                    </table>
                        </td>
            </tr>
        </table>
      </td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="73%">&nbsp;</td>
        <td width="23%"><a href="http://www.zoudesign.com.br" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('designBy','','imagens/designByGlow.png',1)"><img src="imagens/designBy.png" alt="Design By Zoudesign" name="designBy" width="176" height="29" border="0" id="designBy" /></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
