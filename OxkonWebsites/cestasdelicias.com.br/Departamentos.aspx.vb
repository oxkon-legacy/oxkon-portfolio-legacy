
Partial Class Departamentos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim conn As New Conexao
        Dim Depto As String = conn.AbrirExato("SELECT catNome FROM tabCategorias WHERE catCodigo=" + Request.QueryString("Categoria"))
        lbDepartamento.Text = Depto

        Dim f As New Funcoes
        ltProdutos.Text = f.Produtos("SELECT proCodigo, proNome, proEstoque, proValor, proFotoL FROM tabProdutos WHERE proCodCategoria=" + Request.QueryString("Categoria"))
    End Sub
End Class
