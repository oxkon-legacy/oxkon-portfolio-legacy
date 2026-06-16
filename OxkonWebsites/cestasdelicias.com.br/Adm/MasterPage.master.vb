Imports System.Data

Partial Class Adm_MasterPage
    Inherits System.Web.UI.MasterPage
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("AdmUsuario") = "" Then
            Response.Redirect("Default.aspx")
        End If

        'Response.Write(Request.ServerVariables("URL"))
        If Request.ServerVariables("URL") <> "/Adm/Configuracoes.aspx" Then
            Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabEstiloADM WHERE estUsuario='" + Session("AdmUsuario") + "'")
            If dt.Rows.Count > 0 Then
                With dt.Rows(0)
                    Dim pp As String = ""
                    If .Item("estPPTipo").ToString = "I" Then
                        pp = ".BG{background-attachment:fixed; background-image:url(Imagens/" + .Item("estPP") + ")}"
                    Else
                        pp = ".BG{background-color:" + .Item("estPP") + ";}"
                    End If

                    ltCSS.Text = "<style type=""text/css""><!--" + vbCrLf + pp + _
                    ".TarjaGrande{background-color: " + .Item("estCorT1") + ";}" + _
                    ".TarjaPequena{background-color: " + .Item("estCorT2") + ";}" + _
                    ".TarjaMenu{background-color: " + .Item("estCorM") + ";}" + _
                    ".Lagura{width:" + .Item("estLargura") + ";}" + vbCrLf + "--></style>"
                End With
            Else
                System.IO.Directory.CreateDirectory(Server.MapPath("Imagens/" + Session("AdmUsuario")))
                Dim arq As New System.IO.FileInfo(Server.MapPath("Imagens/ppDefault.jpg"))
                arq.CopyTo(Server.MapPath("Imagens/" + Session("AdmUsuario") + "/ppDefault.jpg"), True)
                conn.ExecutaSQL("INSERT INTO tabEstiloADM (estUsuario, estPPTipo,estPP, estLargura) VALUES ('" + Session("AdmUsuario") + "','I','" + Session("AdmUsuario") + "/ppDefault.jpg', '750px')")
                Response.Redirect("Administracao.aspx")
            End If
        End If


        lbRazao.Text = conn.AbrirExato("SELECT cadRazao FROM tabCadLoja")
        lbTitulo.Text = "Administração"
        lbNome.Text = "Olá " + conn.AbrirExato("SELECT usuNome FROM tabUsuarios WHERE usuUsuario='" + Session("AdmUsuario") + "'") + "!"
    End Sub

    Protected Sub lbSair_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbSair.Click
        Session("AdmUsuario") = ""
        Response.Redirect("/Adm")
    End Sub
End Class

