Imports System.Data

Partial Class CompraFinalizada
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim mail As New Mail
            Dim EmailLoja As String = conn.AbrirExato("SELECT cadEmail FROM tabCadLoja")
            Dim EmailCliente As String = ""
            Dim FormaPagamento As String = ""
            Dim tipoEntrega As String = ""
            Dim nomeCliente As String = ""
            Dim DataCompra As String = ""
            Dim EnderecoEntrega As String = ""
            Dim TotalCompra As Decimal = 0
            Dim TotalFrete As Decimal = 0
            Dim CartaoPresente As String = ""



            Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabCarrinho, tabClientes WHERE carUsuario=cliUsuario AND carCodigo=" + Session("CodCarrinho"))
            With dt.Rows(0)

                EmailCliente = .Item("cliEmail")
                nomeCliente = .Item("cliNome")
                DataCompra = .Item("carData")
                TotalCompra = .Item("carValorProdutos")
                TotalFrete = .Item("carValorFrete")
                If .Item("carCartao") Then
                    CartaoPresente = "De " + .Item("carNomeDE").ToString + " Para " + .Item("carNomePARA").ToString + "<br>" + _
                    "Mensagem: " + .Item("carMensagem").ToString
                Else
                    CartaoPresente = "Nenhum"
                End If

                If .Item("cliCEP").ToString = .Item("carCEPDestino").ToString Then
                    EnderecoEntrega = .Item("cliEndereco").ToString + ", " + .Item("cliEnderecoNume").ToString + " - " + .Item("cliEnderecoComp").ToString + " - " + .Item("cliBairro").ToString + " - " + .Item("cliCidade").ToString + " - " + .Item("cliEstado").ToString
                Else
                    EnderecoEntrega = .Item("carEndereco").ToString + ", " + .Item("carEnderecoNume").ToString + " - " + .Item("carEnderecoComp").ToString + " - " + .Item("carBairro").ToString + " - " + .Item("carCidade").ToString + " - " + .Item("carEstado").ToString
                End If
                'lbValorTotal.Text = .Item("carValorTotal").ToString
                'pPag.Visible = False
                Select Case .Item("carFormaPagamento").ToString
                    Case "1"
                        FormaPagamento = "Visa"
                    Case "2"
                        FormaPagamento = "Master"
                    Case "55"
                        FormaPagamento = "Dinners"
                    Case "37"
                        FormaPagamento = "American Express"
                    Case "56"
                        FormaPagamento = "Hypercar"
                    Case "45"
                        FormaPagamento = "Aura"
                    Case "10"
                        FormaPagamento = "Boleto bancário"
                    Case "BR"
                        'pPag.Visible = True
                        FormaPagamento = "Transferência/Depósito Bradesco<br>" + _
                        "<b>Banco:</b> Bradesco<br>Agência: 449 <br><b>Conta:</b> 177176-0 <br><b>Favorecido:</b> Rosedite Oliveira Rios - ME <br>"
                    Case "IT"
                        'pPag.Visible = True
                        FormaPagamento = "Transferência/Depósito Itaú<br>" + _
                        "<b>Banco:</b> Itaú<br><b>Agência:</b> 0262  <br><b>Conta:</b> 60062-0 <br><b>Favorecido:</b> Rosedite Oliveira Rios"
                End Select
                'lbCEP.Text = .Item("carCEPDestino").ToString
                'lbEndereco.Text = .Item("carEndereco").ToString
                'lbNumero.Text = .Item("carEnderecoNume").ToString
                'lbComplemento.Text = .Item("carEnderecoComp").ToString
                'lbBairro.Text = .Item("carBairro").ToString
                'lbCidade.Text = .Item("carCidade").ToString
                'lbEstado.Text = .Item("carEstado").ToString
                Select Case .Item("carTipoEntrega").ToString
                    Case "1"
                        tipoEntrega = "Em até 1 dia útil."
                    Case "2"
                        tipoEntrega = "Com data e hora marcada."
                End Select
                'lbDe.Text = .Item("carNomeDE").ToString
                'lbPara.Text = .Item("carNomePARA").ToString
                'lbMensagem.Text = .Item("carMensagem").ToString
            End With


            dt = conn.getDataTable("SELECT iteQTD as QTD, proNome AS Produto, iteValorUni AS VlUnitario, (iteValorUni * iteQTD) AS VlTotal FROM tabCarrinhoItens, tabProdutos WHERE iteCodProduto=proCodigo AND iteCodCarrinho=" + Session("CodCarrinho"))
            Dim Pedido As String = ""
            With dt.Rows(0)
                Dim x As Integer
                For x = 0 To dt.Rows.Count - 1
                    Pedido = "<table width=""100%""><tr><td>QTD</td><td>Produto</td><td>Vl Unitário</td><td>Vl Total</td></tr>" + _
                    "<tr><td>" + .Item("QTD").ToString + "</td><td>" + .Item("Produto").ToString + "</td><td>" + .Item("VlUnitario").ToString + "</td><td>" + .Item("VlTotal").ToString + "</td></tr>" + _
                    "</table>"
                Next
                Pedido += "<br>Total Produtos: " + FormatCurrency(TotalCompra, 2).ToString + "<br>Total Frete: " + FormatCurrency(TotalFrete, 2).ToString + "<br>Total Compra: " + FormatCurrency(TotalCompra + TotalFrete, 2).ToString + ""
            End With
            dt = Nothing


            Dim m As String = "Cestas Delícias - Café & Cia<br>" + _
                                                      "Rua Avanhadava, 459 - Consolação" + _
                                                      "São Paulo/SP - Brasil - " + EmailLoja + "<br><br><hr>" + _
                                                      "Compra de " + nomeCliente + " em " + CDate(DataCompra).ToString("dd/MM/yyyy") + "<hr>" + _
                                                      "Obrigado por comprar na Cestas Delícias Café & Cia.!<br>" + _
                                                      "Esta é a confirmação de que seu pedido de No. " + Session("CodCarrinho") + " foi finalizado com sucesso.<br><hr>" + _
                                                      "<b>Entrega</b><br>" + _
                                                      "Para evitar extravios e garantir que a entrega seja feita corretamente, o pedido somente será deixado no endereço solicitado mediante a assinatura de quem for recebê-lo.<br>" + _
                                                      "A forma de entrega escolhida foi " + tipoEntrega + "<br>" + _
                                                      "<b>Local da entrega:</b> " + EnderecoEntrega + "<br><hr>" + _
                                                      "<b>Cartão de Presente</b><br>" + _
                                                      CartaoPresente + "<br><hr>" + _
                                                      "<b>Pagamento</b><br>" + _
                                                      "A confirmação de pagamento dos pedidos feitos com boleto bancário, depósito bancário deve ser feita em até 5 (cinco) dias úteis , é preciso entrar em contato via e-mail ou telefone nos enviando os dados para confirmação de pagamento.<br><hr>" + _
                                                      "Forma de Pagamento:" + FormaPagamento + "<br><hr>" + _
                                                      "Seu Pedido<br>" + _
                                                      Pedido + "<br><hr>" + _
                                                      "LEMBRE-SE de que os dados acima devem estar corretos e completos para não haver demora e dificuldade no atendimento do pedido.<hr><br><br>Atenciosamente,<br>Atendimento ao Cliente<br>Cestas Delícias<br>" + EmailLoja + "<br>www.cestasdelicias.com.br"

            Dim r As String = mail.Enviar(EmailCliente, "", EmailLoja, "Confirmação de sua compra!", m)
            r += mail.Enviar(EmailLoja, "", EmailLoja, "Confirmação de sua compra!", m)

            If r = "" Then
            Else
                Response.Write(r)
            End If

        End If

        Session("CodCarrinho") = ""
        Session("ValorProdutos") = "0"
        Session("ValorFrete") = "0"
        Session("TotalPeso") = "0"

    End Sub
End Class
