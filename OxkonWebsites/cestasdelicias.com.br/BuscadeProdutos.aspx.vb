
Partial Class BuscadeProdutos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim conn As New Conexao

        Dim p As String = Request.QueryString("p")

        Dim f As New Funcoes
        ltProdutos.Text = f.Produtos("SELECT proCodigo, proNome, proEstoque, proFotoL, proValor FROM tabProdutos WHERE proNome LIKE '%" + p + "%' OR proDescricao LIKE '%" + p + "%'")

    End Sub
End Class
