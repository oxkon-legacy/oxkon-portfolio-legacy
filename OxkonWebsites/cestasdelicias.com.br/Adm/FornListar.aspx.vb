
Partial Class Adm_FornListar
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub btNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNovo.Click
        tbNome.Visible = True
        tbNome.Text = ""
        btGravar.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            GetFornecedores()
        End If
    End Sub

    Sub GetFornecedores()
        With gvForncedores
            .DataSource = conn.getDataReader("SELECT * FROM tabFornecedores WHERE forStatus=True ORDER BY forNome")
            .DataBind()
        End With
        conn.Fechar()
    End Sub

    Protected Sub btGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGravar.Click
        Dim r As String = ""
        r = conn.ExecutaSQL("INSERT INTO tabFornecedores (forNome, forStatus) VALUES ('" + tbNome.Text + "', True)")
        If r = "" Then
            tbNome.Visible = False
            tbNome.Text = ""
            btGravar.Visible = False
            GetFornecedores()
        Else
            Response.Write(r)

        End If
    End Sub

    Protected Sub gvForncedores_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvForncedores.RowDeleting
        Dim Cod As String = gvForncedores.Rows(e.RowIndex).Cells(0).Text
        Dim r As String = conn.ExecutaSQL("UPDATE tabFornecedores SET forStatus=False WHERE forCodigo=" + Cod)
        If r = "" Then
            GetFornecedores()
        Else
            Response.Write(r)
        End If

    End Sub
End Class
