
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btLogin.Click
        Dim conn As New Conexao
        Dim r As String = conn.AbrirExato("SELECT cliUsuario FROM tabClientes WHERE cliUsuario='" + tbUsuario.Text + "' AND cliSenha='" + tbSenha.Text + "'")
        If Left(r, 4) = "Erro" Then
            lbMSG.Text = "Usuário e/ou senha incorreto!"
        Else
            FormsAuthentication.RedirectFromLoginPage(tbUsuario.Text.Trim, _
                cbLembrar.Checked)

        End If
    End Sub
End Class
