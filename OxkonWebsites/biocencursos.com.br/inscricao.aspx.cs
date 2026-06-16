using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inscricao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Codigo = Request.QueryString["id"];

        Cursos cur = new Cursos();

        cur.Codigo = Codigo;
        cur.ObterDados();

        Page.Title = cur.Curso;
        ltCurso.Text = cur.Curso;
        //ltDescricao.Text = cur.Descricao;
        //ltPagina.Text = cur.Pagina;

        //ltInscricao.Text = "<input id=\"Button1\" type=\"button\" value=\"Inscrição\" class=\"bt1\" onclick=\"javascript:location='inscricao.aspx?id=" + Codigo + "' \" />";

    }
    protected void btEnviar_Click(object sender, EventArgs e)
    {
        String Texto;

        Texto = "Inscrição<br /><br />" +
            "Curso: <br />" +
            "Dados Pessoais<br />" +
            "Nome: " + tbNome.Text + "<br />" +
            "Telefone: " + tbTelefone.Text + "<br />" +
            "E-mail: " + tbEmail.Text + "<br />" +
            "Deseja receber nossa agenda de cursos, atualizações e notícias por e-mail?: " + rblNewsletter.SelectedItem.Text + "<br /><br />" +
            "Dados Profissionais" +
            "Profissão: " + tbProfissao.Text + "<br />" +
            "Empresa/Instituição: " + tbEmpresa.Text + "<br />" +
            "Cargo/Ocupação: " + tbCargo.Text + "<br />" +
            "Endereço: " + tbEndereco.Text + "<br />" +
            "CEP: " + tbCEP.Text + "<br />" +
            "Cidade: " + tbCidade.Text + "<br />" +
            "UF: " + tbUF.Text + "<br />" +
            "Telefone: " + tbTelefoneP.Text + "<br />" +
            "Web site: " + tbSite.Text + "<br />" +
            "Forma de Pagamento<br />" +
            "À Vista: " + rblFormaPagto.SelectedItem.Text + "<br />";

        Mail mail = new Mail();
        String r = mail.Enviar("leandro@oxkon.com.br", "", "contato@biocencursos.com.br", "Inscrição via site", Texto, "", false);
        if (String.IsNullOrEmpty(r))
            ltMSG.Text = "Inscrição enviada com sucesso!";
        else
            ltMSG.Text = r;
    }
}