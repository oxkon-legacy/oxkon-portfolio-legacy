
Partial Class Adm_CategoriasListar
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            getCategorias()
        End If
    End Sub

    Sub getCategorias()
        With gvCategorias
            .DataSource = conn.getDataReader("SELECT * FROM tabCategorias WHERE catStatus=True ORDER BY catNome")
            .DataBind()
        End With
    End Sub

    Protected Sub btNova_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNova.Click
        tbNome.Visible = True
        btGravar.Visible = True
        getCategorias()
    End Sub

    Protected Sub btGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGravar.Click
        Dim r As String
        r = conn.ExecutaSQL("INSERT INTO tabCategorias (catNome, catStatus) VALUES ('" + tbNome.Text + "', True)")
        If r = "" Then
            tbNome.Visible = False
            tbNome.Text = ""
            btGravar.Visible = False
        Else
            Response.Write(r)
        End If
    End Sub

    Protected Sub gvCategorias_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gvCategorias.RowCancelingEdit
        gvCategorias.EditIndex = -1
        getCategorias()
    End Sub


    Protected Sub gvCategorias_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvCategorias.RowDeleting

        Dim Codigo As String = CType(gvCategorias.Rows(e.RowIndex).Cells(0).FindControl("Label1"), Label).Text

        Dim r As String = ""
        r = conn.ExecutaSQL("UPDATE tabCategorias SET catStatus=False WHERE catCodigo=" + Codigo)

        If r = "" Then
            gvCategorias.EditIndex = -1
            getCategorias()
        Else
            Response.Write(r)
        End If
    End Sub

    Protected Sub gvCategorias_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvCategorias.RowEditing
        gvCategorias.EditIndex = e.NewEditIndex
        getCategorias()
    End Sub

    Protected Sub gvCategorias_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvCategorias.RowUpdating

        Dim Codigo As String = CType(gvCategorias.Rows(e.RowIndex).Cells(0).FindControl("Label1"), Label).Text
        Dim Nome As String = CType(gvCategorias.Rows(e.RowIndex).Cells(0).FindControl("TextBox2"), TextBox).Text

        Dim r As String = ""
        r = conn.ExecutaSQL("UPDATE tabCategorias SET catNome='" + Nome + "' WHERE catCodigo=" + Codigo)
        If r = "" Then
            gvCategorias.EditIndex = -1
            getCategorias()
        Else
            Response.Write(r)
        End If
    End Sub
End Class
