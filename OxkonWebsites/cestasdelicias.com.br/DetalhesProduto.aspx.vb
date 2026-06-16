Imports System.Data
Imports System.IO

Partial Class DetalhesProduto
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Item As String = Request.QueryString("CodProduto")


        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabProdutos, tabFornecedores WHERE proFabricante=forCodigo AND proCodigo=" + Item)
        lbProduto.Text = dt.Rows(0).Item("proNome").ToString
        lbDescricao.Text = dt.Rows(0).Item("proDescricao").ToString
        lbValor.Text = dt.Rows(0).Item("proValor").ToString
        lbFornecedor.Text = dt.Rows(0).Item("forNome").ToString

        Dim arqFoto As New FileInfo(System.Configuration.ConfigurationManager.AppSettings("Imagens") + "\Produtos\" + dt.Rows(0).Item("proFotoD").ToString)
        Dim Foto As String = "/Imagens/Produtos/NaoDisponivel.jpg"
        If arqFoto.Exists Then
            Foto = "/Imagens/Produtos/" + dt.Rows(0).Item("proFotoD").ToString
        End If
        ltFoto.Text = "<img src=""" + Foto + """>"


        hlComprar.NavigateUrl = "/AdicionarCarrinho.aspx?CodProduto=" + Item
    End Sub
End Class
