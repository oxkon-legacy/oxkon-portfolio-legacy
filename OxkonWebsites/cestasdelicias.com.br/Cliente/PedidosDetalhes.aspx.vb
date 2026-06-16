Imports System.Data

Partial Class Cliente_PedidosDetalhes
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim CodPedido As String = Request.QueryString("Cod")
        lbPedido.Text = CodPedido

        If Left(conn.AbrirExato("SELECT carCodigo FROM tabCarrinho WHERE carCodigo=" + CodPedido + " AND carUsuario='" + HttpContext.Current.User.Identity.Name + "'"), 4) = "Erro" Then
            Response.Redirect("Pedidos.aspx")
        End If

        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabCarrinho WHERE carCodigo=" + CodPedido)
        With dt.Rows(0)
            lbValorTotal.Text = .Item("carValorTotal").ToString
            pPag.Visible = False
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
                    pPag.Visible = True
                    lbFormaPagamento.Text = "Transferência/Depósito Bradesco"
                Case "IT"
                    pPag.Visible = True
                    lbFormaPagamento.Text = "Transferência/Depósito Itaú"
            End Select
            lbCEP.Text = .Item("carCEPDestino").ToString
            lbEndereco.Text = .Item("carEndereco").ToString
            lbNumero.Text = .Item("carEnderecoNume").ToString
            lbComplemento.Text = .Item("carEnderecoComp").ToString
            lbBairro.Text = .Item("carBairro").ToString
            lbCidade.Text = .Item("carCidade").ToString
            lbEstado.Text = .Item("carEstado").ToString
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

    Protected Sub lbConfirmar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbConfirmar.Click
        Dim email As String = conn.AbrirExato("SELECT cadEmail FROM tabCadLoja")
        Dim CodPedido As String = Request.QueryString("Cod")

        Dim mail As New Mail
        Dim r As String = mail.Enviar(email, "", email, "Confirmação de Pagamento", "Olá,<br><br>Cliente confirmou o pagamento do pedido " + lbPedido.Text + ".<br>Pagametno realizado via " + lbFormaPagamento.Text + ".")
        If r = "" Then
            lbConfirmar.Enabled = False
            lbMSG.Text = "<br>Seu pagamento foi confirmado! Aguarde verificação.<br>Obrigado"
        Else
            lbMSG.Text = r
        End If

    End Sub
End Class
