Imports System.Data

Partial Class Carrinho
    Inherits System.Web.UI.Page
    Dim conn As New Conexao
    Dim Total As Decimal = 0
    Dim TotalPeso As Decimal = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If gvCarrinho.Rows.Count > 0 Then
            Dim x As Integer
            For x = 0 To gvCarrinho.Rows.Count - 1
                Dim QTD As String = CType(gvCarrinho.Rows(x).Cells(1).FindControl("tbQTD"), TextBox).Text
                Dim CodItem As String = CType(gvCarrinho.Rows(x).Cells(0).FindControl("hfCodigo"), HiddenField).Value
                If conn.AbrirExato("SELECT iteQTD FROM tabCarrinhoItens WHERE iteCodigo=" + CodItem + " AND iteCodCarrinho=" + Session("CodCarrinho")) <> QTD Then
                    Session("Finalizar") = "N"
                End If
                conn.ExecutaSQL("UPDATE tabCarrinhoItens SET iteQTD=" + QTD + " WHERE iteCodigo=" + CodItem + " AND iteCodCarrinho=" + Session("CodCarrinho"))
            Next

            'Dim MeioPagamento As String = "0"
            'Select Case True
            '    Case rbVisa.Checked
            '        MeioPagamento = "1"
            '    Case rbMaster.Checked
            '        MeioPagamento = "2"
            '    Case rbDinners.Checked
            '        MeioPagamento = "55"
            '    Case rbAmericanExpress.Checked
            '        MeioPagamento = "37"
            '    Case rbHipercar.Checked
            '        MeioPagamento = "56"
            '    Case rbAura.Checked
            '        MeioPagamento = "45"
            '    Case rbBoleto.Checked
            '        MeioPagamento = "10"
            'End Select


            'Dim entCEP As String = ""
            'Dim entEndereco As String = ""
            'Dim entNumero As String = ""
            'Dim entComp As String = ""
            'Dim entBairro As String = ""
            'Dim entCidade As String = ""
            'Dim entEstado As String = ""


            'If HttpContext.Current.User.Identity.Name <> "" Then
            '    Dim CEPCadastro As String = conn.AbrirExato("SELECT cliCEP FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")

            '    If tbCEP.Text <> "" Then
            '        If tbCEP.Text = CEPCadastro Then
            '            entCEP = ""
            '        Else
            '            entCEP = tbCEP.Text
            '            entEndereco = tbEntEndereco.Text
            '            entNumero = tbEntEndereco.Text
            '            entComp = tbEntComp.Text
            '            entBairro = tbEntBairro.Text
            '            entCidade = tbEntCidade.Text
            '            entEstado = ddEntEstado.SelectedValue
            '        End If
            '    End If
            'End If

            'Dim Cartao As String = "0"
            'Dim DE As String = ""
            'Dim PARA As String = ""
            'Dim Mensagem As String = ""

            'If cbCartao.Checked Then
            '    Cartao = "1"
            '    DE = tbDE.Text
            '    PARA = tbPARA.Text
            '    Mensagem = tbMensagem.Text
            'End If

            'Dim r As String = conn.ExecutaSQL("UPDATE tabCarrinho SET carFormaPagamento='" + MeioPagamento + "', carCEP='" + entCEP + "', carEndereco='" + entEndereco + "', carEnderecoNume='" + entNumero + "', carEnderecoComp='" + entComp + "', carBairro='" + entBairro + "', carCidade='" + entCidade + "', carEstado='" + entEstado + "', conCartao=" + Cartao + ", conDE='" + DE + "', conPARA='" + PARA + "', conMensagem='" + Mensagem + "' WHERE carCodigo=" + Session("CodCarrinho"))

        End If

        getCarrinho()
        lbTotal.Text = FormatCurrency(Total, 2)
        'lbFrete.Text = "0,00"
        'Total += CInt(lbFrete.Text)

        'If Not Page.IsPostBack Then
        '    If Session("CodCarrinho") <> "" Then
        '        Dim dt As DataTable = conn.getDataTable("SELECT carCEPDestino, carTipoEntrega FROM tabCarrinho WHERE carCodigo=" + Session("CodCarrinho"))
        '        tbCEP.Text = dt.Rows(0).Item("carCEPDestino").ToString


        '        If HttpContext.Current.User.Identity.Name <> "" Then
        '            Dim CEPCadastro As String = conn.AbrirExato("SELECT cliCEP FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")

        '            If tbCEP.Text = "" Then
        '                tbCEP.Text = CEPCadastro
        '            Else
        '                If tbCEP.Text = CEPCadastro Then
        '                    pEnderecoEntrega.Visible = False
        '                Else
        '                    pEnderecoEntrega.Visible = True
        '                    Dim f As New Funcoes
        '                    Dim Endereco As Array = f.getEndereco(tbCEP.Text)
        '                    tbEntEndereco.Text = Endereco(0)
        '                    tbEntBairro.Text = Endereco(1)
        '                    tbEntCidade.Text = Endereco(2)
        '                    ddEntEstado.SelectedValue = Endereco(3)
        '                End If
        '            End If
        '        End If

        '        If dt.Rows(0).Item("carTipoEntrega").ToString = "2" Then
        '            rbMarcado.Checked = True
        '        Else
        '            rbSedex.Checked = True
        '        End If
        '        'MudarFormaEntrega()
        '        FormaPagamento()
        '    End If
        'End If


    End Sub


    Sub getCarrinho()
        With gvCarrinho
            .DataSource = conn.getDataReader("SELECT iteCodigo, proNome, iteQTD, proValor, proPeso FROM tabCarrinhoItens, tabProdutos WHERE iteCodProduto=proCodigo AND iteCodCarrinho=" + Session("CodCarrinho"))
            .DataBind()
        End With
        conn.Fechar()

        If gvCarrinho.Rows.Count > 0 Then
            p2.Visible = True
        Else
            p2.Visible = False
        End If
    End Sub

    Protected Sub gvCarrinho_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvCarrinho.RowDataBound
        If IsNumeric(e.Row.Cells(2).Text) Then
            e.Row.Cells(3).Text = FormatNumber((CDec(CType(e.Row.Cells(1).FindControl("tbQTD"), TextBox).Text) * CDec(e.Row.Cells(2).Text)), 2).ToString
            Total += (CDec(CType(e.Row.Cells(1).FindControl("tbQTD"), TextBox).Text) * CDec(e.Row.Cells(2).Text))
            TotalPeso += CDec(CType(e.Row.Cells(1).FindControl("hfPeso"), HiddenField).Value)
            Session("ValorProdutos") = Total
            Session("TotalPeso") = TotalPeso
        End If


    End Sub

    Protected Sub gvCarrinho_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvCarrinho.RowDeleting
        Dim r As String = ""
        r = conn.ExecutaSQL("DELETE FROM tabCarrinhoItens WHERE iteCodigo=" + CType(gvCarrinho.Rows(e.RowIndex).Cells(0).FindControl("hfCodigo"), HiddenField).Value + " AND iteCodCarrinho=" + Session("CodCarrinho"))

        Session("Finalizar") = "N"

        Response.Redirect("Carrinho.aspx")
    End Sub



    'Sub MudarFormaEntrega()
    '    Dim f As New Funcoes
    '    Dim r As Array = f.getEndereco(tbCEP.Text)
    '    If r(3) = "SP" Then
    '        rbMarcado.Visible = True
    '    Else
    '        rbMarcado.Visible = False
    '        rbSedex.Checked = True
    '    End If

    '    If rbSedex.Checked Then
    '        lbFrete.Text = f.CalculaValorFrete(tbCEP.Text, TotalPeso.ToString.Replace(".", "").Replace(",", "."), Total)
    '    Else
    '        lbFrete.Text = "20,00"
    '    End If

    '    If IsNumeric(lbFrete.Text) Then
    '        Session("ValorFrete") = lbFrete.Text
    '        Total += CDec(lbFrete.Text)
    '    End If



    '    Dim Tipo As String = "2"
    '    If rbSedex.Checked Then
    '        Tipo = "1"
    '    End If
    '    conn.ExecutaSQL("UPDATE tabCarrinho SET carCEPDestino='" + tbCEP.Text + "', carTipoEntrega=" + Tipo + " WHERE carCodigo=" + Session("CodCarrinho"))

    '    Session("Finalizar") = "S"
    'End Sub

    'Protected Sub rbSedex_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbSedex.CheckedChanged
    '    MudarFormaEntrega()
    '    Response.Redirect("Carrinho.aspx")
    'End Sub

    'Protected Sub rbMarcado_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbMarcado.CheckedChanged
    '    MudarFormaEntrega()
    '    Response.Redirect("Carrinho.aspx")
    'End Sub

    'Protected Sub btCalcular_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCalcular.Click
    '    If IsNumeric(tbCEP.Text) Then
    '        MudarFormaEntrega()
    '        Response.Redirect("Carrinho.aspx")
    '    End If
    'End Sub

    'Sub FormaPagamento()
    '    If HttpContext.Current.User.Identity.Name <> "" Then

    '        Dim MeioPagamento As String = ""

    '        Select Case True
    '            Case rbVisa.Checked
    '                MeioPagamento = "1"
    '            Case rbMaster.Checked
    '                MeioPagamento = "2"
    '            Case rbDinners.Checked
    '                MeioPagamento = "55"
    '            Case rbAmericanExpress.Checked
    '                MeioPagamento = "37"
    '            Case rbHipercar.Checked
    '                MeioPagamento = "56"
    '            Case rbAura.Checked
    '                MeioPagamento = "45"
    '            Case rbBoleto.Checked
    '                MeioPagamento = "10"

    '        End Select

    '        Dim Produtos As String = ""

    '        Dim x As Integer
    '        For x = 0 To gvCarrinho.Rows.Count - 1
    '            Dim QTD As String = CType(gvCarrinho.Rows(x).Cells(1).FindControl("tbQTD"), TextBox).Text
    '            Dim CodItem As String = CType(gvCarrinho.Rows(x).Cells(0).FindControl("hfCodigo"), HiddenField).Value
    '            Dim Produto As String = CType(gvCarrinho.Rows(x).Cells(0).FindControl("Label1"), Label).Text
    '            Dim Valor As String = gvCarrinho.Rows(x).Cells(2).Text.Replace(".", "").Replace(",", ".")

    '            Produtos += "<input name=""produto_codigo_" + (x + 1).ToString + """ type=""hidden"" value=""" + CodItem + """> " + _
    '                        "<input name=""produto_descricao_" + (x + 1).ToString + """ type=""hidden"" value=""" + Produto + """>" + _
    '                        "<input name=""produto_qtde_" + (x + 1).ToString + """ type=""hidden"" value=""" + QTD + """> " + _
    '                        "<input name=""produto_valor_" + (x + 1).ToString + """ type=""hidden"" value=""" + Valor + """ > "
    '            '"<input name=""produto_extra_" + (x + 1).ToString + """ type=""hidden"" value=""Camiseta Dry Fit"" > "
    '        Next

    '        'DADOS DA LOJA
    '        Dim dt As DataTable = conn.getDataTable("SELECT cadRazao, cadCNPJ, cadEmail FROM tabCadLoja")
    '        Dim LojaNome As String = dt.Rows(0).Item("cadRazao").ToString
    '        Dim LojaCNPJ As String = dt.Rows(0).Item("cadCNPJ").ToString
    '        Dim LojaEmail As String = dt.Rows(0).Item("cadEmail").ToString

    '        'DADOS DO CLIENTE
    '        dt = conn.getDataTable("SELECT * FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
    '        Dim Sexo As String = "masculino"
    '        If dt.Rows(0).Item("cliSexo").ToString = "F" Then
    '            Sexo = "feminino"
    '        End If
    '        With dt.Rows(0)
    '            ltFinalizar.Text = "<form name=""pagamentodigital"" action=""https://www.pagamentodigital.com.br/checkout/pay/"" method=""post"">" + _
    '                                       "<input name=""email_loja"" type=""hidden"" value=""" + LojaEmail + """> " + _
    '                                       Produtos + _
    '                                       "<input name=""tipo_integracao"" type=""hidden"" value=""PAD"">" + _
    '                                       "<input name=""id_pedido"" type=""hidden"" value=""" + Session("CodCarrinho") + """> " + _
    '                                       "<input name=""email"" type=""hidden"" value=""" + .Item("cliEmail").ToString + """ > " + _
    '                                       "<input name=""nome"" type=""hidden"" value=""" + .Item("cliNome").ToString + """>" + _
    '                                       "<input name=""rg"" type=""hidden"" value=""" + .Item("cliRG").ToString + """>" + _
    '                                       "<input name=""cpf"" type=""hidden"" value=""" + .Item("cliCPF").ToString + """>" + _
    '                                       "<input name=""sexo"" type=""hidden"" value=""" + Sexo + """>" + _
    '                                       "<input name=""data_nascimento"" type=""hidden"" value=""" + .Item("cliNasc").ToString + """>" + _
    '                                       "<input name=""telefone"" type=""hidden"" value=""" + .Item("cliTelefoneResDDD").ToString + .Item("cliTelefoneRes").ToString + """> " + _
    '                                       "<input name=""celular"" type=""hidden"" value=""" + .Item("cliTelefoneMovDDD").ToString + .Item("cliTelefoneMov").ToString + """> " + _
    '                                       "<input name=""endereco"" type=""hidden"" value=""" + .Item("cliEndereco").ToString + ", " + .Item("cliEnderecoNume").ToString + """>" + _
    '                                       "<input name=""complemento"" type=""hidden"" value=""" + .Item("cliEnderecoComp").ToString + """>" + _
    '                                       "<input name=""bairro"" type=""hidden"" value=""" + .Item("cliBairro").ToString + """>" + _
    '                                       "<input name=""cidade"" type=""hidden"" value=""" + .Item("cliCidade").ToString + """>" + _
    '                                       "<input name=""estado"" type=""hidden"" value=""" + .Item("cliEstado").ToString + """>" + _
    '                                       "<input name=""cep"" type=""hidden"" value=""" + .Item("cliCEP").ToString + """>" + _
    '                                       "<input name=""url_retorno"" type=""hidden"" value=""http://cestasdelicias.zoudesign.com.br/CompraFinalizada.aspx"">" + _
    '                                       "<input name=""cliente_razao_social"" type=""hidden"" value=""" + LojaNome + """>" + _
    '                                       "<input name=""cliente_cnpj"" type=""hidden"" value=""" + LojaCNPJ + """>" + _
    '                                       "<input name=""parcela_maxima"" type=""hidden"" value=""10"">" + _
    '                                       "<input name=""meio_pagamento"" type=""hidden"" value=""" + MeioPagamento + """>" + _
    '                                       "<input name=""redirect"" type=""hidden"" value=""true"">" + _
    '                                       "<input type=""image"" src=""https://www.pagamentodigital.com.br/webroot/img/bt_comprar.gif"" value=""Comprar"" alt=""Comprar"" border=""0"" align=""absbottom"" >" + _
    '                                       "</form> "
    '        End With
    '        '"<input name=""data_emissao_rg"" type=""hidden"" value=""1987-02-24"">" + _
    '        '"<input name=""frete"" type=""hidden"" value=""10"">" + _
    '        '"<input name=""orgao_emissor_rg"" type=""hidden"" value=""SSP"">" + _
    '        '"<input name=""estado_emissor_rg"" type=""hidden"" value=""SP"">" + _
    '        '"<input name=""free"" type=""hidden"" value="""">" + _
    '        '"<input name=""tipo_frete"" type=""hidden"" value=""sedex"">" + _
    '        '"<input name=""desconto"" type=""hidden"" value=""50.00"">" + _
    '        '"<input name=""acrescimo"" type=""hidden"" value=""12.00"">" + _
    '    Else
    '        ltFinalizar.Text = "Para fechar o pedido é necessário se logar."
    '    End If
    'End Sub

    'Protected Sub rbVisa_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbVisa.CheckedChanged
    '    FormaPagamento()
    'End Sub

    'Protected Sub cbCartao_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbCartao.CheckedChanged
    '    If cbCartao.Checked Then
    '        pMensagem.Visible = True
    '    Else
    '        pMensagem.Visible = False
    '    End If
    'End Sub

    Protected Sub btContinuar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btContinuar.Click
        Response.Redirect("/Cliente/Carrinho2.aspx")
    End Sub
End Class
