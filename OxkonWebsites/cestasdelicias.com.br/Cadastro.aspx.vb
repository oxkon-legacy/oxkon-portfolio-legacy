
Partial Class Cadastro
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCadastrar.Click

        Dim r As String = ""
        r = conn.AbrirExato("SELECT cliUsuario FROM tabClientes WHERE cliUsuario='" + tbUsuario.Text + "'")
        If Left(r, 4) <> "Erro" Then
            lbMSGUsu.Text = "Usuário " + tbUsuario.Text + " já existe! Por favor, escolha outro."
            Exit Sub
        End If

        Dim Sexo As String = "M"
        If rbSexoF.Checked Then
            Sexo = "F"
        End If
        r = conn.ExecutaSQL("INSERT INTO tabClientes (cliNome, cliSobreNome, cliCPF, cliRG, cliNasc, cliSexo, cliCEP, cliEndereco, cliEnderecoNume, cliEnderecoComp, cliBairro, cliCidade, cliEstado, cliPais, cliTelefoneResDDD, cliTelefoneRes, cliTelefoneComDDD, cliTelefoneCom, cliTelefoneMovDDD, cliTelefoneMov, cliUsuario, cliSenha, cliEmail, cliCriacao) VALUES " + _
                            "('" + tbNome.Text + "', '" + tbSobreNome.Text + "', '" + tbCPF.Text + "', '" + tbRG.Text + "', '" + tbNasc.Text + "', '" + Sexo + "', '" + tbCEP.Text + "', '" + tbEndereco.Text + "', '" + tbNumero.Text + "', '" + tbComplemento.Text + "', '" + tbBairro.Text + "', '" + tbCidade.Text + "', '" + ddEstado.SelectedValue + "', 'BR', '" + tbTelResDDD.Text + "', '" + tbTelRes.Text + "', '" + tbTelComDDD.Text + "', '" + tbTelCom.Text + "', '" + tbTelCelDDD.Text + "', '" + tbTelCel.Text + "', '" + tbUsuario.Text + "', '" + tbSenha.Text + "', '" + tbEmail.Text + "', " + conn.formatBD(Date.Now, "D") + ")")

        If r = "" Then
            Dim mail As New Mail
            Dim EmailLoja As String = conn.AbrirExato("SELECT cadEmail FROM tabCadLoja")
            mail.Enviar(EmailLoja, "", EmailLoja, "Novo cliente cadastrado no site", "Olá<br><br> O cliente " + tbNome.Text + " acabou de se cadastrar no site Cestas Delícias.<br><br>Atenciosamente,<br>Equipe Cestas Delícias")
            pCad.Visible = False
            pOK.Visible = True
            If Session("CodCarrinho") <> "" Then
                Dim TotalItens As Integer = conn.AbrirExato("SELECT COUNT(iteCodigo) FROM tabCarrinhoItens WHERE iteCodCarrinho=" + Session("CodCarrinho"))
                If CInt(TotalItens) > 0 Then
                    lbMSGContinua.Text = "<a href=""/Carrinho.aspx"" alt=""Finalizar Compras"">Clique aqui</a> para finalizar suas compras ou clique nos departamentos ao lado para adicionar mais itens ao carrinho!"
                Else
                    lbMSGContinua.Text = "Clique nos departamentos ao lado para adicionar itens ao carrinho e boas compras!"
                End If
            End If
        Else
            Response.Write(r)
        End If
    End Sub


    Protected Sub tbCEP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbCEP.TextChanged
        Dim f As New Funcoes
        Dim Endereco As Array = f.getEndereco(tbCEP.Text)
        If Endereco(0).ToString = "-1" Then
            lbMSGCEP.Text = "CEP Inválido"
            tbCEP.Text = ""
            tbCEP.Focus()
        Else
            lbMSGCEP.Text = ""
            tbEndereco.Text = Endereco(0)
            tbBairro.Text = Endereco(1)
            tbCidade.Text = Endereco(2)
            ddEstado.SelectedValue = Endereco(3)
        End If
    End Sub

End Class
