Imports System.Data.SqlClient
Imports System.Configuration
Public Class notificationForm
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub
    Friend WithEvents productListBox As System.Windows.Forms.ListBox

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerNonUserCode()> Private Sub InitializeComponent()
        Me.productListBox = New System.Windows.Forms.ListBox
        Me.SuspendLayout()
        '
        'productListBox
        '
        Me.productListBox.Location = New System.Drawing.Point(15, 20)
        Me.productListBox.Name = "productListBox"
        Me.productListBox.Size = New System.Drawing.Size(256, 238)
        Me.productListBox.TabIndex = 0
        '
        'notificationForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.productListBox)
        Me.Name = "notificationForm"
        Me.Text = "Notifications"
        Me.ResumeLayout(False)

    End Sub

    Friend Shared ReadOnly Property GetInstance() As notificationForm
        Get
            If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                SyncLock m_SyncObject
                    If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                        m_DefaultInstance = New notificationForm
                    End If
                End SyncLock
            End If
            Return m_DefaultInstance
        End Get
    End Property

    Private Shared m_DefaultInstance As notificationForm
    Private Shared m_SyncObject As New Object
#End Region
    'Global declarations
    Dim conn As New SqlConnection(ConfigurationSettings.ConnectionStrings("AWConnectionString").ConnectionString)
    Dim cmd As New SqlCommand("SELECT ProductID, Name, ListPrice FROM Production.Product", conn)
    Dim dep As New SqlDependency(cmd)
    Delegate Sub PopulateList()
    Private Sub notificationForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Assign the event handler for the dependency's OnChanged event
        AddHandler dep.OnChanged, AddressOf OnDependencyChanged

        'Retrieve the initial data
        ListProducts()
    End Sub
    Sub OnDependencyChanged(ByVal sender As Object, ByVal e As SqlNotificationEventArgs)
        'Event handler for OnChanged event of Dependency
        Dim dR As DialogResult
        dR = MessageBox.Show("The data has changed. Refresh?", e.Info.ToString, MessageBoxButtons.YesNo, MessageBoxIcon.Question)
        If dR = Windows.Forms.DialogResult.Yes Then
            'Refresh the data
            Me.Invoke(New PopulateList(AddressOf ListProducts))
        End If
    End Sub
    Public Sub ListProducts()
        productListBox.Items.Clear()
        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        While reader.Read()
            productListBox.Items.Add(reader("Name").ToString & ": " & reader("ListPrice").ToString)
        End While
        conn.Close()
    End Sub

End Class
