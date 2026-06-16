using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void btEnviar_Click(object sender, EventArgs e)
    {
        Mail mail = new Mail();
        String r = mail.Enviar("contato@biocencursos.com.br", "", "contato@biocencursos.com.br", "Dúvidas via site", "Nome: " + tbNome.Text + "<br />Email: " + tbEmail.Text + "<br />Telefone: " + tbTelefone.Text + "<br />E-mail: " + tbEmail.Text + "<br />Dúvida:" + tbDuvida.Text + "<br />", "", false);
        if (String.IsNullOrEmpty(r))
            ltMSG.Text = "Enviado com sucesso!";
        else
            ltMSG.Text = r;
    }
}
