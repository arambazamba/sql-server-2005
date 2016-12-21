Imports System.Data.SqlClient
Imports System.Configuration
Public Class snapshotForm
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
    Friend WithEvents updateButton As System.Windows.Forms.Button
    Friend WithEvents productListBox As System.Windows.Forms.ListBox
    Friend WithEvents commitButton As System.Windows.Forms.Button

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerNonUserCode()> Private Sub InitializeComponent()
        Me.updateButton = New System.Windows.Forms.Button
        Me.productListBox = New System.Windows.Forms.ListBox
        Me.commitButton = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'updateButton
        '
        Me.updateButton.Location = New System.Drawing.Point(29, 235)
        Me.updateButton.Name = "updateButton"
        Me.updateButton.Size = New System.Drawing.Size(105, 24)
        Me.updateButton.TabIndex = 0
        Me.updateButton.Text = "Update Product 1"
        '
        'productListBox
        '
        Me.productListBox.FormattingEnabled = True
        Me.productListBox.Location = New System.Drawing.Point(18, 8)
        Me.productListBox.Name = "productListBox"
        Me.productListBox.Size = New System.Drawing.Size(259, 212)
        Me.productListBox.TabIndex = 1
        '
        'commitButton
        '
        Me.commitButton.Location = New System.Drawing.Point(154, 235)
        Me.commitButton.Name = "commitButton"
        Me.commitButton.Size = New System.Drawing.Size(107, 23)
        Me.commitButton.TabIndex = 2
        Me.commitButton.Text = "Commit"
        '
        'snapshotForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.commitButton)
        Me.Controls.Add(Me.productListBox)
        Me.Controls.Add(Me.updateButton)
        Me.Name = "snapshotForm"
        Me.Text = "Snapshot Isolation"
        Me.ResumeLayout(False)

    End Sub

    Friend Shared ReadOnly Property GetInstance() As snapshotForm
        Get
            If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                SyncLock m_SyncObject
                    If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                        m_DefaultInstance = New snapshotForm
                    End If
                End SyncLock
            End If
            Return m_DefaultInstance
        End Get
    End Property

    Private Shared m_DefaultInstance As snapshotForm
    Private Shared m_SyncObject As New Object
#End Region
    Dim conn As New SqlConnection(ConfigurationSettings.ConnectionStrings("AWConnectionString").ConnectionString)
    Dim cmd As New SqlCommand()
    Dim tran As SqlTransaction
    Private Sub snapshotForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            conn.Open()
            'Start a transaction using snapshot isolation
            tran = conn.BeginTransaction(IsolationLevel.Snapshot)
            cmd.Connection = conn
            cmd.Transaction = tran
            RetrieveData()
        Catch Ex As Exception
            MessageBox.Show(Ex.Message)
        End Try
    End Sub
    Private Sub updateButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles updateButton.Click
        Try
            'update the data
            cmd.CommandText = "Update Production.Product SET ListPrice = ListPrice + 2 WHERE ProductID = 1"
            cmd.ExecuteNonQuery()
            RetrieveData()
        Catch Ex As Exception
            MessageBox.Show(Ex.Message)
        End Try
    End Sub
    Private Sub commitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles commitButton.Click
        Try
            'commit the transaction
            tran.Commit()
            conn.Close()
        Catch Ex As Exception
            MessageBox.Show(Ex.Message)
        End Try
    End Sub
    Public Sub RetrieveData()
        productListBox.Items.Clear()
        cmd.CommandText = "SELECT ProductID, Name, ListPrice FROM Production.Product WHERE ProductID < 10"
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        While reader.Read()
            productListBox.Items.Add(reader("Name").ToString & ": " & reader("ListPrice").ToString)
        End While
        reader.Close()
    End Sub
End Class
