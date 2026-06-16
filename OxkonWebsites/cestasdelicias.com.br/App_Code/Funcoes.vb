Imports Microsoft.VisualBasic
Imports System.Data
Imports System.IO
Imports System.Xml

Public Class Funcoes
    Dim conn As New Conexao

    Function Produtos(ByVal SQL As String) As String

        Dim QTDHorizontal As Integer = 2


        Dim r As String = ""
        r = "<table><tr>"

        Dim dt As DataTable = conn.getDataTable(SQL)

        Dim x As Integer
        Dim QTD As Integer = 0
        For x = 0 To dt.Rows.Count - 1
            Dim Cod As String = dt.Rows(x).Item("proCodigo").ToString

            Dim arqFoto As New FileInfo(System.Configuration.ConfigurationManager.AppSettings("Imagens") + "\Produtos\" + dt.Rows(x).Item("proFotoL").ToString)
            Dim Foto As String = "/Imagens/Produtos/NaoDisponivel.jpg"
            If arqFoto.Exists Then
                Foto = "/Imagens/Produtos/" + dt.Rows(x).Item("proFotoL").ToString
            End If

            Dim Comprar As String = "<a href=""/AdicionarCarrinho.aspx?CodProduto=" + dt.Rows(x).Item("proCodigo").ToString + """><img src=""/Imagens/btComprar.png"" border=""0"" /></a>"

            Dim Entrega As String = "Pronta entrega!"
            If dt.Rows(x).Item("proEstoque") = 0 Then
                Entrega = "Indisponível!"
                Comprar = ""
            End If




            r += "<td><table cellspacing=""0"" cellpadding=""0"" style="" background-image: url(/imagens/siteMod1_19.png); width: 245px; height: 176px; font-family: Verdana, Arial, MS Sans Serif; font-size: 11px; color: #554235;""><tr><td width=""20"">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td height=""25"">&nbsp;</td><td width=""115""  rowspan=""2""><img src=""" + Foto + """></td><td style=""font-family: Verdana, Arial, MS Sans Serif; font-size: 14px; color: #FF3300; padding-left: 7px;""><br /><b>" + FormatCurrency(dt.Rows(x).Item("proValor"), 2).ToString + "</b></td></tr><tr><td height=""91"">&nbsp;</td><td style="" padding: 6px;""><b>" + dt.Rows(x).Item("proNome").ToString + "<br></b>" + Entrega + "</td></tr><tr><td>&nbsp;</td><td style="" padding-top: 10px; padding-left: 5px; "">" + Comprar + "<a href=""/DetalhesProduto.aspx?CodProduto=" + Cod + """ border=""0""><img src=""/Imagens/btDetalhes.png"" style="" padding-left: 4px;"" border=""0"" /></a></td><td>&nbsp;</td></tr> <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr> </table></td>"
            QTD += 1
            If QTD = QTDHorizontal Then
                QTD = 0
                r += "</tr><tr>"
            End If
        Next

        For x = QTD To QTDHorizontal - 1
            r += "<td>&nbsp;<td>"
        Next

        r += "</tr></table>"
        Return r
    End Function

    Function CalculaValorFrete(ByVal cepDestino As String, ByVal Peso As String, ByVal TotalCompra As Decimal) As String
        'CASO TENHA SEDEX 10 O FRETE É GRATIS
        'DO CONTRARIO É COBRADO O SEDEX COMUM

        Dim r As String = ""

        'Dim Proxy As New Net.WebProxy("192.168.0.3", 8080)
        'Dim Credenciais As New Net.NetworkCredential("rodolfo", "kjkj")
        'Proxy.Credentials = Credenciais

        Dim req As Net.WebRequest = Net.WebRequest.Create("http://www.correios.com.br/encomendas/precos/calculo.cfm?cepOrigem=07193000&cepDestino=" + cepDestino + "&peso=" + Peso + "&resposta=xml&servico=40215")
        'req.Proxy = Proxy
        Dim xmlStream As New IO.StreamReader(req.GetResponse().GetResponseStream())
        Dim xmldoc As New XmlDocument
        Dim node As XmlNodeList
        Try
            xmldoc.LoadXml(xmlStream.ReadToEnd.Replace("<?xml version=""1.0"" encoding=""ISO-8859-1"" ?>", ""))

            node = xmldoc.GetElementsByTagName("dados_postais")

            r = node.Item(0).ChildNodes(13).InnerText.Replace(".", ",")
            If TotalCompra >= 130 Then
                r = "Frete gratis"
            End If
        Catch ex As Exception
            req = Net.WebRequest.Create("http://www.correios.com.br/encomendas/precos/calculo.cfm?cepOrigem=07193000&cepDestino=" + cepDestino + "&peso=10&resposta=xml")
            'req.Proxy = Proxy
            xmlStream = New IO.StreamReader(req.GetResponse().GetResponseStream())
            Try
                xmldoc.LoadXml(xmlStream.ReadToEnd.Replace("<?xml version=""1.0"" encoding=""ISO-8859-1"" ?>", ""))
                node = xmldoc.GetElementsByTagName("dados_postais")
                r = node.Item(0).ChildNodes(13).InnerText.Replace(".", ",")

            Catch ex2 As Exception
                r = "CEP não encontrado!"
            Finally
                xmlStream.Close()
            End Try
        Finally
            xmlStream.Close()
        End Try



        Return r
    End Function

    Function getEndereco(ByVal CEP As String) As Array

        Dim r(3) As String

        'Dim Proxy As New Net.WebProxy("192.168.0.3", 8080)
        'Dim Credenciais As New Net.NetworkCredential("rodolfo", "kjkj")
        'Proxy.Credentials = Credenciais

        Dim req As Net.WebRequest = Net.WebRequest.Create("http://www.buscarcep.com.br/?cep=" + CEP + "&formato=string")
        'req.Proxy = Proxy

        Dim StreamRead As New IO.StreamReader(req.GetResponse().GetResponseStream(), System.Text.Encoding.GetEncoding("ISO-8859-1"))

        Dim dados As Array = Split(StreamRead.ReadToEnd, "&")

        Select Case Right(dados(1), dados(1).Length - InStr(dados(1), "="))

            Case Is <= 0
                r(0) = Right(dados(1), dados(1).Length - InStr(dados(1), "="))
                r(1) = Right(dados(3), dados(3).Length - InStr(dados(3), "="))
            Case Else
                r(0) = Right(dados(6), dados(6).Length - InStr(dados(6), "="))
                r(1) = Right(dados(4), dados(4).Length - InStr(dados(4), "="))
                r(2) = Right(dados(3), dados(3).Length - InStr(dados(3), "="))
                r(3) = Right(dados(2), dados(2).Length - InStr(dados(2), "="))
        End Select

        StreamRead.Close()
        Return r

    End Function

    Function DiaSemana(ByVal Dia As Integer) As String
        Dim r As String = ""

        Select Case Dia
            Case 0
                r = "Domingo"
            Case 1
                r = "Segunda"
            Case 2
                r = "Terça"
            Case 3
                r = "Quarta"
            Case 4
                r = "Quinta"
            Case 5
                r = "Sexta"
            Case 6
                r = "Sábado"

        End Select

        Return r
    End Function

    Function DiasUteis(ByVal data As Date, ByVal dias As Integer, ByVal sabado As Boolean) As Date
        Dim conn As New Conexao
        Dim x As Integer
        For x = 0 To dias - 1


            If IsNumeric(conn.AbrirExato("SELECT ferCodigo FROM tabFeriados WHERE Month(ferData) = " + data.Month.ToString + " AND day (ferData) =  " + data.Day.ToString)) Then
                x += -1
            Else
                If data.DayOfWeek = DayOfWeek.Saturday And sabado = True Then
                    x += -1
                End If
                If data.DayOfWeek = DayOfWeek.Sunday Then
                    x += -1
                End If

            End If

            data = DateAdd("d", 1, data)

        Next
        Return DateAdd("d", -1, data)
    End Function
    Function Info(ByVal Titulo As String, ByVal Mensagem As String) As String
        Return "<td style="" width:23px""><div style=""background-image:url(/imgs/btInfo.png);background-repeat:no-repeat; width:23px; height:23px"" onmouseover=""pop('" + Mensagem + "','lightgreen','" + Titulo + "')"" onmouseout=""kill()""></div></td>"

    End Function

    Function RemoveAcentos(ByVal strTexto As String) As String
        Dim strComAcentos As String
        Dim strSemAcentos As String
        Dim strResultado As String
        'Conjunto de Caracteres com acentos  
        strComAcentos = "ÁÍÓÚÉÄÏÖÜËÀÌÒÙÈÃÕÂÎÔÛÊáíóúéäïöüëàìòùèãõâîôûêÇç´"
        'Conjunto de Caracteres sem acentos   
        strSemAcentos = "AIOUEAIOUEAIOUEAOAIOUEaioueaioueaioueaoaioueCc'"
        Dim intCont As Integer = 0
        strResultado = strTexto
        Do While intCont < Len(strComAcentos)
            intCont = intCont + 1
            strResultado = Replace(strResultado, Mid(strComAcentos, intCont, 1), Mid(strSemAcentos, intCont, 1))
        Loop
        RemoveAcentos = strResultado
    End Function







    'CONVERTE HORA PARA DECIMAL
    Function cDecimal(ByVal hora As Date) As Decimal
        Dim n As Decimal = 0
        n = (hora.Second / 60) + hora.Minute
        n = n / 60 + hora.Hour
        Return n
    End Function

    'CONVERTE DECIMAL PARA HORA
    Function cHour(ByVal i As Decimal) As String
        Dim h As String = ""
        Dim x As Integer = Fix(i)
        h = x.ToString + ":" 'Hora
        h += Fix((i - x) * 60).ToString + ":" 'Minutos
        i = (i - x) * 60
        h += (+Fix((i - Fix(i)) * 60)).ToString
        Return h
    End Function

    Function FindControlPage(ByVal root As Control, ByVal id As String) As Control
        If root.ID = id Then
            Return root
        End If

        For Each c As Control In root.Controls
            Dim t As Control = FindControlPage(c, id)
            If Not t Is Nothing Then
                Return t
            End If
        Next

        Return Nothing
    End Function

End Class
