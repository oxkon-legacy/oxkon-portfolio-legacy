<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Adm_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
    <img src="/imagens/admTit.png" /><br />
        <br />
        <table cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" style="width:300px; padding: 10px;" align="center">
<tr>
            <td width="9%">
                Usuário:</td>
      <td width="91%">
        <asp:TextBox ID="tbUsuario" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Senha:</td>
            <td>
                <asp:TextBox ID="tbSenha" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<br />
                <asp:Label ID="lbMSG" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                </td>
            <td>
                <asp:Button ID="btLogin" runat="server" Text="Logar" />
            </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
