<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="inscricao.aspx.cs" Inherits="inscricao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="geral2">
    <h1>
        Inscrição</h1>
    <div class="lineForm">
        <h1>Curso:</h1>
        <h2><asp:Literal ID="ltCurso" runat="server"></asp:Literal></h2></div>
    <div style="display:none;">
        <span>Data:</span>
        <asp:TextBox ID="tbData" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <b>Dados Pessoais</b>
   	</div>
    <div class="lineForm">
        <span>Nome</span>
        <asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Telefone</span>
        <asp:TextBox ID="tbTelefone" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>E-mail</span>
        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <b>Deseja receber nossa agenda de cursos, atualizações e notícias por e-mail?</b><br />
        <asp:RadioButtonList ID="rblNewsletter" runat="server" 
            RepeatDirection="Horizontal" CssClass="radiobutton">
            <asp:ListItem Selected="True" Value="1">Sim</asp:ListItem>
            <asp:ListItem Value="0">Não</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="lineForm">
        <b>Dados Profissionais</b>
    </div>
    <div class="lineForm">
        <span>Profissão</span>
        <asp:TextBox ID="tbProfissao" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Empresa/Instituição</span>
        <asp:TextBox ID="tbEmpresa" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Cargo/Ocupação</span>
        <asp:TextBox ID="tbCargo" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Endereço</span>
        <asp:TextBox ID="tbEndereco" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>CEP</span>
        <asp:TextBox ID="tbCEP" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Cidade</span>
        <asp:TextBox ID="tbCidade" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>UF</span>
        <asp:TextBox ID="tbUF" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Telefone</span>
        <asp:TextBox ID="tbTelefoneP" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        <span>Web site</span>
        <asp:TextBox ID="tbSite" runat="server"></asp:TextBox>
    </div>
    <div class="lineForm">
        Forma de Pagamento</div>
    <div>
        <asp:RadioButtonList ID="rblFormaPagto" runat="server">
            <asp:ListItem Selected="True" Value="1">À vista</asp:ListItem>
        </asp:RadioButtonList>
        <b>Favor enviar o(s) comprovante(s) de pagamento para: inscricao@biocencursos.com.br</b></div>
    <div class="lineForm">
        <b>
			Obs.: Para emissão do recibo de pagamento, favor informar no e-mail o nome do responsável pelo pagamento
            / empresa (pessoa física / jurídica) e o CPF / CNPJ
        </b>
    </div> 
    <div class="lineForm">
        <asp:Button ID="btEnviar" runat="server" OnClick="btEnviar_Click" Text="Enviar" CssClass="bt1" />
        <asp:Literal ID="ltMSG" runat="server"></asp:Literal>
    </div>
    <div class="lineForm">
	<h1>Informações Importantes</h1>
        <div style=" margin: 20px;"><h2>Confirmação da Inscrição</h2></div>
    <p>
        Os alunos terão suas confirmações de inscrição notificadas via e-mail. No momento de envio da ficha de inscrição
        será encaminhado um e-mail ao aluno informando que sua pré-inscrição foi realizada, ou seja, sua vaga fica garantida
        por 3 (três) dias. Durante estes 3 (três) dias deverá ser efetuado o pagamento via depósito bancário e deverá ser enviado à BioCen o comprovante de depósito via e-mail, para <a href="mailto:inscricao@biocencursos.com.br">inscricao@biocencursos.com.br</a>. Será enviado um e-mail de resposta ao aluno confirmando o pagamento e a sua inscrição em até 1 (um) dia. Caso não haja confirmação da pré-inscrição ou do pagamento pela BioCen, entre em contato pelo telefone (11) 8524.7179 e buscaremos uma solução. Pronto! Sua vaga está garantida! Agora é só aguardar a data do curso e aproveitar tudo que temos a oferecer!    </p>
        <div style=" margin: 20px;"><h2>Formas de Pagamento</h2></div>
    <p>
    Via depósito bancário. Para outras possibilidades de pagamento, entre em contato pelo e-mail <a href="mailto:contato@biocencursos.com.br">contato@biocencursos.com.br</a>. Uma cópia do comprovante de depósito deverá ser enviado por e-mail para <a href="mailto:inscricao@biocencursos.com.br">inscricao@biocencursos.com.br</a> para garantir a sua inscrição, não esqueça.
Para emissão de recibo de pagamento, favor informar no e-mail de envio do comprovante de pagamento o nome do responsável pelo pagamento / empresa (pessoa física / jurídica) e o CPF / CNPJ.
    </p>
        <div style=" margin: 20px;"><h2>Cancelamento / Mudança de data do Curso</h2></div>
    <p>
As datas dos cursos poderão sofrer alterações ou estes podem ser cancelados, caso não haja um quórum mínimo de 65% de inscritos de acordo com as vagas disponibilizadas. A BioCen também pode vir a cancelar ou alterar a data dos cursos, caso existam justificativas que impossibilitem a realização destes. Independente das razões, em caso de alteração de data ou cancelamento do curso, os alunos serão notificados com antecedência de, ao menos, 7 (sete) dias. Assim sendo, os alunos serão restituídos do valor da inscrição em um período de até 30 (trinta) dias.
    </p>
    </div>
</div>
</asp:Content>
