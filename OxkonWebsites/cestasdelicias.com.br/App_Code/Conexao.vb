Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.OleDb

Public Class Conexao
    Dim conn As New OleDbConnection

    Function isNull(ByVal value As String) As String

        Try
            If value.ToString = String.Empty Then
                value = ""
            End If
        Catch ex As Exception
            value = ""
        End Try

        If IsDate(value) Then
            value = CDate(value).ToString("dd/MM/yyyy")
        End If


        Return value.ToString
    End Function

    Function isNullInt(ByVal value As String) As Decimal

        If Not IsNumeric(value) Then
            value = 0
        Else
            value = CDec(value)
        End If

        Return value
    End Function

    Function getDataSet(ByVal SQL As String) As DataSet

        conn.ConnectionString = System.Configuration.ConfigurationManager.AppSettings("sConn")
        Dim da As New OleDbDataAdapter(SQL, conn)
        Dim ds As New DataSet
        da.Fill(ds)
        'Fechar()

        Return ds

    End Function

    Function getDataReader(ByVal SQL As String) As OleDbDataReader

        'Fechar()
        conn.ConnectionString = System.Configuration.ConfigurationManager.AppSettings("sConn")
        Dim cmd As New OleDbCommand(SQL, conn)
        conn.Open()
        Dim dr As OleDbDataReader
        dr = cmd.ExecuteReader
        Return dr

        'Deve usar o Fechar após usá-lo

    End Function

    Function getDataTable(ByVal SQL As String) As DataTable


        Dim da As OleDbDataAdapter
        Dim dt As DataTable
        Fechar()

        conn.ConnectionString = System.Configuration.ConfigurationManager.AppSettings("sConn")
        conn.Open()

        da = New OleDbDataAdapter(SQL, conn)
        dt = New DataTable

        Dim result As String = ""

        Try
            da.Fill(dt)
        Catch ex As Exception

        Finally
            Fechar()
        End Try

        Return dt


    End Function

    Function ExecutaSQL(ByVal SQL As String) As String


        conn.ConnectionString = System.Configuration.ConfigurationManager.AppSettings("sConn")
        conn.Open()
        Dim status As String = ""
        Try
            Dim comando As OleDbCommand = New OleDbCommand(SQL, conn)
            comando.ExecuteNonQuery()
        Catch ex As Exception
            status = "Erro: " + ex.Message
        Finally
            Fechar()
        End Try

        Return status

    End Function

    Function AbrirExato(ByVal SQL As String) As String

        Dim Coluna As String = Mid(SQL, 8, InStr(1, SQL, "FROM") - 9)

        Replace(SQL, "SELECT", "SELECT TOP 1")

        Dim result As String = ""

        Try

            Dim dr As OleDbDataReader = getDataReader(SQL)
            dr.Read()
            result = dr.Item(0).ToString
            Fechar()
        Catch ex As Exception
            Fechar()
            result = "Erro: " + ex.Message
        Finally
            Fechar()
        End Try

        Return result


    End Function
    Function formatBD(ByVal value As String, ByVal tipo As String) As String

        Select Case tipo
            Case "S"
                Try
                    If value.ToString = String.Empty Then
                        value = "null"
                    Else
                        value = "'" + value + "'"
                    End If
                Catch ex As Exception
                    value = "null"
                End Try
            Case "I"
                value = Replace(value, ".", "")
                value = Replace(value, ",", ".")
                Try
                    If value.ToString = String.Empty Or Not IsNumeric(value) Then
                        value = "null"
                    End If
                Catch ex As Exception
                    value = "null"
                End Try

            Case "D"
                If IsDate(value) Then
                    value = "'" + CDate(value).ToString("dd/MM/yyyy HH:mm:ss") + "'"
                Else
                    value = "null"
                End If
        End Select

        Return value.ToString
    End Function

    Public Sub Fechar()

        conn.Close()
        'conn = Nothing
    End Sub


End Class
