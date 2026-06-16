<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetalhesProduto.aspx.vb" Inherits="DetalhesProduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
body{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px;}
.padLeft{ padding-left: 10px;}
.textBox{ font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; border-style: solid; border-width: 1px; border-color: #443D33; background: #A79885; color: #442922;}
        .btSmall
        {
            font-family: Verdana, Arial, MS Sans Serif;
            font-size: 11px;
            background-color: Transparent;
            background-image: url(/imagens/btSmall.png);
            border-style: none;
            border-width: 0px;
        }
    .style7
    {
        width: 100px;
        text-align: center;
    }
    .style8
    {
        color: #6A0000;
        font-weight: bold;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="/imagens/detail.png"  />
    <br /><br />
<table width="100%" border="0" cellspacing="0" cellpadding="0" 
            __designer:mapid="29">
            <tr style=" background-image: url(/imagens/tbpg1.png); height: 19px;">
            <td>&nbsp;
            
            </td>
            
            </tr>
      <tr __designer:mapid="2a">
        <td height="91" valign="top" background="/imagens/tbpg2.jpg" 
              __designer:mapid="2b">
        <table style="width:100%;">
            <tr>
                <td align="center">
                <asp:Literal ID="ltFoto" runat="server"></asp:Literal>                </td>
    <td style=" vertical-align: top;" rowspan="2">
                    <asp:Label ID="lbProduto" runat="server" Font-Bold="True"></asp:Label>
                    <br /><br />
                    <asp:Label ID="lbDescricao" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td >&nbsp;
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="hlComprar" runat="server" ImageUrl="~/Imagens/btSmall2.png" 
                        style="text-align: left; padding-left: 20px;">HyperLink</asp:HyperLink>
                </td>
                <td>&nbsp;
                    </td>
            </tr>
            <tr>
                <td>&nbsp;
                    </td>
                <td>
                    Valor: <span class="style8">R$</span><asp:Label ID="lbValor" runat="server" Font-Bold="True" 
            Font-Size="14px" ForeColor="#6A0000"></asp:Label>
&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;
                    </td>
                <td>&nbsp;
                    </td>
            </tr>
            <tr>
                <td>&nbsp;
                    </td>
                <td>
                    Fornecedor:                     <asp:Label ID="lbFornecedor" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
          </td>
      </tr>
      <tr>
          <td style=" background-image:url(/Imagens/tbpg3.png); background-repeat:no-repeat; height: 30px;">
          &nbsp;
              <br />
          </td>
          </tr>
    </table>
</asp:Content>

