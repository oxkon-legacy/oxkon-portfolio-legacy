<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="parceiros.aspx.cs" Inherits="Imagens_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>BioCen | Parceiros</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="artigo"  style=" padding-left: 20px;">
        <span class="lightgray">Parceiros:</span>
        <div class="lineForm">
            <img src="/imagens/logo_maxitrack.jpg" width="40%" alt="Maxitrack" /><br />
            <a href="http://www.maxitrack.com.br" title="Conhe&ccedil;a Maxitrack!">www.maxitrack.com.br</a>
        </div>
        <div style="width:95%; height:3px; background:#CCC;"></div>
        <div class="lineForm">
            <img src="/imagens/logo_absi.jpg" width="40%" alt="ABSI Service" /><br />
            <a href="http://www.absi.com.br" title="ABSI Service">www.absi.com.br</a>
        </div>
        <div style="width:95%; height:3px; background:#CCC;"></div>
        <div class="lineForm">
            <img src="/imagens/logo_ethik.jpg" width="40%" alt="Ethik Technology" /><br />
            <a href="http://www.ethik.com.br" title="Ethik Technology">www.ethik.com.br</a>
        </div>
        <div style="width:95%; height:3px; background:#CCC;"></div>
    </div>
</asp:Content>

