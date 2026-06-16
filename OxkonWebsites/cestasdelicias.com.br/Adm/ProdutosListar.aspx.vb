Imports System.Data

Partial Class Adm_ProdutosListar
    Inherits System.Web.UI.Page
    Dim conn As New Conexao


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            getCategorias(ddCategorias)
            getCategorias(ddCategoriasE)

            getFornecedores(ddForn)
            getFornecedores(ddFornE)
            getProdutos()
        End If
    End Sub

    Sub getCategorias(ByVal dd As DropDownList)
        With dd
            .DataSource = conn.getDataReader("SELECT * FROM tabCategorias WHERE catStatus=True ORDER BY catNome")
            .DataValueField = "catCodigo"
            .DataTextField = "catNome"
            .DataBind()
            .Items.Insert(0, New ListItem("Selecione", "0"))
        End With
        conn.Fechar()
    End Sub

    Sub getFornecedores(ByVal dd As DropDownList)
        With dd
            .DataSource = conn.getDataReader("SELECT * FROM tabFornecedores ORDER BY forNome")
            .DataValueField = "forCodigo"
            .DataTextField = "forNome"
            .DataBind()
            .Items.Insert(0, New ListItem("Selecione", "0"))

        End With
        conn.Fechar()
    End Sub

    Sub getProdutos()
        Dim SQLCat As String = ""
        If ddCategorias.SelectedValue <> "0" Then
            SQLCat = " AND proCodCategoria=" + ddCategorias.SelectedValue
        End If

        Dim SQLForn As String = ""
        If ddForn.SelectedValue <> "0" Then
            SQLForn = " AND proFabricante=" + SQLForn
        End If

        With gvProdutos
            .DataSource = conn.getDataReader("SELECT * FROM tabCategorias, tabProdutos, tabFornecedores WHERE proCodCategoria=catCodigo AND proFabricante=forCodigo " + SQLCat + SQLForn)
            .DataBind()
        End With

        conn.Fechar()
    End Sub

    Protected Sub ddCategorias_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddCategorias.SelectedIndexChanged
        getProdutos()
    End Sub

    Protected Sub ddForn_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddForn.SelectedIndexChanged
        getProdutos()
    End Sub

    Protected Sub gvProdutos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvProdutos.SelectedIndexChanged
        Dim Cod As String = gvProdutos.SelectedRow.Cells(0).Text

        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabProdutos WHERE proCodigo=" + Cod)

        With dt.Rows(0)
            tbNome.Text = .Item("proNome").ToString
            tbValor.Text = .Item("proValor").ToString
            tbEstoque.Text = .Item("proEstoque").ToString
            ddCategoriasE.SelectedValue = .Item("proCodCategoria").ToString
            ddFornE.SelectedValue = .Item("proFabricante").ToString
            tbPeso.Text = .Item("proPeso").ToString
            ftbDesc.Text = .Item("proDescricao").ToString
            cbStatus.Checked = .Item("proStatus")
        End With

        pEditar.Visible = True
        gvProdutos.Visible = False
        btNovo.Visible = False
    End Sub

    Protected Sub btNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNovo.Click
        tbNome.Text = ""
        tbValor.Text = ""
        tbEstoque.Text = ""
        ddCategorias.SelectedValue = "0"
        ddFornE.SelectedValue = "0"
        tbPeso.Text = ""
        ftbDesc.Text = ""

        ViewState("N") = "S"

        pEditar.Visible = True
        gvProdutos.Visible = False
        btNovo.Visible = False
    End Sub

    Protected Sub btGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGravar.Click
        Dim r As String = ""
        Dim Cod As String = ""
        If ViewState("N") = "S" Then
            Cod = conn.AbrirExato("SELECT MAX(proCodigo) FROM tabProdutos")
            If IsNumeric(Cod) Then
                Cod = (CInt(Cod) + 1).ToString
            Else
                Cod = "1"
            End If
            r = conn.ExecutaSQL("INSERT INTO tabProdutos (proCodigo) VALUES (" + Cod + ")")
            If r <> "" Then
                Response.Write(r)
                Exit Sub
            End If
            ViewState("N") = Nothing
        Else
            Cod = gvProdutos.SelectedRow().Cells(0).Text
        End If

        Dim Status As String = "False"
        If cbStatus.Checked Then
            Status = "True"
        End If

        Dim FotoL As String = ""
        If fuLista.PostedFile.FileName.ToString <> "" Then
            FotoL = ", proFotoL='L" + Cod + fuLista.FileName + "' "
            fuLista.SaveAs(Server.MapPath("..\Imagens\Produtos\L" + Cod + fuLista.FileName))
        End If
        Dim FotoD As String = ""
        If fuDetalhes.PostedFile.FileName.ToString <> "" Then
            FotoD = ", proFotoD='D" + Cod + fuDetalhes.FileName + "' "
            fuDetalhes.SaveAs(Server.MapPath("..\Imagens\Produtos\D" + Cod + fuDetalhes.FileName))
        End If

        r = conn.ExecutaSQL("UPDATE tabProdutos SET proCodCategoria=" + ddCategoriasE.SelectedValue + ", proNome='" + tbNome.Text + "', proDescricao='" + ftbDesc.Text + "', proValor=" + conn.formatBD(tbValor.Text, "I") + ", proEstoque=" + conn.formatBD(tbEstoque.Text, "I") + ", proFabricante=" + ddFornE.SelectedValue + ", proPeso=" + conn.formatBD(tbPeso.Text, "I") + ", proStatus=" + Status + " " + FotoL + FotoD + " WHERE proCodigo=" + Cod)

        If r = "" Then
            pEditar.Visible = False
            gvProdutos.Visible = True
            btNovo.Visible = True
            getProdutos()
        Else
            Response.Write(r)
        End If
    End Sub
End Class
