Imports System.Data

Partial Class Adm_NewsletterListar
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            getInformativos()
        End If
    End Sub

    Sub getInformativos()
        With gvNewsletter
            .DataSource = conn.getDataReader("SELECT * FROM tabNewsletter")
            .DataBind()

        End With
        conn.Fechar()
    End Sub

    Protected Sub gvNewsletter_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvNewsletter.SelectedIndexChanged
        Dim Cod As String = gvNewsletter.SelectedRow.Cells(0).Text
        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabNewsletter WHERE newCodigo=" + Cod)
        lbVer.Text = dt.Rows(0).Item("newAssunto").ToString + "<br><br>" + dt.Rows(0).Item("newMensagem").ToString + "<br><br><hr>"

    End Sub
End Class
