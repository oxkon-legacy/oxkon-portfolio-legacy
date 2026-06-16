<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Departamentos.aspx.vb" Inherits="Departamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table>
  <tr>
    <td><img src="/imagens/flwLeft.png" /></td>
    <td><asp:Label ID="lbDepartamento" runat="server" Font-Names="Arial" 
            Font-Size="12px" Font-Bold="True" ForeColor="#45322C"></asp:Label></td>
    <td><img src="/imagens/flwRight.png" /></td>
  </tr>    
  </table>
    <br />
    <br />
    <asp:Literal ID="ltProdutos" runat="server"></asp:Literal>
  
</asp:Content>

