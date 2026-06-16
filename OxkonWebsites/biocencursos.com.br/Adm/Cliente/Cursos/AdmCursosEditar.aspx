<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true"
    CodeFile="AdmCursosEditar.aspx.cs" Inherits="Adm_Cliente_Cursos_AdmCursosEditar" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Editar</h1>
    <div>Curso
        <asp:TextBox ID="tbCurso" runat="server"></asp:TextBox>
    </div>
    <div>Descrição
        <asp:TextBox ID="tbDescricao" runat="server"></asp:TextBox>
    </div>
    <div>Destaque
        <asp:RadioButtonList ID="rblDestaque" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="1">Sim</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">Não</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div>Confirmado
        <asp:RadioButtonList ID="rblConfirmado" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="1">Sim</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">Não</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div>Ativo
        <asp:RadioButtonList ID="rblStatus" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="1">Sim</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">Não</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div>Página<FTB:FreeTextBox ID="ftbMSG" runat="Server" ImageGalleryPath="/Mail/Imagens/" OnSaveClick="btGravar_Click"
                        Text="" Width="100%" Language="pt-PT" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print|SymbolsMenu,StylesMenu,InsertHtmlMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,InsertImageFromGallery,Preview,SelectAll,WordClean,NetSpell" />
                </div>
    <div>
        <asp:Button ID="btGravar" CssClass="bt" runat="server" Text="Gravar" OnClick="btGravar_Click" 
             />&nbsp;<asp:Button ID="btCancelar" CssClass="bt" runat="server" 
            Text="Cancelar" OnClick="btCancelar_Click"
             />&nbsp;<asp:Button ID="btApagar" CssClass="bt" runat="server" 
            Text="Apagar" OnClick="btApagar_Click" Visible="False" 
             />
        <cc1:ConfirmButtonExtender ID="btApagar_ConfirmButtonExtender" runat="server" 
            ConfirmText="Deseja realmente apagar este curso?" Enabled="True" 
            TargetControlID="btApagar">
        </cc1:ConfirmButtonExtender>
        &nbsp;</div>
</asp:Content>
