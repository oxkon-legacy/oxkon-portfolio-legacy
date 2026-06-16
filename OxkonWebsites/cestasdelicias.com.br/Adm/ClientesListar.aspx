<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="ClientesListar.aspx.vb" Inherits="Adm_ClientesListar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style8
    {
        width: 131px;
    }
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
.btSmall{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; background-color: Transparent; background-image: url(/imagens/btSmall.png); border-style: none; border-width: 0px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Clientes</p>
<p>
    <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="cliCodigo" HeaderText="Cód Cliente" />
            <asp:BoundField DataField="cliNome" HeaderText="Nome" />
            <asp:BoundField DataField="cliCPF" HeaderText="CPF" />
            <asp:CommandField HeaderText="Ação" SelectText="Editar" 
                ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    </p>
    <asp:Panel ID="pDetalhes" runat="server" Visible="False">
        <table style="width:100%;">
            <tr>
                <td class="style8">
                    &nbsp;<td>
                    <asp:Button ID="btVoltar" runat="server" Text="Voltar" />
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    *Nome:</td>
                <td>
                    <asp:TextBox ID="tbNome" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    *Sobrenome:</td>
                <td>
                    <asp:TextBox ID="tbSobreNome" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbSobreNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    *Data de nascimento:</td>
                <td>
                    <asp:TextBox ID="tbNasc" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    *CPF:</td>
                <td>
                    <asp:TextBox ID="tbCPF" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="tbNasc" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    *RG:</td>
                <td>
                    <asp:TextBox ID="tbRG" runat="server" CssClass="textBox" ></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="tbRG" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Sexo:</td>
                <td>
                    <asp:RadioButton ID="rbSexoH" runat="server" Checked="True" GroupName="s" 
                        Text="Masculino" />
                    <asp:RadioButton ID="rbSexoF" runat="server" GroupName="s" Text="Feminino" />
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    *CEP:</td>
                <td>
                    <asp:TextBox ID="tbCEP" runat="server" AutoPostBack="True" CssClass="textBox" 
                        MaxLength="8"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvCEP" runat="server" 
                        ControlToValidate="tbCEP" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:Label ID="lbMSGCEP" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
                    <br />
                    Apenas números</td>
            </tr>
            <tr>
                <td class="style8">
                    *Endereço:</td>
                <td>
                    <asp:TextBox ID="tbEndereco" runat="server" 
                    CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="tbEndereco" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    *Número:</td>
                <td>
                    <asp:TextBox ID="tbNumero" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="tbNumero" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Complemento:</td>
                <td>
                    <asp:TextBox ID="tbComplemento" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    *Bairro:</td>
                <td>
                    <asp:TextBox ID="tbBairro" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="tbBairro" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    *Cidade:</td>
                <td>
                    <asp:TextBox ID="tbCidade" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="tbCidade" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    EstaEstado:</td>
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
                        <asp:ListItem Selected="True" Value="SP">SP</asp:ListItem>
                        <asp:ListItem Value="SE">SE</asp:ListItem>
                        <asp:ListItem Value="TO">TO</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    *Telefone residencial:&gt;
                    <td>
                        <asp:TextBox ID="tbTelResDDD" runat="server" CssClass="textBox" MaxLength="2" 
                            Width="30px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="tbTelResDDD" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        &nbsp;<asp:TextBox ID="tbTelRes" runat="server" CssClass="textBox" Width="90px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="tbNome" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Telefone comercial:<td>
                    <asp:TextBox ID="tbTelComDDD" runat="server" CssClass="textBox" MaxLength="2" 
                        Width="30px"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="tbTelCom" runat="server" CssClass="textBox" Width="101px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Telefone móvel:</td>
                <td>
                    <asp:TextBox ID="tbTelCelDDD" runat="server" MaxLength="2" Width="30px" 
                    CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="tbTelCel" runat="server" CssClass="textBox" 
                    Width="101px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    *E-mail:</td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="tbTelRes" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Usuário:</td>
                <td>
                    <asp:TextBox ID="tbUsuario" runat="server" CssClass="textBox" Enabled="False"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btCadastrar" runat="server" CssClass="btSmall" Height="28px" 
                        Text="Gravar" Width="91px" />
                    <br />
                    <asp:Label ID="lbMSG" runat="server" Font-Bold="True" ForeColor="#993300" 
                        Width="100px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <p>
    </p>
</asp:Content>

