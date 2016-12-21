Imports System
Imports System.Data.Sql
Imports System.Data.SqlTypes


Partial Public Class Utilities
    Public Shared Function GetOSVersion() As SqlString
        Return System.Environment.OSVersion.ToString()
    End Function
End Class

