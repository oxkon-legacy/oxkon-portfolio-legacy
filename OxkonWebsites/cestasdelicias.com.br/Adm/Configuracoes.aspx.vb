Imports System.Data
Imports System.IO

Partial Class Adm_Configuracoes
    Inherits System.Web.UI.Page
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim x As Integer
        For x = 0 To ddCores3.Items.Count - 1
            ddCoresPP.Items(x).Attributes.Add("style", "background-color:" + ddCores3.Items(x).Value)
            ddCores1.Items(x).Attributes.Add("style", "background-color:" + ddCores3.Items(x).Value)
            ddCores2.Items(x).Attributes.Add("style", "background-color:" + ddCores3.Items(x).Value)
            ddCores3.Items(x).Attributes.Add("style", "background-color:" + ddCores3.Items(x).Value)
        Next


        If Not Page.IsPostBack Then
            ViewState("ppT") = ""
            ViewState("altPP") = "N"

            CarregarBanco()

            AlterarCSS()
        End If


    End Sub

    Sub CarregarBanco()

        Dim dt As DataTable = conn.getDataTable("SELECT * FROM tabEstiloADM WHERE estUsuario='" + Session("AdmUsuario") + "'")
        With dt.Rows(0)

            tbLargura.Text = .Item("estLargura").ToString
            If .Item("estPPTipo").ToString = "I" Then
                rbImagem.Checked = True
                rbSolido.Checked = False
                ddCoresPP.Visible = False
                btEnviar.Visible = True
                FileUpload1.Visible = True
                ViewState("ppT") = .Item("estPP").ToString

                'Response.Write(ViewState("ppT"))
            Else
                rbImagem.Checked = False
                rbSolido.Checked = True
                ddCoresPP.Visible = True
                btEnviar.Visible = False
                FileUpload1.Visible = False
                ddCoresPP.SelectedValue = .Item("estPP").ToString
            End If

            ddCores1.SelectedValue = .Item("estCorT1").ToString
            ddCores2.SelectedValue = .Item("estCorT2").ToString
            ddCores3.SelectedValue = .Item("estCorM").ToString
        End With
    End Sub

    Protected Sub tbLargura_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbLargura.TextChanged
        AlterarCSS()
    End Sub

    Sub AlterarCSS()
        'If ViewState("ppT") = "" Then
        '    ViewState("ppT") = conn.AbrirExato("SELECT estPP FROM tabEstiloADM WHERE estUsuario='" + Session("AdmUsuario") + "'")
        'End If
        'Dim ppP As String = "pp.jpg"
        Dim pp As String = ""
        If rbImagem.Checked Then
            Dim arq As New FileInfo(Server.MapPath("Imanges/" + ViewState("ppT")))
            pp = ".BG{background-attachment:fixed; background-image:url(Imagens/" + ViewState("ppT") + ")}"
        Else
            pp = ".BG{background-color:" + ddCoresPP.SelectedValue + ";}"
        End If
        ltCSS.Text = "<style type=""text/css""><!--" + vbCrLf + " " + pp + _
            ".TarjaGrande{background-color: " + ddCores1.SelectedValue + ";}" + _
            ".TarjaPequena{background-color: " + ddCores2.SelectedValue + ";}" + _
            ".TarjaMenu{background-color: " + ddCores3.SelectedValue + ";}" + _
            ".Lagura{width:" + tbLargura.Text + ";}" + vbCrLf + " --></style>"


    End Sub

    Protected Sub ddCores1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddCores1.SelectedIndexChanged
        AlterarCSS()
    End Sub

    Protected Sub ddCores2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddCores2.SelectedIndexChanged
        AlterarCSS()
    End Sub

    Protected Sub ddCores3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddCores3.SelectedIndexChanged
        AlterarCSS()
    End Sub

    Protected Sub rbImagem_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbImagem.CheckedChanged
        'AlterarCSS()
        ddCoresPP.Visible = False
        btEnviar.Visible = True
        FileUpload1.Visible = True
    End Sub

    Protected Sub rbSolido_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbSolido.CheckedChanged
        'AlterarCSS()
        ddCoresPP.Visible = True
        btEnviar.Visible = False
        FileUpload1.Visible = False
    End Sub

    Protected Sub ddCoresPP_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddCoresPP.SelectedIndexChanged
        AlterarCSS()
    End Sub

    Protected Sub btEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btEnviar.Click
        Dim Arq As New FileInfo(Server.MapPath("Imagens/" + ViewState("ppT")))
        If Arq.Exists Then
            Arq.Delete()
        End If
        FileUpload1.SaveAs(Server.MapPath("Imagens/" + FileUpload1.FileName))
        ViewState("altPP") = "S"
        ViewState("ppT") = FileUpload1.FileName
        AlterarCSS()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim SQLAdd As String = ""

        'Dim ppTipo As String = "I"
        'Dim ppP As String = ""

        '

        If rbSolido.Checked Then
            'ppTipo = "S"
            'ppP = ddCoresPP.SelectedValue
            'If arq.Exists And ViewState("ppT") <> "ppDefault.jpg" Then
            '    arq.Delete()
            'End If
            Dim dir As New DirectoryInfo(Server.MapPath("Imagens/" + Session("AdmUsuario")))
            If dir.Exists Then
                dir.Delete(True)
            End If
            SQLAdd = ", estPPTipo='S', estPP='" + ddCoresPP.SelectedValue + "'"
        Else
            If ViewState("altPP") = "S" Then
                Dim arq As New System.IO.FileInfo(Server.MapPath("Imagens/" + ViewState("ppT")))

                Directory.CreateDirectory(Server.MapPath("Imagens/" + Session("AdmUsuario")))

                Dim ppAntigo As String = conn.AbrirExato("SELECT estPP FROM tabEstiloADM WHERE estUsuario='" + Session("AdmUsuario") + "'")
                Dim arq2 As New FileInfo(Server.MapPath("Imagens/" + ppAntigo))
                If arq2.Exists Then
                    arq2.Delete()
                End If
                arq.MoveTo(Server.MapPath("Imagens/" + Session("AdmUsuario") + "/" + ViewState("ppT")))

                SQLAdd = ", estPPTipo='I', estPP='" + Session("AdmUsuario") + "/" + ViewState("ppT") + "'"
            End If
        End If



            Dim r As String = conn.ExecutaSQL("UPDATE tabEstiloADM SET estLargura='" + tbLargura.Text + "'" + SQLAdd + ", estCORT1='" + ddCores1.SelectedValue + "', estCORT2='" + ddCores2.SelectedValue + "',  estCORM='" + ddCores3.SelectedValue + "'  WHERE estUsuario='" + Session("AdmUsuario") + "'")
            If r <> "" Then
                Response.Write(r)
            Else
                'ViewState("ppT") = ""
                'CarregarBanco()
                'AlterarCSS()
                Response.Redirect("Configuracoes.aspx")
            End If
    End Sub
End Class
