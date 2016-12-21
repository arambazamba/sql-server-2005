Imports System
Imports System.Data.Sql
Imports System.Data.SqlTypes

Partial Public Class UserDefinedFunctions
    <SqlFunction(Name:="GetLongDate", _
             DataAccess:=DataAccessKind.None)> _
    Public Shared Function GetLongDate _
     (ByVal DateVal As SqlDateTime) As SqlString
        Return DateVal.Value.ToLongDateString()
    End Function
End Class
