Imports System.Data

Partial Class Adm_Default
    Inherits System.Web.UI.Page

    Protected Sub btLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btLogin.Click
        Dim conn As New Conexao
        Dim r As String = conn.AbrirExato("SELECT usuUsuario FROM tabUsuarios WHERE usuUsuario='" + tbUsuario.Text + "' AND usuSenha='" + tbSenha.Text + "'")
        If Left(r, 4) = "Erro" Then
            lbMSG.Text = "Usuário e/ou senha incorreto!"
        Else
            Session("AdmUsuario") = tbUsuario.Text

            Dim dt As DataTable = conn.getDataTable("SELECT usuQTDAcessos, usuAcessoAgora FROM tabUsuarios WHERE usuUsuario='" + tbUsuario.Text + "'")
            Dim QTD As String = dt.Rows(0).Item("usuQTDAcessos").ToString
            If IsNumeric(QTD) Then
                QTD = (CInt(QTD) + 1).ToString
            Else
                QTD = "1"

            End If
            Dim UltimoAcesso As String = dt.Rows(0).Item("usuAcessoAgora").ToString

            Response.Write(conn.ExecutaSQL("UPDATE tabUsuarios SET usuQTDAcessos=" + QTD + ", usuAcessoUltimo=" + conn.formatBD(UltimoAcesso, "D") + ", usuAcessoAgora=" + conn.formatBD(Date.Now, "D") + " WHERE usuUsuario='" + tbUsuario.Text + "'"))
            Response.Redirect("Administracao.aspx")
        End If
    End Sub
End Class
