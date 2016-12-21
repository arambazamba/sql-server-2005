Imports System.Data.SqlClient
Imports System.Configuration
Public Class AsyncForm
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
    Friend WithEvents getDataButton As System.Windows.Forms.Button
    Friend WithEvents productListBox As System.Windows.Forms.ListBox
    Friend WithEvents statusLabel As System.Windows.Forms.Label

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerNonUserCode()> Private Sub InitializeComponent()
        Me.getDataButton = New System.Windows.Forms.Button
        Me.statusLabel = New System.Windows.Forms.Label
        Me.productListBox = New System.Windows.Forms.ListBox
        Me.SuspendLayout()
        '
        'getDataButton
        '
        Me.getDataButton.Location = New System.Drawing.Point(103, 27)
        Me.getDataButton.Name = "getDataButton"
        Me.getDataButton.TabIndex = 0
        Me.getDataButton.Text = "Get Data"
        '
        'statusLabel
        '
        Me.statusLabel.Location = New System.Drawing.Point(102, 57)
        Me.statusLabel.Name = "statusLabel"
        Me.statusLabel.Size = New System.Drawing.Size(88, 23)
        Me.statusLabel.TabIndex = 1
        Me.statusLabel.Text = "Not connected"
        '
        'productListBox
        '
        Me.productListBox.Location = New System.Drawing.Point(82, 87)
        Me.productListBox.Name = "productListBox"
        Me.productListBox.Size = New System.Drawing.Size(123, 160)
        Me.productListBox.TabIndex = 2
        '
        'AsyncForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.productListBox)
        Me.Controls.Add(Me.statusLabel)
        Me.Controls.Add(Me.getDataButton)
        Me.Name = "AsyncForm"
        Me.Text = "Asynchronous ADO.NET"
        Me.ResumeLayout(False)

    End Sub

    Friend Shared ReadOnly Property GetInstance() As AsyncForm
        Get
            If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                SyncLock m_SyncObject
                    If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                        m_DefaultInstance = New AsyncForm
                    End If
                End SyncLock
            End If
            Return m_DefaultInstance
        End Get
    End Property

    Private Shared m_DefaultInstance As AsyncForm
    Private Shared m_SyncObject As New Object

#End Region
    Private cmd As SqlCommand
    Dim conn As SqlConnection
    Delegate Sub PopulateList(ByVal dReader As SqlDataReader)
    Private Sub AsyncForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        conn = New SqlConnection(ConfigurationSettings.ConnectionStrings("AWConnectionString").ConnectionString)
    End Sub
    Private Sub getDataButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles getDataButton.Click
        'Use a command to retrieve a DataReader asynchronously
        cmd = New SqlCommand("SELECT Name FROM Production.Product", conn)
        conn.Open()
        statusLabel.Text = "Connected"
        cmd.BeginExecuteReader(New AsyncCallback(AddressOf HandleAsyncCallBack), Nothing)
        'The call does not block, so this line can be processed
        statusLabel.Text = "Retrieving data"
    End Sub

    Public Sub HandleAsyncCallBack(ByVal result As IAsyncResult)
        'Callback function for asynchronous method call
        Dim dRead As SqlDataReader
        Try
            dRead = cmd.EndExecuteReader(result)
            Me.Invoke(New PopulateList(AddressOf ListProducts), dRead)
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Public Sub ListProducts(ByVal dReader As SqlDataReader)
        'Utility function to display the results
        While dReader.Read
            productListBox.Items.Add(dReader("Name"))
        End While
        dReader.Close()
        conn.Close()
        statusLabel.Text = "Not connected"
    End Sub




End Class
