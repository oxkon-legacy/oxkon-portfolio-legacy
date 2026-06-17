using System;
using System.Collections.Generic;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Classe para envio de e-mail via SMTP local
/// Deve configurar o Dominio no proprio arquivo Mail.cs
/// Caso o e-mail seja enviado retorna um string vazio
/// </summary>
public class Mail
{
    String Dominio = "@coletadeentulhovrs.com.br";
    public string Enviar(string para, string cc, string de, string assunto, string msg, string Anexo, Boolean UsaLayout)
    {
        MailMessage objMailMessage = new MailMessage();


        //With objMailMessage
        objMailMessage.To.Add(new MailAddress(para));
        objMailMessage.From = new MailAddress(de);

        objMailMessage.Subject = assunto;


        string body = "";
        if (UsaLayout)
        {
            body = "<table width=\"700\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">  <tr>    <td><img src=\"cid:ImagemTop\" /></td>  </tr>  <tr>    <td height=\"154\" bgcolor=\"#FFFFFF\"><blockquote>" + msg + "</blockquote></td>  </tr>  <tr>    <td></p><img src=\"cid:ImagemBotton\" /></td>  </tr></table>";
            AlternateView view = AlternateView.CreateAlternateViewFromString(body, System.Text.Encoding.UTF8, System.Net.Mime.MediaTypeNames.Text.Html);
            LinkedResource resource = new LinkedResource(System.Configuration.ConfigurationManager.AppSettings["Imagens"] + @"\mail.jpg");
            LinkedResource resource2 = new LinkedResource(System.Configuration.ConfigurationManager.AppSettings["Imagens"] + @"\mailrodape.jpg");
            resource.ContentId = "ImagemTop";
            resource2.ContentId = "ImagemBotton";
            view.LinkedResources.Add(resource);
            view.LinkedResources.Add(resource2);
            objMailMessage.AlternateViews.Add(view);
        }
        else
        {
            objMailMessage.Body = msg;
        }

        objMailMessage.SubjectEncoding = System.Text.Encoding.GetEncoding("utf-8");
        objMailMessage.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
        objMailMessage.Headers.Add("Message-ID", "<" + System.Guid.NewGuid().ToString().Replace("-", "") + Dominio + ">");
        objMailMessage.IsBodyHtml = true;

        if (Anexo != "")
            objMailMessage.Attachments.Add(new Attachment(Anexo));

        objMailMessage.Priority = MailPriority.Normal;

        if (!string.IsNullOrEmpty(cc))
        {
            String[] arrayCC = cc.Split(";".ToCharArray());
            foreach (string s in arrayCC)
                objMailMessage.CC.Add(new MailAddress(s));
        }


        try
        {
            SmtpClient mSmtpClient = new SmtpClient("localhost");
            mSmtpClient.Send(objMailMessage);
            return "";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }
}