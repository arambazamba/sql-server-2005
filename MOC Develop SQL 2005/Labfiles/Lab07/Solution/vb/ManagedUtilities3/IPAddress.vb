Imports System
Imports System.Data.Sql
Imports System.Data.SqlTypes
Imports System.Text

<Serializable()> _
<SqlUserDefinedType(Format.SerializedDataWithMetadata, MaxByteSize:=512)> _
Public Structure IPAddress
    Implements INullable

    Private is_Null As Boolean
    Private m_a As Double
    Private m_b As Double
    Private m_c As Double
    Private m_d As Double


    Public Overrides Function ToString() As String
        If Me.IsNull Then

            Return "NULL"

        Else
            Return m_a & "." & m_b & "." & m_c & "." & m_d
        End If
    End Function

    Public ReadOnly Property IsNull() As Boolean Implements INullable.IsNull
        Get
            Return is_Null
        End Get
    End Property

    Public Shared ReadOnly Property Null() As IPAddress
        Get
            Dim ip As New IPAddress()
            ip.is_Null = True
            Return ip
        End Get
    End Property

    Public Shared Function Parse(ByVal s As SqlString) As IPAddress
        If s.IsNull Then
            Return IPAddress.Null
        Else
            Dim ip As New IPAddress()
            Dim str As String = Convert.ToString(s)
            Dim abcd() As String = str.Split(".".ToCharArray())
            ip.A = Double.Parse(abcd(0))
            ip.B = Double.Parse(abcd(1))
            ip.C = Double.Parse(abcd(2))
            ip.D = Double.Parse(abcd(3))
            Return ip
        End If
    End Function

    Public Property A() As Double
        Get
            Return m_a
        End Get
        Set(ByVal value As Double)
            m_a = value
        End Set
    End Property
    Public Property B() As Double
        Get
            Return m_b
        End Get
        Set(ByVal value As Double)
            m_b = value
        End Set
    End Property

    Public Property C() As Double
        Get
            Return m_c
        End Get
        Set(ByVal value As Double)
            m_c = value
        End Set
    End Property

    Public Property D() As Double
        Get
            Return m_d
        End Get
        Set(ByVal value As Double)
            m_d = value
        End Set
    End Property
    Public Function Ping() As String
        Return "Ping " + Me.ToString()
    End Function


End Structure

