
Partial Class Cliente_Pedidos
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            getPedidos()
        End If
    End Sub

    Sub getPedidos()

        Dim SQLAdd As String = " AND carSituacao=" + ddSituacao.SelectedValue
        If ddSituacao.SelectedValue = "T" Then
            SQLAdd = ""
        End If

        With gvPedidos

            .DataSource = conn.getDataReader("SELECT carCodigo, carData, carValorTotal, carSituacao FROM tabCarrinho WHERE carUsuario='" + HttpContext.Current.User.Identity.Name + "'" + SQLAdd)
            .DataBind()
        End With
    End Sub

    Protected Sub ddSituacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddSituacao.SelectedIndexChanged
        getPedidos()
    End Sub

    Protected Sub gvPedidos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvPedidos.SelectedIndexChanged
        Response.Redirect("PedidosDetalhes.aspx?Cod=" + gvPedidos.SelectedRow.Cells(0).Text)
    End Sub
End Class
