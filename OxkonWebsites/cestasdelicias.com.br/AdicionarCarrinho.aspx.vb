
Partial Class AdicionarCarrinho
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim r As String = ""

        If Session("CodCarrinho").ToString = "" Then

            Dim codCarrinho As String = conn.AbrirExato("SELECT MAX(carCodigo) FROM tabCarrinho")
            If IsNumeric(codCarrinho) Then
                Session("CodCarrinho") = (CInt(codCarrinho) + 1).ToString
            Else
                Session("CodCarrinho") = 1
            End If

            r += conn.ExecutaSQL("INSERT INTO tabCarrinho (carCodigo, carUsuario, carData, carSituacao) VALUES (" + Session("CodCarrinho").ToString + ", '" + HttpContext.Current.User.Identity.Name + "',#" + Date.Now + "#, 'A')")
            Response.Write(r)
        End If

        Dim Item As String = Request.QueryString("CodProduto")
        Dim ValorUni As String = conn.AbrirExato("SELECT proValor FROM tabProdutos WHERE proCodigo=" + Item)

        Dim SQL As String = "INSERT INTO tabCarrinhoItens (iteCodCarrinho, iteCodProduto, iteQTD, iteValorUni) VALUES (" + Session("CodCarrinho").ToString + ", " + Item.ToString + ", 1, " + conn.formatBD(ValorUni, "I") + ")"
        r += conn.ExecutaSQL(SQL)

        If r = "" Then
            Response.Redirect("Carrinho.aspx")
        Else
            Response.Write(SQL + "<br>Erro ao adicionar produto no carrinho. Favor contatar suporte técnico!")
        End If
    End Sub
End Class
