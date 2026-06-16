using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class detalhes_curso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Codigo = Request.QueryString["id"];

        Cursos cur = new Cursos();
        
        cur.Codigo = Codigo;
        cur.ObterDados();

        Page.Title = cur.Curso;
        ltCurso.Text = cur.Curso;
        ltDescricao.Text = cur.Descricao;
        ltPagina.Text = cur.Pagina;

        ltInscricao.Text = "<input id=\"Button1\" type=\"button\" value=\"Inscrição\" class=\"bt1\" onclick=\"javascript:location='inscricao.aspx?id=" + Codigo + "' \" />";
    }
}