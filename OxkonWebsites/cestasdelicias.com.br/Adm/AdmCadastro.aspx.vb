Imports System.Data

Partial Class Adm_AdmCadastro
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim r As String = ""
        r = conn.ExecutaSQL("UPDATE tabCadLoja SET cadRazao='" + tbRazao.Text + "', cadCNPJ='" + tbCNPJ.Text + "', cadEmail='" + tbEmail.Text + "', cadCEP='" + tbCEP.Text + "'")
        If r = "" Then
            lbMSG.Text = "Cadastro atualizado com sucesso!"
        Else
            lbMSG.Text = r
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then


            Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabCadLoja")
            With dt.Rows(0)
                tbRazao.Text = .Item("cadRazao").ToString
                tbCNPJ.Text = .Item("cadCNPJ").ToString
                tbEmail.Text = .Item("cadEmail").ToString
                tbCEP.Text = .Item("cadCEP").ToString
            End With
        End If
    End Sub
End Class
