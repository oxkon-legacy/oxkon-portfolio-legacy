
Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub btrEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btrEnviar.Click
        Dim mail As New Mail
        Dim r As String = mail.Enviar("4irmaos@desentupidora4irmaos.com.br", "", "4irmaos@desentupidora4irmaos.com.br", "Contato via Site", "Contato via Site<br><br><b>Nome:</b> " + tbNome.Text + "<br><b>Empresa:</b> " + tbEmpresa.Text + "<br><b>Email:</b> " + tbEmail.Text + "<br><b>Telefone:</b> " + tbTelefone.Text + "<br><b>Mensagem:</b> " + tbMensagem.Text)
        If r = "" Then
            tbEmail.Text = ""
            tbEmpresa.Text = ""
            tbMensagem.Text = ""
            tbNome.Text = ""
            tbTelefone.Text = ""
            lbMSG.Text = "Sua mensagem foi enviada com sucesso!<br>Em breve entraremos em contato."
        Else
            lbMSG.Text = "Ops, erro ao enviar e-mail!<br>" + r
        End If
    End Sub
End Class
