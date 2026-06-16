Imports Microsoft.VisualBasic
Imports System.Data

Public Class Funcoes
    Dim conn As New Conexao

    Function DiaSemana(ByVal Dia As Integer) As String
        Dim r As String = ""

        Select Case Dia
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
            Case 7
                r = "Domingo"

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
