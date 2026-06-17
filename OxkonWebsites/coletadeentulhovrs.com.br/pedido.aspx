<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pedido.aspx.cs" Inherits="pedido" %>
<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link rel="stylesheet" type="text/css" href="/css/estilo.css" />
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Anton|Oswald" media="screen" />
<title>:: VRS - Coleta de Entulho - Pedido ::</title>
</head>

<body>
    <form id="form1" runat="server">
<div id="tudo">
	<div id="topo">
		<div id="cabecalho">
        	<div id="menu">
        		<a href="/" class="hover"> Home</a> |
        		<a href="/institucional.html" class="hover"> Institucional</a> |
        		<a href="/atendimento.html" class="hover"> &Aacute;rea de Atendimento</a> |
        		<a href="/pedido.aspx" class="hover"> Fa&ccedil;a seu pedido</a>
        	</div>
        </div>
	</div>
	<div id="corpo">
	    <div id="corpo_e">
	        <div class="titulo_campo">Nome:</div>
            <div class="campo"><asp:TextBox ID="tbNome" runat="server" placeholder="Seu Nome"></asp:TextBox></div>
            <div class="titulo_campo">E-mail:</div>
            <div class="campo"><asp:TextBox ID="tbEmail" runat="server" placeholder="Seu Endere&ccedil;o"></asp:TextBox></div>
            <div class="titulo_campo">Telefone:</div>
            <div class="campo"><asp:TextBox ID="tbTelefone" runat="server" placeholder="Telefone + DDD"></asp:TextBox></div>
            <div class="titulo_campo">Mensagem:</div>
            <div class="campo"><asp:TextBox ID="tbMSG" runat="server" TextMode="MultiLine" placeholder="Digite sua mensagem"></asp:TextBox></div><br />
            <asp:Button ID="btEnviar" runat="server" OnClick="btEnviar_Click" Text="Enviar" CssClass="myButton" />&nbsp;
            <asp:Literal ID="ltMSG" runat="server"></asp:Literal>
	    </div>
	    <div id="corpo_d">
	    	<div id="box">
		        <h2>Central de atendimento</h2>
		        <div class="linha_box"></div>
		        <h1><sup>(11)</sup> 3746-9325<br /><sup>(11)</sup> 9887-5801</h1>
		        <div class="linha_box"></div>
		        <h2 class="small">pedidos@vrscoletaentulho.com.br<br />
		        contato@vrscoletaentulho.com.br</h2>
	        </div><br />
	        <p>Respeito pelo meio ambiente:</p>
	        <ul>
	        	<li>Empresa cadadastrada junto a Limpurb Autoriza&ccedil;&atilde;o n&ordm;. 00051<br />Destina&ccedil;&atilde;o seletiva dos materiais</li>
	        	<li>Ca&ccedil;ambas cadastradas &minus; Sua seguran&ccedil;a junto aos &oacute;rg&atilde;os ambientais!</li>
	        </ul><br />
	        <p>N&atilde;o tenha problemas com a fiscaliza&ccedil;&atilde;o dos &oacute;rg&atilde;os p&uacute;blicos &minus; Contrate a VRS Coleta de Entulho</p><br />
	        <img class="centro" src="/imagens/facebook.png" alt="Confira mais novidades no Facebook" width="162px" height="51px" /><br /><br />
	        <img class="centro" src="/imagens/twitter.png" alt="Siga-nos no Twitter" width="162px" height="51px" />
	    </div>
    </div>
    <div id="rodape">
    
    </div>
</div>
    </form>
</body>

</html>
