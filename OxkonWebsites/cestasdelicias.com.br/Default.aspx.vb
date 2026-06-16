
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNews.Click
        Dim r As String = ""

        If tbEmail.Text <> "" Then
            If ddAcao.SelectedValue = "C" Then
                r = conn.ExecutaSQL("INSERT INTO tabEmails (emeEmail, emeStatus) VALUES ('" + tbEmail.Text + "', True)")
            End If
            If ddAcao.SelectedValue = "D" Then
                r = conn.ExecutaSQL("UPDATE tabEmails SET emeStatus=False WHERE emeEmail='" + tbEmail.Text + "'")
            End If
            If r = "" Then
                lbMSG.Text = "Gravado com sucesso!"
            Else
                lbMSG.Text = r
            End If
        Else
            lbMSG.Text = "Informe o E-mail!"
        End If
    End Sub
End Class
