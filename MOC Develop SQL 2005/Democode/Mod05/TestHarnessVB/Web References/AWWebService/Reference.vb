﻿'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version:2.0.40426.20
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Imports System
Imports System.ComponentModel
Imports System.Data
Imports System.Diagnostics
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Serialization

'
'This source code was auto-generated by Microsoft.VSDesigner, Version 2.0.40426.20.
'
Namespace AWWebService
    
    '<remarks/>
    <System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code"),  _
     System.Web.Services.WebServiceBindingAttribute(Name:="AWProductionSoap", [Namespace]:="http://AdventureWorks/")>  _
    Public Class AWProduction
        Inherits System.Web.Services.Protocols.SoapHttpClientProtocol
        
        '<remarks/>
        Public Sub New()
            MyBase.New
            Dim urlSetting As String = System.Configuration.ConfigurationSettings.AppSettings("TestHarnessVB.AWWebService.AWProduction")
            If (Not (urlSetting) Is Nothing) Then
                Me.Url = String.Concat(urlSetting, "")
            Else
                Me.Url = "http://localhost/AdventureWorks/Production"
            End If
            Me.ConformanceClaims = System.Web.Services.WsiClaims.BP10
        End Sub
        
        '<remarks/>
        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://AdventureWorks/GetProducts", RequestNamespace:="http://AdventureWorks/", ResponseNamespace:="http://AdventureWorks/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
        Public Function GetProducts() As System.Data.DataSet
            Dim results() As Object = Me.Invoke("GetProducts", New Object(-1) {})
            Return CType(results(0),System.Data.DataSet)
        End Function
        
        '<remarks/>
        Public Function BeginGetProducts(ByVal callback As System.AsyncCallback, ByVal asyncState As Object) As System.IAsyncResult
            Return Me.BeginInvoke("GetProducts", New Object(-1) {}, callback, asyncState)
        End Function
        
        '<remarks/>
        Public Function EndGetProducts(ByVal asyncResult As System.IAsyncResult) As System.Data.DataSet
            Dim results() As Object = Me.EndInvoke(asyncResult)
            Return CType(results(0),System.Data.DataSet)
        End Function
    End Class
End Namespace