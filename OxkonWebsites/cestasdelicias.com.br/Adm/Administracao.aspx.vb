Imports System.Data

Partial Class Adm_Administracao
    Inherits System.Web.UI.Page
    Dim conn As New Conexao


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim dt As DataTable = conn.getDataTable("SELECT usuQTDAcessos, usuAcessoUltimo FROM tabUsuarios WHERE usuUsuario='" + Session("AdmUsuario") + "'")
            Dim QTDAcesso As String = dt.Rows(0).Item("usuQTDAcessos").ToString
            Dim AcessoUltimo As String = dt.Rows(0).Item("usuAcessoUltimo").ToString

            Dim TotalCompras As String = conn.AbrirExato("SELECT COUNT(carCodigo) FROM tabCarrinho")
            Dim TotalClientes As String = conn.AbrirExato("SELECT COUNT(cliCodigo) FROM tabClientes")
            Dim medCompraClientes As String = (CInt(TotalCompras) / CInt(TotalClientes)).ToString
            Dim DataUltCliente As String = conn.AbrirExato("SELECT TOP 1 cliCriacao FROM tabClientes ORDER BY cliCriacao DESC")
            Dim DataUltCompra As String = conn.AbrirExato("SELECT TOP 1 carData FROM tabCarrinho ORDER BY carData DESC")
            Dim TotalProdutos As String = conn.AbrirExato("SELECT COUNT(proCodigo) FROM tabProdutos WHERE proStatus=true")
            Dim TotalProdutosVenda As String = conn.AbrirExato("SELECT COUNT(proCodigo) FROM tabProdutos WHERE proEstoque>0 AND proStatus=true")
            Dim TotalProdutosNao As String = conn.AbrirExato("SELECT COUNT(proCodigo) FROM tabProdutos WHERE proEstoque=0 AND proStatus=true")


            lbEstatisticas.Text = "Esté o seu acesso nº " + QTDAcesso + ", último acesso em " + AcessoUltimo + " hs<br />" + _
                                        "Foram feitas " + TotalCompras + " compras. A loja possui " + TotalClientes + " clientes cadastrados.<br />" + _
                                        "Média de " + medCompraClientes + " compra(s) por cliente<br />" + _
                                        "O último cliente se cadastrou em " + DataUltCliente + "<br />" + _
                                        "A última compra foi efetuada em " + DataUltCompra + "<br />" + _
                                        "A loja possui " + TotalProdutos + " produtos à venda<br />" + _
                                        "Produtos disponiveis: " + TotalProdutosVenda + "<br />" + _
                                        "Produtos não disponíveis: " + TotalProdutosNao
        End If
    End Sub
End Class
