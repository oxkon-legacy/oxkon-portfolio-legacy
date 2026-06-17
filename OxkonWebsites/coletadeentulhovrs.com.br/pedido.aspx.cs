using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pedido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btEnviar_Click(object sender, EventArgs e)
    {
        Mail mail = new Mail();
        String r = mail.Enviar("leandro@oxkon.com.br", "", "contato@coletadeentulhovrs.com.br", "Contato via site", "Nome: " + tbNome.Text + "<br />Email: " + tbEmail.Text + "<br />Telefone: " + tbTelefone.Text + "<br />Mensagem:" + tbMSG.Text + "<br />", "", false);
        if (String.IsNullOrEmpty(r))
            ltMSG.Text = "Mensagem enviada com sucesso!";
        else
            ltMSG.Text = r;
    }
}