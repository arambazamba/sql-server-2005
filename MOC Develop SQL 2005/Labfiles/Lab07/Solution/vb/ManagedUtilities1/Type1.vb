Imports System
Imports System.Data.Sql
Imports System.Data.SqlTypes

<Serializable()> _
<SqlUserDefinedType(Format.SerializedDataWithMetadata, MaxByteSize:=512)> _
Public Class Type1
    Implements INullable

    Public Overrides Function ToString() As String
        Dim s As String = "null"
        ' Put your code here
        Return s
    End Function

    Public ReadOnly Property IsNull() As Boolean Implements INullable.IsNull
        Get
            ' Put your code here
            Return True
        End Get
    End Property

    Public Shared ReadOnly Property Null As Type1
        Get
            Dim h As Type1 = New Type1
            Return h
        End Get
    End Property

    Public Shared Function Parse(ByVal s As SqlString) As Type1
        If s.IsNull Or s.Value.ToLower().Equals("null") Then
            Return Null
        End If

        Dim u As Type1 = New Type1
        ' Put your code here
        Return u
    End Function

    ' This is a place-holder method
    Public Shared Function Method1() As SqlString
        ' Put your code here
        Return new SqlString("Hello")
    End Function
End Class

