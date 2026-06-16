
Partial Class Cliente_AlterarSenha
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim A As String = conn.AbrirExato("SELECT cliSenha FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
        If tbSenhaA.Text = A Then
            If tbSenhaN.Text = tbSenhaC.Text Then
                Dim r As String = conn.ExecutaSQL("UPDATE tabClientes SET cliSenha='" + tbSenhaN.Text + "' WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
                If r = "" Then
                    lbMSG.Text = "Gravado com sucesso!"
                Else
                    lbMSG.Text = r
                End If
            Else
                lbMSG.Text = "Nova senha e confirmação não confere!"
            End If
        Else
            lbMSG.Text = "Senha atual não confere!"
        End If
    End Sub
End Class
