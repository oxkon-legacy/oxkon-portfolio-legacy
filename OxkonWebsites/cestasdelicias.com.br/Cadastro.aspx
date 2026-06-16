<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cadastro.aspx.vb" Inherits="Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
<!--
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
.btSmall{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; background-color: Transparent; background-image: url(/imagens/btSmall.png); border-style: none; border-width: 0px;}
    .style7
    {
        width: 113px;
    }
-->
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
       
    <asp:Panel ID="pCad" runat="server">
   <p> <img src="Imagens/cadUser.png" /> <br /><br /><b>ATENÇÃO:</b>  Os campos com * (asterisco)<br /> são de preenchimento obrigatório!</p>
        <table style="width:100%; margin-left: 10px;">
            <tr>
                <td class="style7">
                    *Nome:</td>
                <td>
                    <asp:TextBox ID="tbNome" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *Sobrenome:</td>
                <td>
                    <asp:TextBox ID="tbSobreNome" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbSobreNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *Data de nascimento:</td>
                <td>
                    <asp:TextBox ID="tbNasc" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *CPF:</td>
                <td>
                    <asp:TextBox ID="tbCPF" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="tbNasc" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *RG:</td>
                <td>
                    <asp:TextBox ID="tbRG" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="tbRG" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Sexo:</td>
                <td>
                    <asp:RadioButton ID="rbSexoH" runat="server" Text="Masculino" Checked="True" 
                        GroupName="s" />
                    <asp:RadioButton ID="rbSexoF" runat="server" Text="Feminino" GroupName="s" />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    *CEP:</td>
                <td>
                    <asp:TextBox ID="tbCEP" runat="server" MaxLength="8" AutoPostBack="True" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvCEP" runat="server" 
                        ControlToValidate="tbCEP" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:Label ID="lbMSGCEP" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
                    Apenas números</td>
            </tr>
            <tr>
                <td class="style7">
                    *Endereço:</td>
                <td>
                    <asp:TextBox ID="tbEndereco" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="tbEndereco" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *Número:</td>
                <td>
                    <asp:TextBox ID="tbNumero" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="tbNumero" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Complemento:</td>
                <td>
                    <asp:TextBox ID="tbComplemento" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    *Bairro:</td>
                <td>
                    <asp:TextBox ID="tbBairro" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="tbBairro" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *Cidade:</td>
                <td>
                    <asp:TextBox ID="tbCidade" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="tbCidade" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Estado:</td>
                <td>
                    <asp:DropDownList ID="ddEstado" runat="server" CssClass="textBox">
                        <asp:ListItem Value="AC">AC</asp:ListItem>
                        <asp:ListItem Value="AL">AL</asp:ListItem>
                        <asp:ListItem Value="AP">AP</asp:ListItem>
                        <asp:ListItem Value="AM">AM</asp:ListItem>
                        <asp:ListItem Value="BA">BA</asp:ListItem>
                        <asp:ListItem Value="CE">CE</asp:ListItem>
                        <asp:ListItem Value="DF">DF</asp:ListItem>
                        <asp:ListItem Value="ES">ES</asp:ListItem>
                        <asp:ListItem Value="GO">GO</asp:ListItem>
                        <asp:ListItem Value="MA">MA</asp:ListItem>
                        <asp:ListItem Value="MT">MT</asp:ListItem>
                        <asp:ListItem Value="MS">MS</asp:ListItem>
                        <asp:ListItem Value="MG">MG</asp:ListItem>
                        <asp:ListItem Value="PA">PA</asp:ListItem>
                        <asp:ListItem Value="PB">PB</asp:ListItem>
                        <asp:ListItem Value="PR">PR</asp:ListItem>
                        <asp:ListItem Value="PE">PE</asp:ListItem>
                        <asp:ListItem Value="PI">PI</asp:ListItem>
                        <asp:ListItem Value="RJ">RJ</asp:ListItem>
                        <asp:ListItem Value="RN">RN</asp:ListItem>
                        <asp:ListItem Value="RS">RS</asp:ListItem>
                        <asp:ListItem Value="RO">RO</asp:ListItem>
                        <asp:ListItem Value="RR">RR</asp:ListItem>
                        <asp:ListItem Value="SC">SC</asp:ListItem>
                        <asp:ListItem Value="SP" Selected="True">SP</asp:ListItem>
                        <asp:ListItem Value="SE">SE</asp:ListItem>
                        <asp:ListItem Value="TO">TO</asp:ListItem>


                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    *Telefone residencial:</td>
                <td>
                    <asp:TextBox ID="tbTelResDDD" runat="server" MaxLength="2" Width="30px" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="tbTelResDDD" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    &nbsp;<asp:TextBox ID="tbTelRes" runat="server" CssClass="textBox" 
                        Width="90px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="tbTelRes" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Telefone comercial:</td>
                <td>
                    <asp:TextBox ID="tbTelComDDD" runat="server" MaxLength="2" Width="30px" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="tbTelCom" runat="server" CssClass="textBox" 
                        Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Telefone móvel:</td>
                <td>
                    <asp:TextBox ID="tbTelCelDDD" runat="server" MaxLength="2" Width="30px" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="tbTelCelDDD" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="tbTelCel" runat="server" CssClass="textBox" 
                        Width="100px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="tbTelCel" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    *E-mail:</td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="tbTelRes" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *Usuário:</td>
                <td>
                    <asp:TextBox ID="tbUsuario" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="tbUsuario" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="lbMSGUsu" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    *Senha:</td>
                <td>
                    <asp:TextBox ID="tbSenha" runat="server" TextMode="Password" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="tbSenha" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Confirmar Senha:</td>
                <td>
                    <asp:TextBox ID="tbSenhaC" runat="server" TextMode="Password" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="tbSenha" ControlToValidate="tbSenhaC" Display="Dynamic" 
                        ErrorMessage="Senha e confirmação diferentes!" Font-Bold="True" 
                        ForeColor="#993300"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btCadastrar" runat="server" CssClass="btSmall" Height="28px" 
                        Text="Cadastrar" Width="91px" />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="pOK" runat="server" Visible="False">
        Cadastro realizado com sucesso.<br />
        <br />
        <asp:Label ID="lbMSGContinua" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
    </asp:Panel>
    <p>
        &nbsp;</p>
</asp:Content>

