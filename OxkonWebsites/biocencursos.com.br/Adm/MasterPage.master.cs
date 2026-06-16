using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adm_MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        ltSript.Text = "<img src=\"/Adm/Imagens/back_green_vinhas.jpg\" alt=\"\" class=\"bgmaximage\" />";
        if (string.IsNullOrEmpty(Session["AdmCodUsuario"].ToString()))
            Response.Redirect("/Adm/?pagina=" + Request.ServerVariables["URL"]);

        AdmMenu men = new AdmMenu();
        ltMenu.Text = men.ObterMenu("", 1);

        AdmUsuario usu = new AdmUsuario();
        ltNome.Text = usu.ObterNome;

        AdmCadastro cad = new AdmCadastro();
        ltTitulo.Text = "Administração<br />" + cad.RazaoSocial;

        string logotipo = cad.Logotipo;
        if (!string.IsNullOrEmpty(logotipo))
            ltLogo.Text = "<a href=\"/Adm/Administracao.aspx\"><img width=\"200\" border=\"0\" src=\"/Adm/Imagens/" + logotipo + "\" /></a>";
    }
    protected void btEmail_Click(object sender, ImageClickEventArgs e)
    {
        lbScript.Text += "<script>document.getElementById('ctl00_hfMSG').value = document.getElementById('divPrint').innerHTML;</script>";
        pEmail.Visible = true;
        Email.Show();
    }
    protected void btEnviar_Click(object sender, EventArgs e)
    {
        Mail mail = new Mail();
        if (string.IsNullOrEmpty(mail.Enviar(tbEmail.Text, "", "Oxkon<leandro@oxkon.com.br>", tbAssunto.Text, hfMSG.Value, "", false)))
        {
            tbEmail.Text = "";
            tbAssunto.Text = "";
            pEmail.Visible = false;
        }
    }
}
