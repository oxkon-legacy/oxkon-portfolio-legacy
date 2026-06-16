Imports System.Data

Partial Class LembrarSenha
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub btEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btEnviar.Click
        Dim dt As DataTable = conn.getDataTable("SELECT cliSenha, cliUsuario FROM tabClientes WHERE cliEmail='" + tbEmail.Text + "'")
        If dt.Rows.Count > 0 Then
            Dim mail As New Mail
            Dim r As String = mail.Enviar(tbEmail.Text, "", "atendimento@cestasdelicias.com.br", "Senha", "Olá,<br><br>Sua senha foi solicitada em nosso site:<br><br>Usuário: " + dt.Rows(0).Item("cliUsuario").ToString + "<br>Senha: " + dt.Rows(0).Item("cliSenha").ToString + " <br><br>Atenciosamente,Cestas Delicias")
            If r = "" Then
                lbMSG.Text = "E-mail enviado com sucesso!"
                tbEmail.Text = ""
            Else
                lbMSG.Text = "Erro: " + r
            End If
        Else
            lbMSG.Text = "E-mail não encontrado!"
        End If
    End Sub
End Class
