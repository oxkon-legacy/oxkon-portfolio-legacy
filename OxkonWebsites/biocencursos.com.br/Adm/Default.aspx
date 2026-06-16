<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Adm_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        
    <div id="tudo">
    
        <table>
        <tr>
            <td colspan="2">
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Usuário</td>
            <td>
                <asp:TextBox ID="tbUsuario" runat="server" Width="140px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Senha</td>
            <td>
                <asp:TextBox ID="tbSenha" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cbPermanecer" runat="server" Text="Permanecer logado" />
                <br />
                <asp:Label ID="lbMSG" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btLogin" runat="server" Text="Logar" onclick="btLogin_Click" />
            </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
