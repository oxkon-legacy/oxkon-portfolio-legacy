Imports System.Data

Partial Class Cliente_Carrinho4
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Sub FormaPagamento()
        If HttpContext.Current.User.Identity.Name <> "" Then

            Dim MeioPagamento As String = ""
            Dim r As String = ""

            Select Case True
                Case rbVisa.Checked
                    MeioPagamento = "1"
                Case rbMaster.Checked
                    MeioPagamento = "2"
                Case rbDinners.Checked
                    MeioPagamento = "55"
                Case rbAmericanExpress.Checked
                    MeioPagamento = "37"
                Case rbHipercar.Checked
                    MeioPagamento = "56"
                Case rbAura.Checked
                    MeioPagamento = "45"
                Case rbBoleto.Checked
                    MeioPagamento = "10"
                Case rbBradesco.Checked
                    r = conn.ExecutaSQL("UPDATE tabCarrinho SET carFormaPagamento='BR', carValorProdutos=" + conn.formatBD(Session("ValorProdutos"), "I") + ", carValorFrete=" + conn.formatBD(Session("ValorFrete"), "I") + " WHERE carCodigo=" + Session("CodCarrinho"))
                    If r = "" Then
                        ltFinalizar.Text = "<b>Para finalizar a compra, basta realizar a tranferência ou depósito de <br />" + FormatCurrency(CDec(Session("ValorProdutos")) + CDec(Session("ValorFrete")), 2).ToString + " no Bradesco: </b><br><br><b>Banco:</b> Bradesco<br>Agência: 449 <br><b>Conta:</b> 177176-0 <br><b>Favorecido:</b> Rosedite Oliveira Rios - ME <br><br><b>Observação:</b> Após realizar o pagamento, favor confirmá-lo enviando um e-mail para atendimento@cestasdelicias.com.br informando o número de seu pedido(" + Session("CodCarrinho") + ") ou verificando 'Pedidos' em nosso site.<br><br><a href=""/CompraFinalizada.aspx""><img src=""/Imangens/btFinalizar.gif""></a>"

                    Else
                        ltFinalizar.Text = r
                    End If
                    Exit Sub
                Case rbItau.Checked
                    r = conn.ExecutaSQL("UPDATE tabCarrinho SET carFormaPagamento='IT', carValorProdutos=" + conn.formatBD(Session("ValorProdutos"), "I") + ", carValorFrete=" + conn.formatBD(Session("ValorFrete"), "I") + " WHERE carCodigo=" + Session("CodCarrinho"))

                    If r = "" Then
                        ltFinalizar.Text = "<b>Para finalizar a compra, basta realizar a tranferência ou depósito de<br/>" + FormatCurrency(CDec(Session("ValorProdutos")) + CDec(Session("ValorFrete")), 2).ToString + " no Itaú: </b><br><br><b>Banco:</b> Itaú<br><b>Agência:</b> 0262  <br><b>Conta:</b> 60062-0 <br><b>Favorecido:</b> Rosedite Oliveira Rios <br><br><b>Observação:</b> Após realizar o pagamento, favor confirmá-lo enviando um e-mail para atendimento@cestasdelicias.com.br informando o número de seu pedido(" + Session("CodCarrinho") + ") ou verificando 'Pedidos' em nosso site.<br><br><a href=""/CompraFinalizada.aspx""><img src=""/Imangens/btFinalizar.gif""></a>"

                    Else
                        ltFinalizar.Text = r
                    End If

                    Exit Sub
            End Select

            Dim Produtos As String = ""

            Dim x As Integer
            Dim dt As DataTable = conn.getDataTable("SELECT iteCodigo, proNome, iteQTD, proValor, proPeso FROM tabCarrinhoItens, tabProdutos WHERE iteCodProduto=proCodigo AND iteCodCarrinho=" + Session("CodCarrinho"))
            For x = 0 To dt.Rows.Count - 1
                Dim QTD As String = dt.Rows(x).Item("iteQTD").ToString
                Dim CodItem As String = dt.Rows(x).Item("iteCodigo").ToString
                Dim Produto As String = dt.Rows(x).Item("proNome").ToString
                Dim Valor As String = dt.Rows(x).Item("proValor").ToString

                Produtos += "<input name=""produto_codigo_" + (x + 1).ToString + """ type=""hidden"" value=""" + CodItem + """> " + _
                            "<input name=""produto_descricao_" + (x + 1).ToString + """ type=""hidden"" value=""" + Produto + """>" + _
                            "<input name=""produto_qtde_" + (x + 1).ToString + """ type=""hidden"" value=""" + QTD + """> " + _
                            "<input name=""produto_valor_" + (x + 1).ToString + """ type=""hidden"" value=""" + Valor + """ > "
                '"<input name=""produto_extra_" + (x + 1).ToString + """ type=""hidden"" value=""Camiseta Dry Fit"" > "
            Next

            'DADOS DA LOJA
            dt = conn.getDataTable("SELECT cadRazao, cadCNPJ, cadEmail FROM tabCadLoja")
            Dim LojaNome As String = dt.Rows(0).Item("cadRazao").ToString
            Dim LojaCNPJ As String = dt.Rows(0).Item("cadCNPJ").ToString
            Dim LojaEmail As String = dt.Rows(0).Item("cadEmail").ToString

            'DADOS DO CLIENTE
            dt = conn.getDataTable("SELECT * FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
            Dim Sexo As String = "M"
            If dt.Rows(0).Item("cliSexo").ToString = "F" Then
                Sexo = "F"
            End If

            r = conn.ExecutaSQL("UPDATE tabCarrinho SET carFormaPagamento=" + conn.formatBD(MeioPagamento, "S") + ", carValorProdutos=" + conn.formatBD(Session("ValorProdutos"), "I") + ", carValorFrete=" + conn.formatBD(Session("ValorFrete"), "I") + " WHERE carCodigo=" + Session("CodCarrinho"))
            If r = "" Then

                With dt.Rows(0)

                    ltFinalizar.Text = "</form><form name=""pagamentodigital"" id=""pagamentodigital"" action=""https://www.pagamentodigital.com.br/checkout/pay/"" method=""post"">" + _
                                               "<input name=""email_loja"" type=""hidden"" value=""" + LojaEmail + """> " + _
                                               Produtos + _
                                               "<input name=""tipo_integracao"" type=""hidden"" value=""PAD"">" + _
                                               "<input name=""id_pedido"" type=""hidden"" value=""" + Session("CodCarrinho") + """> " + _
                                               "<input name=""email"" type=""hidden"" value=""" + .Item("cliEmail").ToString + """ > " + _
                                               "<input name=""nome"" type=""hidden"" value=""" + .Item("cliNome").ToString + """>" + _
                                               "<input name=""rg"" type=""hidden"" value=""" + .Item("cliRG").ToString + """>" + _
                                               "<input name=""cpf"" type=""hidden"" value=""" + .Item("cliCPF").ToString + """>" + _
                                               "<input name=""sexo"" type=""hidden"" value=""" + Sexo + """>" + _
                                               "<input name=""data_nascimento"" type=""hidden"" value=""" + CDate(.Item("cliNasc").ToString).ToString("dd-MM-yyyy") + """>" + _
                                               "<input name=""telefone"" type=""hidden"" value=""" + .Item("cliTelefoneResDDD").ToString + .Item("cliTelefoneRes").ToString + """> " + _
                                               "<input name=""celular"" type=""hidden"" value=""" + .Item("cliTelefoneMovDDD").ToString + .Item("cliTelefoneMov").ToString + """> " + _
                                               "<input name=""endereco"" type=""hidden"" value=""" + .Item("cliEndereco").ToString + ", " + .Item("cliEnderecoNume").ToString + """>" + _
                                               "<input name=""complemento"" type=""hidden"" value=""" + .Item("cliEnderecoComp").ToString + """>" + _
                                               "<input name=""bairro"" type=""hidden"" value=""" + .Item("cliBairro").ToString + """>" + _
                                               "<input name=""cidade"" type=""hidden"" value=""" + .Item("cliCidade").ToString + """>" + _
                                               "<input name=""estado"" type=""hidden"" value=""" + .Item("cliEstado").ToString + """>" + _
                                               "<input name=""cep"" type=""hidden"" value=""" + .Item("cliCEP").ToString + """>" + _
                                               "<input name=""url_retorno"" type=""hidden"" value=""http://cestasdelicias.zoudesign.com.br/CompraFinalizada.aspx"">" + _
                                               "<input name=""cliente_razao_social"" type=""hidden"" value=""" + LojaNome + """>" + _
                                               "<input name=""cliente_cnpj"" type=""hidden"" value=""" + LojaCNPJ + """>" + _
                                               "<input name=""parcela_maxima"" type=""hidden"" value=""10"">" + _
                                               "<input name=""meio_pagamento"" type=""hidden"" value=""" + MeioPagamento + """>" + _
                                               "<input name=""redirect"" type=""hidden"" value=""true"">" + _
                                               "<input type=""image"" src=""https://www.pagamentodigital.com.br/webroot/img/bt_comprar.gif"" value=""Comprar"" alt=""Comprar"" border=""0"" align=""absbottom"" onClick=""javascript:document.pagamentodigital.submit()"">" + _
                                               " "


                End With
            Else
                ltFinalizar.Text = r
            End If

            '"<input name=""data_emissao_rg"" type=""hidden"" value=""1987-02-24"">" + _
            '"<input name=""frete"" type=""hidden"" value=""10"">" + _
            '"<input name=""orgao_emissor_rg"" type=""hidden"" value=""SSP"">" + _
            '"<input name=""estado_emissor_rg"" type=""hidden"" value=""SP"">" + _
            '"<input name=""free"" type=""hidden"" value="""">" + _
            '"<input name=""tipo_frete"" type=""hidden"" value=""sedex"">" + _
            '"<input name=""desconto"" type=""hidden"" value=""50.00"">" + _
            '"<input name=""acrescimo"" type=""hidden"" value=""12.00"">" + _
        Else
            ltFinalizar.Text = "Para fechar o pedido é necessário se logar."
        End If
    End Sub

    Protected Sub rbVisa_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbVisa.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbMaster_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbMaster.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbDinners_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbDinners.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbAmericanExpress_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbAmericanExpress.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbHipercar_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbHipercar.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbAura_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbAura.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbBoleto_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbBoleto.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbBradesco_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbBradesco.CheckedChanged
        FormaPagamento()
    End Sub

    Protected Sub rbItau_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbItau.CheckedChanged
        FormaPagamento()
    End Sub
End Class
