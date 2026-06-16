Imports System.Data

Partial Class Cliente_Carrinho2
    Inherits System.Web.UI.Page
    Dim conn As New Conexao
    'Dim Total As Decimal = 0
    'Dim TotalPeso As Decimal = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            'Total = CDec(Session("ValorProdutos"))
            'TotalPeso = CDec(Session("TotalPeso"))

            Dim dt As DataTable = conn.getDataTable("SELECT carCEPDestino, carTipoEntrega FROM tabCarrinho WHERE carCodigo=" + Session("CodCarrinho"))
            tbCEP.Text = dt.Rows(0).Item("carCEPDestino").ToString

            If tbCEP.Text = "" Then
                Dim CEPCadastro As String = conn.AbrirExato("SELECT cliCEP FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
                tbCEP.Text = CEPCadastro
            End If

            If dt.Rows(0).Item("carTipoEntrega").ToString = "2" Then
                rbMarcado.Checked = True
                rbSedex.Checked = False
            Else
                rbSedex.Checked = True
                rbMarcado.Checked = False
            End If
            'Response.Write(dt.Rows(0).Item("carTipoEntrega").ToString)
            MudarFormaEntrega()


        End If
    End Sub

    Protected Sub btCalcular_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCalcular.Click
        If IsNumeric(tbCEP.Text) Then
            MudarFormaEntrega()
            'Response.Redirect("Carrinho2.aspx")
        End If
    End Sub


    Sub MudarFormaEntrega()
        Dim f As New Funcoes
        Dim r As Array = f.getEndereco(tbCEP.Text)
        If r(3) = "SP" Then
            rbMarcado.Visible = True
        Else
            rbMarcado.Visible = False
            rbSedex.Checked = True
        End If

        If rbSedex.Checked Then
            lbFrete.Text = f.CalculaValorFrete(tbCEP.Text, CDec(Session("TotalPeso")).ToString.Replace(".", "").Replace(",", "."), CDec(Session("ValorProdutos")))
            tbHora.Visible = False
            lbHora.Visible = False
        Else
            lbFrete.Text = "20,00"
            tbHora.Visible = True
            lbHora.Visible = True
        End If

        If IsNumeric(lbFrete.Text) Then
            Session("ValorFrete") = lbFrete.Text
            lbTotal.Text = (CDec(lbFrete.Text) + CDec(Session("ValorProdutos"))).ToString
        Else
            Session("ValorFrete") = "0"
            lbTotal.Text = Session("ValorProdutos")
        End If

        Dim Tipo As String = "2"
        If rbSedex.Checked Then
            Tipo = "1"
        End If
        Dim r2 As String = conn.ExecutaSQL("UPDATE tabCarrinho SET carUsuario='" + HttpContext.Current.User.Identity.Name + "', carCEPDestino='" + tbCEP.Text + "', carTipoEntrega=" + Tipo + " WHERE carCodigo=" + Session("CodCarrinho"))

        Dim CEPCadastro As String = conn.AbrirExato("SELECT cliCEP FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
        If tbCEP.Text <> CEPCadastro Then
            pEnderecoEntrega.Visible = True
            Dim Endereco As Array = f.getEndereco(tbCEP.Text)
            tbEntEndereco.Text = Endereco(0)
            tbEntBairro.Text = Endereco(1)
            tbEntCidade.Text = Endereco(2)
            ddEntEstado.SelectedValue = Endereco(3)
        Else
            pEnderecoEntrega.Visible = False
        End If

        If r2 = "" Then
            If Page.IsPostBack Then
                Response.Redirect("Carrinho2.aspx")
            End If
        Else
            Response.Write(r2)
        End If


        'Session("Finalizar") = "S"
    End Sub

    Protected Sub rbSedex_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbSedex.CheckedChanged
        MudarFormaEntrega()
        'Response.Redirect("Carrinho2.aspx")
    End Sub

    Protected Sub rbMarcado_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbMarcado.CheckedChanged
        MudarFormaEntrega()
        'Response.Redirect("Carrinho2.aspx")
    End Sub

    Protected Sub btContinuar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btContinuar.Click
        Validar()
    End Sub

    Sub Validar()
        If rbMarcado.Checked Then
            If IsDate(tbData.Text + " " + tbHora.Text) Then
                If tbEntNumero.Text = "" And pEnderecoEntrega.Visible Then
                    lbMSG.Text = "Favor informar o número do endereço!"
                    Exit Sub
                Else
                    GravarSeguir()
                End If
            Else
                lbMSG.Text = "Favor informar a data e hora da entrega!"
                Exit Sub
            End If
        Else
            GravarSeguir()
        End If
    End Sub

    Sub GravarSeguir()
        Dim r As String = conn.ExecutaSQL("UPDATE tabCarrinho SET carEndereco=" + conn.formatBD(tbEntEndereco.Text, "S") + ", carEnderecoNume=" + conn.formatBD(tbEntNumero.Text, "S") + ", carEnderecoComp=" + conn.formatBD(tbEntComp.Text, "S") + ", carBairro=" + conn.formatBD(tbEntBairro.Text, "S") + ", carCidade=" + conn.formatBD(tbEntCidade.Text, "S") + ", carEstado=" + conn.formatBD(ddEntEstado.SelectedValue, "S") + ", carHoraEntrega=" + conn.formatBD(tbData.Text + " " + tbHora.Text, "D") + " WHERE carCodigo=" + Session("CodCarrinho"))
        If r = "" Then
            Response.Redirect("Carrinho3.aspx")
        Else
            Response.Write(r)
        End If
    End Sub
End Class
