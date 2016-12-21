Imports System.Data.SqlClient
Imports System.Text
Imports System.Configuration
Public Class batchUpdateForm
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
    Friend WithEvents updateDataButton As System.Windows.Forms.Button
    Friend WithEvents productGrid As System.Windows.Forms.DataGridView
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents batchSizeTextBox As System.Windows.Forms.TextBox

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerNonUserCode()> Private Sub InitializeComponent()
        Me.getDataButton = New System.Windows.Forms.Button
        Me.updateDataButton = New System.Windows.Forms.Button
        Me.productGrid = New System.Windows.Forms.DataGridView
        Me.Label1 = New System.Windows.Forms.Label
        Me.batchSizeTextBox = New System.Windows.Forms.TextBox
        Me.SuspendLayout()
        '
        'getDataButton
        '
        Me.getDataButton.Location = New System.Drawing.Point(9, 20)
        Me.getDataButton.Name = "getDataButton"
        Me.getDataButton.TabIndex = 0
        Me.getDataButton.Text = "Get Data"
        '
        'updateDataButton
        '
        Me.updateDataButton.Location = New System.Drawing.Point(91, 20)
        Me.updateDataButton.Name = "updateDataButton"
        Me.updateDataButton.TabIndex = 1
        Me.updateDataButton.Text = "Update Data"
        '
        'productGrid
        '
        Me.productGrid.EditMode = DataGridViewEditMode.EditOnEnter
        Me.productGrid.Location = New System.Drawing.Point(9, 50)
        Me.productGrid.Name = "productGrid"
        Me.productGrid.Size = New System.Drawing.Size(303, 211)
        Me.productGrid.TabIndex = 2
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(173, 25)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 12)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Batch Size:"
        '
        'batchSizeTextBox
        '
        Me.batchSizeTextBox.Location = New System.Drawing.Point(233, 22)
        Me.batchSizeTextBox.Name = "batchSizeTextBox"
        Me.batchSizeTextBox.Size = New System.Drawing.Size(36, 20)
        Me.batchSizeTextBox.TabIndex = 4
        Me.batchSizeTextBox.Text = "1"
        '
        'batchUpdateForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(318, 273)
        Me.Controls.Add(Me.batchSizeTextBox)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.productGrid)
        Me.Controls.Add(Me.updateDataButton)
        Me.Controls.Add(Me.getDataButton)
        Me.Name = "batchUpdateForm"
        Me.Text = "Batch Updates"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend Shared ReadOnly Property GetInstance() As batchUpdateForm
        Get
            If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                SyncLock m_SyncObject
                    If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                        m_DefaultInstance = New batchUpdateForm
                    End If
                End SyncLock
            End If
            Return m_DefaultInstance
        End Get
    End Property

    Private Shared m_DefaultInstance As batchUpdateForm
    Private Shared m_SyncObject As New Object
#End Region
    Dim conn As New SqlConnection(ConfigurationSettings.ConnectionStrings("AWConnectionString").ConnectionString)
    Dim dAdapt As New SqlDataAdapter("SELECT ProductID, Name, ListPrice FROM Production.Product", conn)
    Dim dSet As New DataSet()
    Dim logString As New StringBuilder("")
    Private Sub batchUpdateForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        AddHandler dAdapt.RowUpdating, AddressOf OnRowUpdating
        AddHandler dAdapt.RowUpdated, AddressOf OnRowUpdated
    End Sub
    Private Sub getDataButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles getDataButton.Click
        dAdapt.Fill(dSet, "Product")
        productGrid.DataSource = dSet.Tables("Product")
    End Sub

    Private Sub updateDataButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles updateDataButton.Click
        Dim cb As New SqlCommandBuilder(dAdapt)
        logString.Remove(0, logString.Length)

        ' Enable batching by setting batch size != 1.
        dAdapt.UpdateBatchSize = Integer.Parse(batchSizeTextBox.Text)

        ' Execute the update.
        dAdapt.Update(dSet.Tables("Product"))

        MessageBox.Show(logString.ToString())

    End Sub


    'handler for the RowUpdating event
    Sub OnRowUpdating(ByVal sender As Object, ByVal e As SqlRowUpdatingEventArgs)
        logString.AppendLine("Starting row update")
    End Sub

    ' handler for RowUpdated event
    Sub OnRowUpdated(ByVal sender As Object, ByVal e As SqlRowUpdatedEventArgs)
        logString.AppendLine("Completed row update")
    End Sub

End Class
