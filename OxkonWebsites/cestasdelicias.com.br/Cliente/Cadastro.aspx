<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cadastro.aspx.vb" Inherits="Cliente_Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
<!--
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
.btSmall{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; background-color: Transparent; background-image: url(/imagens/btSmall.png); border-style: none; border-width: 0px;}
    .style7
    {
    }
    .style8
    {
        width: 131px;
    }
-->
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;" __designer:mapid="121">
        <tr __designer:mapid="122">
            <td __designer:mapid="123" class="style7" colspan="2">
                    <img src="/imagens/altCad.png"</td>
        </tr>
        <tr __designer:mapid="122">
            <td __designer:mapid="123" class="style8">
                    *Nome:</td>
            <td __designer:mapid="124">
                <asp:TextBox ID="tbNome" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="127">
            <td __designer:mapid="128" class="style8">
                    *Sobrenome:</td>
            <td __designer:mapid="129">
                <asp:TextBox ID="tbSobreNome" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbSobreNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="12c">
            <td __designer:mapid="12d" class="style8">
                    *Data de nascimento:</td>
            <td __designer:mapid="12e">
                <asp:TextBox ID="tbNasc" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="131">
            <td __designer:mapid="132" class="style8">
                    *CPF:</td>
            <td __designer:mapid="133">
                <asp:TextBox ID="tbCPF" runat="server" CssClass="textBox" ></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="tbNasc" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="136">
            <td __designer:mapid="137" class="style8">
                    *RG:</td>
            <td __designer:mapid="138">
                <asp:TextBox ID="tbRG" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="tbRG" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="13b">
            <td __designer:mapid="13c" class="style8">
                    Sexo:</td>
            <td __designer:mapid="13d">
                <asp:RadioButton ID="rbSexoH" runat="server" Text="Masculino" Checked="True" 
                        GroupName="s" />
                <asp:RadioButton ID="rbSexoF" runat="server" Text="Feminino" GroupName="s" />
            </td>
        </tr>
        <tr __designer:mapid="140">
            <td __designer:mapid="141" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="142">
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="143">
            <td __designer:mapid="144" class="style8">
                    *CEP:</td>
            <td __designer:mapid="145">
                <asp:TextBox ID="tbCEP" runat="server" MaxLength="8" AutoPostBack="True" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvCEP" runat="server" 
                        ControlToValidate="tbCEP" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:Label ID="lbMSGCEP" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
                <br __designer:mapid="149" />Apenas números</td>
        </tr>
        <tr __designer:mapid="14a">
            <td __designer:mapid="14b" class="style8">
                    *Endereço:</td>
            <td __designer:mapid="14c">
                <asp:TextBox ID="tbEndereco" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="tbEndereco" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="14f">
            <td __designer:mapid="150" class="style8">
                    *Número:</td>
            <td __designer:mapid="151">
                <asp:TextBox ID="tbNumero" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="tbNumero" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="154">
            <td __designer:mapid="155" class="style8">
                    Complemento:</td>
            <td __designer:mapid="156">
                <asp:TextBox ID="tbComplemento" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="158">
            <td __designer:mapid="159" class="style8">
                    *Bairro:</td>
            <td __designer:mapid="15a">
                <asp:TextBox ID="tbBairro" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="tbBairro" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="15d">
            <td __designer:mapid="15e" class="style8">
                    *Cidade:</td>
            <td __designer:mapid="15f">
                <asp:TextBox ID="tbCidade" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="tbCidade" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="162">
            <td __designer:mapid="163" class="style8">
                    EstaEstado:</td>
            <td __designer:mapid="164">
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
        <tr __designer:mapid="167">
            <td __designer:mapid="168" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="169">
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="16a">
            <td __designer:mapid="16b" class="style8">
                    *Telefone residencial:>
            <td __designer:mapid="16c">
                <asp:TextBox ID="tbTelResDDD" runat="server" MaxLength="2" Width="30px" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="tbTelResDDD" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    &nbsp;<asp:TextBox ID="tbTelRes" runat="server" CssClass="textBox" 
                    Width="90px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="171">
            <td __designer:mapid="172" class="style8">
                    Telefone comercial:</td>
            <td __designer:mapid="173">
                <asp:TextBox ID="tbTelComDDD" runat="server" MaxLength="2" Width="30px" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="tbTelCom" runat="server" CssClass="textBox" 
                    Width="101px"></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="176">
            <td __designer:mapid="177" class="style8">
                    Telefone móvel:</td>
            <td __designer:mapid="178">
                <asp:TextBox ID="tbTelCelDDD" runat="server" MaxLength="2" Width="30px" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="tbTelCel" runat="server" CssClass="textBox" 
                    Width="101px"></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="17b">
            <td __designer:mapid="17c" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="17d">
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="17e">
            <td __designer:mapid="17f" class="style8">
                    *E-mail:</td>
            <td __designer:mapid="180">
                <asp:TextBox ID="tbEmail" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="tbTelRes" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr __designer:mapid="183">
            <td __designer:mapid="184" class="style8">
                    Usuário:</td>
            <td __designer:mapid="185">
                <asp:TextBox ID="tbUsuario" runat="server" Enabled="False" CssClass="textBox"></asp:TextBox>
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="192">
            <td __designer:mapid="193" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="194">
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="195">
            <td __designer:mapid="196" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="197">
                <asp:Button ID="btCadastrar" runat="server" Text="Gravar"  CssClass="btSmall" 
                    Height="28px" Width="91px"/>
                <br />
                <asp:Label ID="lbMSG" runat="server" Font-Bold="True" ForeColor="#993300" 
                    Width="100px"></asp:Label>
            </td>
        </tr>
        <tr __designer:mapid="199">
            <td __designer:mapid="19a" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="19b">
                    &nbsp;</td>
        </tr>
        <tr __designer:mapid="19c">
            <td __designer:mapid="19d" class="style8">
                    &nbsp;</td>
            <td __designer:mapid="19e">
                    &nbsp;</td>
        </tr>
    </table>
</asp:Content>

