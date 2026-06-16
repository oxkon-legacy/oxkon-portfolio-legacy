Imports System.Data

Partial Class Adm_NewsletterNova
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub btEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btEnviar.Click
        Dim r As String = ""
        r = conn.ExecutaSQL("INSERT INTO tabNewsletter (newAssunto, newMensagem, newData) VALUES ('" + tbAssunto.Text + "', '" + ftbMensagem.Text + "', " + conn.formatBD(Date.Now, "D") + ")")
        If r = "" Then
            Dim mail As New Mail
            Dim dt As DataTable = conn.getDataTable("SELECT cliEmail FROM tabClientes")
            Dim x As Integer
            Dim EmailLoja As String = conn.AbrirExato("SELECT cadEmail FROM tabCadLoja")
            For x = 0 To dt.Rows.Count - 1
                mail.Enviar(dt.Rows(x).Item("cliEmail").ToString, "", EmailLoja, tbAssunto.Text, ftbMensagem.Text)
            Next
        Else
            Response.Write(r)
        End If
    End Sub

    Protected Sub btTeste_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btTeste.Click
        Dim mail As New Mail

        Dim EmailLoja As String = conn.AbrirExato("SELECT cadEmail FROM tabCadLoja")

        Dim r As String = mail.Enviar(tbTeste.Text, "", EmailLoja, tbAssunto.Text, ftbMensagem.Text)
        If r = "" Then
            lbMSG.TabIndex = "Newsletter enviada com sucesso!"
        Else
            Response.Write(r)
        End If

    End Sub
End Class
