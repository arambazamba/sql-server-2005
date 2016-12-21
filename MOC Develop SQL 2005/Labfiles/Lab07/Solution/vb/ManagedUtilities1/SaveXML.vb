Imports System
Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlServer
Imports System.Data.SqlTypes
Imports System.Xml


Partial Public Class StoredProcedures
    <SqlProcedure(Name:="SaveXML")> _
Public Shared Sub SaveXML(ByVal XmlData As SqlXml, _
        ByVal FileName As SqlString)

        Dim xmlDoc As New XmlDocument()
        xmlDoc.LoadXml(XmlData.Value)
        xmlDoc.Save(FileName.Value)

    End Sub
End Class
