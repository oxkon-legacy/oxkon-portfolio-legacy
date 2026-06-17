<style type="text/css"/>
#body { }
.yes {margin:180px;padding:13px 40px 55px;background:#baeecf; border:1px solid #009900;color:#ff0000;}
.no  {margin:390px;padding:13px 20px 55px;background:#eebaba; border:1px solid #069;color:#069;}
</style>

<?php
if("$_POST[nome]" >= '1'){
 $nome = "$_POST[nome]";
}else{
 $nome = '';
}if("$_POST[email]" >= '1'){
 $email = "$_POST[email]";
}else{
 $email = '';
}if("$_POST[site_empresa]" >= '1'){
 $site_empresa = "$_POST[site_empresa]";
}else{
 $site_empresa = '';
}if("$_POST[assunto]" >= '1'){
 $assunto = "$_POST[assunto]";
}else{
 $assunto = '';
}if("$_POST[mensagem]" >= '1'){
 $mensagem = "$_POST[mensagem]";
}else{
 $mensagem = '';
}
?>

<?php
if (isset($_POST['enviar']) && $_POST['enviar'] == 'send') {

 $nome =          strip_tags(trim($_POST['nome']));
 $email =         strip_tags(trim($_POST['email']));
 $site_empresa =  strip_tags(trim($_POST['site_empresa']));
 $assunto =       strip_tags(trim($_POST['assunto']));
 $mensagem =      strip_tags(trim($_POST['mensagem']));

 $anexado = $_FILES['arquivo']['name'];
 $extensao = strtolower(end(explode('.', $anexado)));
 $extensoes = array ('txt', 'jpg', 'docx', 'pdf', 'png', 'xls', 'xlsx');
 $size = $_FILES['arquivo']['size'];
 $maxsize = 3145728;                            //1024 * 1024 * 2;

 if(empty($anexado)){
 //$retorno = 'Faltou anexar o arquivo!';
 echo "";
 }elseif(array_search($extensao, $extensoes) === false){
 $retorno = '<span class="no">O tipo do arquivo é inválido, aceitamos somente txt, jpg, docx, pdf, png, xls e xlsx, obrigado e tente outro formato...</span>';
 }elseif($size >= $maxsize){
 $retorno = '<span class="no">Arquivo só é permitido com menos de 3mb</span>';
 }if(empty($nome)) {
 $retorno = '<span>Informe seu nome, por favor!</span>';
 }elseif (empty($email)) {
 $retorno = '<span class="no">Informe seu e-mail, por favor!</span>';
 }elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
 $retorno = '<span class="no">Informe um e-mail válido!</span>';
 }elseif (empty($site_empresa)) {
 $retorno = '<span class="no">Informe seu Site ou Empresa, por favor!</span>';
 }elseif (empty($assunto)) {
 $retorno = '<span class="no">Digite o assunto, por favor!</span>';
 }elseif (empty($mensagem)) {
 $retorno = '<span class="no">Digite a mensagem, por favor!</span>';
 }if (empty($retorno)) {

//<input type="hidden" name="enviar" value="send" />

$date = date("d/m/Y h:i");

// ****** ATENÇÃO ********
// ABAIXO ESTÁ A CONFIGURAÇÃO DO SEU FORMULÁRIO.
// ****** ATENÇÃO ********

//CABEÇALHO - CONFIGURAÇÕES SOBRE SEUS DADOS E SEU WEBSITE

$destino = $_POST['destino'];

$nome_do_site="Estampocar";
$email_para_onde_vai_a_mensagem = "$destino";
$nome_de_quem_recebe_a_mensagem = "Deusdete Queiroz";
$exibir_apos_enviar='';

//MAIS - CONFIGURAÇOES DA MENSAGEM ORIGINAL
$cabecalho_da_mensagem_original="From: $email\n";
$assunto_da_mensagem_original="$assunto";

// FORMA COMO RECEBERÁ O E-MAIL (FORMULÁRIO)
// ******** OBS: SE FOR ADICIONAR NOVOS CAMPOS, ADICIONE OS CAMPOS NA VARIÁVEL ABAIXO *************
$configuracao_da_mensagem_original="

<strong>ENVIADO POR:</strong><br />
<strong>Nome:</strong> $nome<br />
<strong>E-mail:</strong> $email<br />
<strong>Site/Empresa:</strong> $site_empresa<br />
<strong>Assunto:</strong> $assunto<br /><br />
<strong>Mensagem:</strong> $mensagem<br /><br />

ENVIADO EM: $date";

//CONFIGURAÇÕES DA MENSAGEM DE RESPOSTA
// CASO $assunto_digitado_pelo_usuario="s" ESSA VARIAVEL RECEBERA AUTOMATICAMENTE A CONFIGURACAO
// "Re: $assunto"
$assunto_da_mensagem_de_resposta = "Recebemos sua mensagem";
$cabecalho_da_mensagem_de_resposta = "From: $nome_do_site <$email_para_onde_vai_a_mensagem>\n";
$configuracao_da_mensagem_de_resposta="

Obrigado por entrar em contato!<br />
Estaremos respondendo em breve...<br />
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Atenciosamente $<br/>_______________________________<br/>Deusdete-Queiroz_Diretor Industrial</strong><br /><br />
Enviado em: $date";

// ****** IMPORTANTE ********
// A PARTIR DE AGORA RECOMENDA-SE QUE NÃO ALTERE O SCRIPT PARA QUE O  SISTEMA FINCIONE CORRETAMENTE
// ****** IMPORTANTE ********

//ESSA VARIAVEL DEFINE SE É O USUARIO QUEM DIGITA O ASSUNTO OU SE DEVE ASSUMIR O ASSUNTO DEFINIDO
//POR VOCÊ CASO O USUARIO DEFINA O ASSUNTO PONHA "s" NO LUGAR DE "n" E CRIE O CAMPO DE NOME
//'assunto' NO FORMULARIO DE ENVIO
$assunto_digitado_pelo_usuario="s";

//ENVIO DA MENSAGEM ORIGINAL

$arquivo = isset($_FILES["arquivo"]) ? $_FILES["arquivo"] : FALSE;

if(file_exists($arquivo["tmp_name"]) and !empty($arquivo)){

 $fp = fopen($_FILES["arquivo"]["tmp_name"],"rb");
 $anexo = fread($fp,filesize($_FILES["arquivo"]["tmp_name"]));
 $anexo = base64_encode($anexo);

fclose($fp);

$anexo = chunk_split($anexo);

$boundary = "XYZ-" . date("dmYis") . "-ZYX";

 $mens = "--$boundary\n";
 $mens .= "Content-Transfer-Encoding: 8bits\n";
 $mens .= "Content-Type: text/html; charset=\"iso 8859-1\"\n\n";
 $mens .= "$configuracao_da_mensagem_original\n";
 $mens .= "--$boundary\n";
 $mens .= "Content-Type: ".$arquivo["type"]."\n";
 $mens .= "Content-Disposition: attachment; filename=\"".$arquivo["name"]."\"\n";
 $mens .= "Content-Transfer-Encoding: base64\n\n";
 $mens .= "$anexo\n";
 $mens .= "--$boundary--\r\n";

$headers  = "MIME-Version: 1.0\n";
$headers .= "$cabecalho_da_mensagem_original";
$headers .= "Content-type: multipart/mixed; boundary=\"$boundary\"\r\n";
$headers .= "$boundary\n";
}else{

$mens = "$configuracao_da_mensagem_original\n";

$headers  = "MIME-Version: 1.0\n";
$headers .= "$cabecalho_da_mensagem_original";
$headers .= "Content-Type: text/html; charset=\"iso 8859-1\"\n\n";
}

if ($assunto_digitado_pelo_usuario=="s")
{
$assunto = "$assunto_da_mensagem_original";
};
$seuemail = "$email_para_onde_vai_a_mensagem";
mail($seuemail,$assunto,$mens,$headers);

//ENVIO DE MENSAGEM DE RESPOSTA AUTOMATICA

$headers = "$cabecalho_da_mensagem_de_resposta";
$headers .= "Content-Type: text/html; charset=\"iso 8859-1\"\n\n";

if ($assunto_digitado_pelo_usuario=="s")
{
$assunto = "$assunto_da_mensagem_de_resposta";
}
else
{
$assunto = "Re: $assunto";
};
$mensagem = "$configuracao_da_mensagem_de_resposta";
mail($email,$assunto,$mensagem,$headers);

/*echo "<script>window.location='$exibir_apos_enviar'</script>";*/
echo "<span class=\"yes\"><strong>Sua mensagem foi enviada com suscesso, estaremos respondendo o mais breve possível!</strong></span>";
unset($nome, $email, $assunto, $mensagem);

}
else {
 echo "$retorno";
 }
}
?>


<br/><br/><br/><br/><p align="center" style="bacground:#"><a href="http://www.estampocar.com.br/">Clique para voltar ao site.</a></p>