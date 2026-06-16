Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.Net
Imports System.Net.Mime


Public Class Mail

    Function Enviar(ByVal para As String, ByVal cc As String, ByVal de As String, ByVal assunto As String, ByVal msg As String) As String



        Dim objMailMessage As New MailMessage()


        With objMailMessage
            If Not para Is Nothing And para <> String.Empty Then

                ' Define o endereço cc 
                Dim arrayPara As Array = Split(para, ";")
                Dim x As Integer
                For x = 0 To arrayPara.Length - 1
                    .To.Add(New MailAddress(arrayPara(x)))
                Next


            End If

            '.To.Add(New MailAddress(para))
            .From = New MailAddress(de)
            'Define o assunto 

            .Subject = assunto

            ' Define o corpo da mensagem
            Dim body As String = "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""><html xmlns=""http://www.w3.org/1999/xhtml""><head><meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"" /><title>Plumas</title></head><body><table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"">  <tr>    <td width=""424""  bgcolor=""#043367""><img src=""cid:Top1"" /></td>      <td bgcolor=""#043367"">&nbsp;</td>    <td width=""15""><img src=""cid:Top2"" /></td></tr>  <tr>    <td height=""154"" colspan=""3"" bgcolor=""#F7F7F7""><blockquote>" + msg + "</blockquote></td>  </tr>  <tr>    <td  bgcolor=""#043367""></p><img src=""cid:Bot1"" /></td>    <td bgcolor=""#043367"">&nbsp;</td>  <td><img src=""cid:Bot2"" /></td></tr></table></body></html>"
            Dim view As AlternateView = AlternateView.CreateAlternateViewFromString(body, System.Text.Encoding.UTF8, MediaTypeNames.Text.Html)

            Dim Top1 As New LinkedResource("E:\Departamentos\Informatica\Sites\Intranet\imgs\TarjaEmaillTop1.jpg")
            Dim Top2 As New LinkedResource("E:\Departamentos\Informatica\Sites\Intranet\imgs\TarjaEmaillTop2.jpg")
            Dim Top3 As New LinkedResource("E:\Departamentos\Informatica\Sites\Intranet\imgs\TarjaEmaillTop2.jpg")
            Dim Bot1 As New LinkedResource("E:\Departamentos\Informatica\Sites\Intranet\imgs\TarjaEmaillBot1.jpg")
            Dim Bot2 As New LinkedResource("E:\Departamentos\Informatica\Sites\Intranet\imgs\TarjaEmaillBot2.jpg")
            Dim Bot3 As New LinkedResource("E:\Departamentos\Informatica\Sites\Intranet\imgs\TarjaEmaillBot2.jpg")

            Top1.ContentId = "Top1"
            Top2.ContentId = "Top2"
            Bot1.ContentId = "Bot1"
            Bot2.ContentId = "Bot2"
            view.LinkedResources.Add(Top1)
            view.LinkedResources.Add(Top2)
            view.LinkedResources.Add(Bot1)
            view.LinkedResources.Add(Bot2)
            .AlternateViews.Add(view)


            '.Body = body
            ' Define o formato do email como HTML

            .IsBodyHtml = True

            ' Define a prioridade da mensagem como normal

            .Priority = MailPriority.Normal

            If Not cc Is Nothing And cc <> String.Empty Then

                ' Define o endereço cc 
                Dim arrayCC As Array = Split(cc, ";")
                Dim x As Integer
                For x = 0 To arrayCC.Length - 1
                    .CC.Add(New MailAddress(arrayCC(x)))
                Next


            End If




        End With

        Try
            Dim mSmtpClient As New SmtpClient("srv1")
            mSmtpClient.UseDefaultCredentials = True
            mSmtpClient.Credentials = New NetworkCredential("site", "1234", "plumas")
            mSmtpClient.Send(objMailMessage)
            Return ""
        Catch ex As Exception

            Return (ex.Message)
        End Try



    End Function


End Class
