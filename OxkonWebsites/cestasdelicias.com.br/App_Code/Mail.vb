Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.Net
Imports System.Net.Mime


Public Class Mail

    Function Enviar(ByVal para As String, ByVal cc As String, ByVal de As String, ByVal assunto As String, ByVal msg As String) As String



        Dim objMailMessage As New MailMessage()


        With objMailMessage
            .To.Add(New MailAddress(para))
            .From = New MailAddress(de)
            'Define o assunto 

            .Subject = assunto

            ' Define o corpo da mensagem
            Dim body As String = "<html><head><title>Email</title></head><body><table style=""font-family: Arial, Verdana; font-size: 11px;"" width=""700"" border=""0"" cellpadding=""0"" cellspacing=""0"">  <tr>    <td><img src=""cid:ImagemTop"" /></td>  </tr>  <tr>    <td height=""154"" bgcolor=""#E8E8E8""><blockquote>" + msg + "</blockquote></td>  </tr>  <tr>    <td></p><img src=""cid:ImagemBotton"" /></td>  </tr></table></body></html>"
            Dim view As AlternateView = AlternateView.CreateAlternateViewFromString(body, System.Text.Encoding.UTF8, MediaTypeNames.Text.Html)
            Dim resource As New LinkedResource(System.Configuration.ConfigurationManager.AppSettings("Imagens") + "mailTop.jpg")
            Dim resource2 As New LinkedResource(System.Configuration.ConfigurationManager.AppSettings("Imagens") + "mailBot.jpg")

            resource.ContentId = "ImagemTop"
            resource2.ContentId = "ImagemBotton"
            view.LinkedResources.Add(resource)
            view.LinkedResources.Add(resource2)
            .AlternateViews.Add(view)


            '.Body = body
            ' Define o formato do email como HTML

            .IsBodyHtml = True

            ' Define a prioridade da mensagem como normal

            .Priority = MailPriority.Normal

            If Not cc Is Nothing And cc <> String.Empty Then

                ' Define o endereço cc 

                .CC.Add(New MailAddress(cc))

            End If




        End With

        Try
            Dim mSmtpClient As New SmtpClient("localhost")
            mSmtpClient.UseDefaultCredentials = True
            mSmtpClient.Credentials = New NetworkCredential("zou@zoudesign.com.br", "z1o2u3")
            mSmtpClient.Send(objMailMessage)
            Return ""
        Catch ex As Exception

            Return (ex.Message)
        End Try



    End Function


End Class

