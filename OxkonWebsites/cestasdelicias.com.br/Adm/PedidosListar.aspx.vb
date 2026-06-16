Imports System.Data

Partial Class Adm_PedidosListar
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            getPedidos()
        End If
    End Sub

    Sub getPedidos()

        Dim SQLSituacao As String = ""
        If cb1.Checked Then
            SQLSituacao += " carSituacao='A'"
        End If
        If cb2.Checked Then
            If SQLSituacao = "" Then
                SQLSituacao += " carSituacao='T'"
            Else
                SQLSituacao += " OR carSituacao='T'"
            End If
        End If
        If cb3.Checked Then
            If SQLSituacao = "" Then
                SQLSituacao += " carSituacao='E'"
            Else
                SQLSituacao += " OR carSituacao='E'"
            End If
        End If
        If SQLSituacao <> "" Then
            SQLSituacao = " AND (" + SQLSituacao + ")"
        End If

        Dim SQLDataI As String = ""
        If IsDate(tbDataI.Text) Then
            SQLDataI = " AND carData>=#" + CDate(tbDataI.Text).ToString("dd/MM/yyyy") + " 00:00:00#"
        End If

        Dim SQLDataF As String = ""
        If IsDate(tbDataF.Text) Then
            SQLDataF = " AND carData<=#" + CDate(tbDataF.Text).ToString("dd/MM/yyyy") + " 00:00:00#"
        End If

        With gvPedidos
            .DataSource = conn.getDataReader("SELECT carCodigo, carData, cliNome, (IIF(carSituacao='A','Aguardando pagamento',IIF(carSituacao='T','Transporte',IIF(carSituacao='E','Enregue','')))) AS Situacao FROM tabCarrinho, tabClientes WHERE carUsuario=cliUsuario " + SQLSituacao + SQLDataI + SQLDataF)
            .DataBind()
        End With
    End Sub

    Protected Sub btFiltro_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFiltro.Click
        getPedidos()
    End Sub

    Protected Sub gvPedidos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvPedidos.SelectedIndexChanged
        pDetalhes.Visible = True
        pFiltro.Visible = False
        gvPedidos.Visible = False

        getDetalhes(gvPedidos.SelectedRow.Cells(0).Text)
    End Sub

    Sub getDetalhes(ByVal CodPedido As String)
        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabCarrinho, tabClientes WHERE carUsuario=cliUsuario AND carCodigo=" + CodPedido)
        With dt.Rows(0)
            lbCliente.Text = .Item("cliNome").ToString
            ddSituacao.SelectedValue = .Item("carSituacao").ToString

            lbValorProdutos0.Text = .Item("carValorProdutos").ToString
            lbValorFrete.Text = .Item("carValorFrete").ToString
            'pPag.Visible = False
            Select Case .Item("carFormaPagamento").ToString
                Case "1"
                    lbFormaPagamento.Text = "Visa"
                Case "2"
                    lbFormaPagamento.Text = "Master"
                Case "55"
                    lbFormaPagamento.Text = "Dinners"
                Case "37"
                    lbFormaPagamento.Text = "American Express"
                Case "56"
                    lbFormaPagamento.Text = "Hypercar"
                Case "45"
                    lbFormaPagamento.Text = "Aura"
                Case "10"
                    lbFormaPagamento.Text = "Boleto bancário"
                Case "BR"
                    'pPag.Visible = True
                    lbFormaPagamento.Text = "Transferência/Depósito Bradesco"
                Case "IT"
                    'pPag.Visible = True
                    lbFormaPagamento.Text = "Transferência/Depósito Itaú"
            End Select
            lbCEP.Text = .Item("carCEPDestino").ToString
            If .Item("carCEPDestino").ToString = .Item("cliCEP").ToString Then
                lbEndereco.Text = .Item("cliEndereco").ToString
                lbNumero.Text = .Item("cliEnderecoNume").ToString
                lbComplemento.Text = .Item("cliEnderecoComp").ToString
                lbBairro.Text = .Item("cliBairro").ToString
                lbCidade.Text = .Item("cliCidade").ToString
                lbEstado.Text = .Item("cliEstado").ToString

            Else
                lbEndereco.Text = .Item("carEndereco").ToString
                lbNumero.Text = .Item("carEnderecoNume").ToString
                lbComplemento.Text = .Item("carEnderecoComp").ToString
                lbBairro.Text = .Item("carBairro").ToString
                lbCidade.Text = .Item("carCidade").ToString
                lbEstado.Text = .Item("carEstado").ToString

            End If
            Select Case .Item("carTipoEntrega").ToString
                Case "1"
                    lbTipoEntrega.Text = "Sedex"
                Case "2"
                    lbTipoEntrega.Text = "Motoboy"
            End Select
            lbDe.Text = .Item("carNomeDE").ToString
            lbPara.Text = .Item("carNomePARA").ToString
            lbMensagem.Text = .Item("carMensagem").ToString
        End With

        With gvItens
            .DataSource = conn.getDataReader("SELECT * FROM tabCarrinhoItens, tabProdutos WHERE iteCodProduto=proCodigo AND iteCodCarrinho=" + CodPedido)
            .DataBind()
            conn.Fechar()
        End With

    End Sub

    Protected Sub btVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btVoltar.Click
        pDetalhes.Visible = False
        pFiltro.Visible = True
        gvPedidos.Visible = True
        getPedidos()
    End Sub


    Protected Sub ddSituacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddSituacao.SelectedIndexChanged
        Dim r As String = conn.ExecutaSQL("UPDATE tabCarrinho SET carSituacao='" + ddSituacao.SelectedValue + "' WHERE carCodigo=" + gvPedidos.SelectedRow.Cells(0).Text)
        If r = "" Then
            Dim mail As New Mail
            Dim EmailLoja As String = conn.AbrirExato("SELECT cadEmail FROM tabCadLoja")
            Dim EmailCliente As String = conn.AbrirExato("SELECT cliEmail FROM tabClientes, tabCarrinho WHERE carUsuario=cliUsuario AND carCodigo=" + gvPedidos.SelectedRow.Cells(0).Text)
            Select Case ddSituacao.SelectedValue
                Case "A"
                    mail.Enviar(EmailCliente, "", EmailLoja, "Status do Pedido Alterado", "Olá, <br><br>Gostariamos de informar que o status do seu pedido foi alterado para <b>Aguardando Pagamento</b>.<br><br>Atenciosamente,<br>Equipe Cestas Delícias")

                Case "T"
                    mail.Enviar(EmailCliente, "", EmailLoja, "Status do Pedido Alterado", "Olá, <br><br>Gostariamos de informar que o status do seu pedido foi alterado para <b>Transporte</b>.<br><br>Atenciosamente,<br>Equipe Cestas Delícias")
                Case "E"
                    mail.Enviar(EmailCliente, "", EmailLoja, "Status do Pedido Alterado", "Olá, <br><br>Gostariamos de informar que o status do seu pedido foi alterado para <b>Entregue</b>.<br><br>Atenciosamente,<br>Equipe Cestas Delícias")


                    Dim dt As DataTable = conn.getDataTable("SELECT iteCodProduto FROM tabCarrinhoItens WHERE iteCodCarrinho=" + gvPedidos.SelectedRow.Cells(0).Text)
                    Dim x As Integer
                    For x = 0 To dt.Rows.Count - 1
                        Dim QTDEstoque As Integer = conn.AbrirExato("SELECT proEstoque FROM tabProdutos WHERE proCodigo=" + dt.Rows(x).Item("iteCodProduto").ToString)
                        QTDEstoque = QTDEstoque - 1
                        r = conn.ExecutaSQL("UPDATE tabProdutos SET proEstoque=" + QTDEstoque.ToString + " WHERE proCodigo=" + dt.Rows(x).Item("iteCodProduto").ToString)
                    Next

            End Select

        Else

            Response.Write(r)
        End If
    End Sub
End Class
