
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Dim conn As New Conexao

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lbNome.Text = "Olá Visitante!"

        Dim f As New Funcoes
        lbData.Text = f.DiaSemana(Date.Now.DayOfWeek)
        lbData.Text += ", " + Date.Now.Day.ToString + " de " + MonthName(Date.Now.Month) + " de " + Date.Now.Year.ToString
        lbDescCarrinho.Text = "Itens: 1 Total: R$ 0,00"

        gvDepartamentos.DataSource = conn.getDataReader("SELECT * FROM tabCategorias")
        gvDepartamentos.DataBind()
        conn.Fechar()

    End Sub

End Class

