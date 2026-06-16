
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim f As New Funcoes
        lbData.Text = f.DiaSemana(Date.Now.DayOfWeek)
        lbData.Text += ", " + Date.Now.Day.ToString + " de " + MonthName(Date.Now.Month) + " de " + Date.Now.Year.ToString

        Dim TotalItens As String = "0"
        Dim ValorTotal As String = "0"
        If Session("CodCarrinho") <> "" Then
            TotalItens = conn.AbrirExato("SELECT COUNT(iteCodigo) FROM tabCarrinhoItens WHERE iteCodCarrinho=" + Session("CodCarrinho"))
            'If CInt(TotalItens) > 0 Then
            ValorTotal = FormatCurrency((CDec(Session("ValorProdutos")) + CDec(Session("ValorFrete"))), 2)
            'End If
        End If
        lbDescCarrinho.Text = "Itens: " + TotalItens + " Total: " + ValorTotal

        gvDepartamentos.DataSource = conn.getDataReader("SELECT * FROM tabCategorias")
        gvDepartamentos.DataBind()
        conn.Fechar()

        lbNome.Text = "Olá, Visitante!"
        If HttpContext.Current.User.Identity.Name <> "" Then
            Dim Nome As String = conn.AbrirExato("SELECT cliNome FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
            lbNome.Text = "Olá, " + Nome + "!"
            lbLogin.Text = "Logoff"
            lbInfo.Text = "<br><img src=""/imagens/user.png"" /><a href=""/Informacoes.aspx"" class=""classe5"">Minhas informações</a>"
        End If

        If Request.ServerVariables("PATH_INFO") = "/Default.aspx" Then
            pTopo.Visible = False
        End If

    End Sub

    Protected Sub btPesquisa_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btPesquisa.Click
        Response.Redirect("/BuscadeProdutos.aspx?p=" + tbPesquisa.Text)
    End Sub

    Protected Sub lbLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbLogin.Click
        If HttpContext.Current.User.Identity.Name <> "" Then
            FormsAuthentication.SignOut()
            Response.Redirect("Default.aspx", True)
        Else
            Response.Redirect("/Login.aspx")
        End If
    End Sub

    Protected Sub btFinalizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFinalizar.Click
        Response.Redirect("/Carrinho.aspx")
    End Sub
End Class

