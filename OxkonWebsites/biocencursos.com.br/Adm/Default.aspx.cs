using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adm_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            HttpCookie cookiePU = Request.Cookies["permaneceUsuario"];


            if (cookiePU != null)
            {


                if (!string.IsNullOrEmpty(cookiePU.Value))
                {
                    
                    AdmUsuario usu = new AdmUsuario();
                    
                    if (string.IsNullOrEmpty(usu.Logar(cookiePU.Value, "", true)))
                    {

                        if (string.IsNullOrEmpty(Request.QueryString["pagina"]))
                            Response.Redirect("Administracao.aspx");
                        else
                            Response.Redirect(Request.QueryString["pagina"]);
                    }
                }
            }


            HttpCookie cookieP = Request.Cookies["Usuario"];
            //Response.Write(":" + cookieP.Value);
            if (cookieP != null)
                if (!string.IsNullOrEmpty(cookieP.Value))
                    tbUsuario.Text = cookieP.Value;


            tbSenha.Focus();
            if (string.IsNullOrEmpty(tbUsuario.Text))
                tbUsuario.Focus();

        }


    }
    protected void btLogin_Click(object sender, EventArgs e)
    {
        AdmUsuario usu = new AdmUsuario();
        
        if (string.IsNullOrEmpty(usu.Logar(tbUsuario.Text, tbSenha.Text, false)))
        {
            
            HttpCookie cookieU = new HttpCookie("Usuario");
            cookieU.Value = tbUsuario.Text;
            cookieU.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookieU);

            HttpCookie cookiePU = new HttpCookie("permaneceUsuario");
            if (cbPermanecer.Checked)
            {
                cookiePU.Value = tbUsuario.Text;
                cookiePU.Expires = DateTime.Now.AddYears(1);

            }
            else
            {
                cookiePU.Value = "";
            }
            Response.Cookies.Add(cookiePU);


            if (string.IsNullOrEmpty(Request.QueryString["pagina"]))
                Response.Redirect("Administracao.aspx");
            else
                Response.Redirect(Request.QueryString["pagina"]);



        }
        else
        {
            lbMSG.Text = "Usuário ou senha incorretos!";
        }
    }
}