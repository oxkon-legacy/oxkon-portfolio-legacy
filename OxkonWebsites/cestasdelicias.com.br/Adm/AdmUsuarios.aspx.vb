Imports System.Data

Partial Class Adm_AdmUsuarios
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            getUsuarios()
        End If
    End Sub

    Sub getUsuarios()
        With gvUsuarios
            .DataSource = conn.getDataReader("SELECT * FROM tabUsuarios")
            .DataBind()

        End With
        conn.Fechar()
    End Sub

    Protected Sub btNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNovo.Click
        gvUsuarios.Visible = False
        pEditar.Visible = True

    End Sub

    Protected Sub btGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGravar.Click
        Dim r As String = ""
        If hfUsuario.Value <> "" Then
            r = conn.ExecutaSQL("UPDATE tabUsuarios SET usuNome='" + tbNome.Text + "' WHERE usuUsuario='" + tbUsuario.Text + "'")
        Else
            r = conn.ExecutaSQL("INSERT INTO tabUsuarios (usuNome, usuUsuario, usuSenha) VALUES ('" + tbNome.Text + "', '" + tbUsuario.Text + "', '" + tbSenha.Text + "')")
        End If

        If r = "" Then
            gvUsuarios.Visible = True
            pEditar.Visible = False
            getUsuarios()
            tbNome.Text = ""
            tbConfirmacao.Text = ""
            tbSenha.Text = ""
            tbUsuario.Text = ""
            hfUsuario.Value = ""
            tbUsuario.Enabled = True
            tbSenha.Enabled = True
            tbConfirmacao.Enabled = True
        Else
            lbMSG.Text = r
        End If
    End Sub

    Protected Sub gvUsuarios_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvUsuarios.SelectedIndexChanged
        hfUsuario.Value = gvUsuarios.SelectedRow.Cells(1).Text
        tbNome.Text = gvUsuarios.SelectedRow.Cells(0).Text
        tbUsuario.Text = gvUsuarios.SelectedRow.Cells(1).Text
        gvUsuarios.Visible = False
        pEditar.Visible = True
        tbUsuario.Enabled = False
        tbSenha.Enabled = False
        tbConfirmacao.Enabled = False
    End Sub
End Class
