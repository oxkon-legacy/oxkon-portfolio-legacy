Imports System.Data

Partial Class Cliente_Cadastro
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Editar()
    End Sub
    Sub Editar()
        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabClientes WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
        With dt.Rows(0)
            tbNome.Text = .Item("cliNome").ToString
            tbSobreNome.Text = .Item("cliSobreNome").ToString
            tbNasc.Text = .Item("cliNasc").ToString
            tbRG.Text = .Item("cliRG").ToString()
            tbCPF.Text = .Item("cliCPF").ToString
            If .Item("cliSexo").ToString = "True" Then
                rbSexoH.Checked = True
                rbSexoF.Checked = False
            Else
                rbSexoH.Checked = False
                rbSexoF.Checked = True
            End If
            tbCEP.Text = .Item("cliCEP").ToString
            tbEndereco.Text = .Item("cliEndereco").ToString
            tbNumero.Text = .Item("cliEnderecoNume").ToString()
            tbComplemento.Text = .Item("cliEnderecoComp").ToString
            tbBairro.Text = .Item("cliBairro").ToString
            tbCidade.Text = .Item("cliCidade").ToString
            ddEstado.SelectedValue = .Item("cliEstado").ToString
            tbTelResDDD.Text = .Item("cliTelefoneResDDD").ToString
            tbTelRes.Text = .Item("cliTelefoneRes").ToString
            tbTelComDDD.Text = .Item("cliTelefoneComDDD").ToString
            tbTelCom.Text = .Item("cliTelefoneCom").ToString
            tbTelCelDDD.Text = .Item("cliTelefoneMovDDD").ToString
            tbTelCel.Text = .Item("cliTelefoneMov").ToString

            tbEmail.Text = .Item("cliEmail").ToString
            tbUsuario.Text = .Item("cliUsuario").ToString

        End With
    End Sub

    Protected Sub btCadastrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCadastrar.Click
        Dim r As String = ""
        Dim Sexo As String = "M"
        If rbSexoF.Checked Then
            Sexo = "F"
        End If
        r = conn.ExecutaSQL("UPDATE tabClientes SET cliNome='" + tbNome.Text + "', cliSobreNome='" + tbSobreNome.Text + "', cliCPF='" + tbCPF.Text + "', cliRG='" + tbRG.Text + "', cliNasc='" + tbNasc.Text + "', cliSexo='" + Sexo + "', cliCEP='" + tbCEP.Text + "', cliEndereco='" + tbEndereco.Text + "', cliEnderecoNume='" + tbNumero.Text + "', cliEnderecoComp='" + tbComplemento.Text + "', cliBairro='" + tbBairro.Text + "', cliCidade='" + tbCidade.Text + "', cliEstado='" + ddEstado.SelectedValue + "', cliTelefoneResDDD='" + tbTelResDDD.Text + "', cliTelefoneRes='" + tbTelRes.Text + "', cliTelefoneComDDD='" + tbTelComDDD.Text + "', cliTelefoneCom='" + tbTelComDDD.Text + "', cliTelefoneMovDDD='" + tbTelCelDDD.Text + "', cliTelefoneMov='" + tbTelCel.Text + "', cliEmail='" + tbEmail.Text + "', cliAtualizacao=" + conn.formatBD(Date.Now, "D") + " WHERE cliUsuario='" + HttpContext.Current.User.Identity.Name + "'")
        If r = "" Then
            lbMSG.Text = "Gravado com sucesso!"
        Else
            lbMSG.Text = r
        End If
    End Sub
End Class
