
Partial Class Cliente_Carrinho3
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub cbCartao_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbCartao.CheckedChanged
        If cbCartao.Checked Then
            pMensagem.Visible = True
        Else
            pMensagem.Visible = False
        End If
    End Sub

    Protected Sub btContinuar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btContinuar.Click

        If cbCartao.Checked Then
            Dim r As String = conn.ExecutaSQL("UPDATE tabCarrinho SET carCartao=1, carNomeDE=" + conn.formatBD(tbDE.Text, "S") + ", carNomePARA=" + conn.formatBD(tbPARA.Text, "S") + ", carMensagem=" + conn.formatBD(tbMensagem.Text, "S") + " WHERE carCodigo=" + Session("CodCarrinho"))
            If r = "" Then
                Response.Redirect("Carrinho4.aspx")
            Else
                Response.Write(r)
            End If
        Else
            Response.Redirect("Carrinho4.aspx")
        End If

    End Sub
End Class
