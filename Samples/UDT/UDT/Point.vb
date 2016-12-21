Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlTypes
Imports Microsoft.SqlServer.Server

<Serializable()> _
<Microsoft.SqlServer.Server.SqlUserDefinedType(Format.Native)> _
Public Structure Point
    Implements INullable

    Private is_Null As Boolean

    Public ReadOnly Property IsNull() As Boolean _
    Implements INullable.IsNull
        Get
            Return is_Null
        End Get
    End Property
    Public Shared ReadOnly Property Null() As Point
        Get
            Dim pt As New Point
            pt.is_Null = True
            Return (pt)
        End Get
    End Property

    Private m_x, m_y As Integer

    Public Shared Function Parse(ByVal s As SqlString) As Point
        If s.IsNull Then
            Return Point.Null
        Else
            Dim pt As New Point()
            Dim str As String = Convert.ToString(s)
            Dim xy() As String = str.Split(CType(":", Char))
            pt.m_x = CInt(xy(0))
            pt.m_y = CInt(xy(1))
            Return (pt)
        End If
    End Function
    Public Overrides Function ToString() As String
        If IsNull Then
            Return "NULL"
        Else
            Return m_x & ":" & m_y
        End If
    End Function

    Public Property X() As Decimal
        Get
            Return m_x
        End Get
        Set(ByVal Value As Decimal)
            m_x = Value
        End Set
    End Property
    Public Property Y() As Decimal
        Get
            Return m_y
        End Get
        Set(ByVal Value As Decimal)
            m_y = Value
        End Set
    End Property
End Structure

