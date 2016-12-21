Partial Public Class Form1
    Inherits System.Windows.Forms.Form

    <System.Diagnostics.DebuggerNonUserCode()> _
    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

    End Sub

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.Label1 = New System.Windows.Forms.Label
        Me.serverText = New System.Windows.Forms.TextBox
        Me.encryptBox = New System.Windows.Forms.CheckBox
        Me.connectButton = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.databasesCombo = New System.Windows.Forms.ComboBox
        Me.tablesList = New System.Windows.Forms.ListBox
        Me.columnsGrid = New System.Windows.Forms.DataGridView
        Me.Label3 = New System.Windows.Forms.Label
        Me.addTableButton = New System.Windows.Forms.Button
        Me.tableNameText = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.serverVersionLabel = New System.Windows.Forms.Label
        Me.alterTableButton = New System.Windows.Forms.Button
        Me.dropTableButton = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(44, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 14)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Server:"
        '
        'serverText
        '
        Me.serverText.Location = New System.Drawing.Point(107, 13)
        Me.serverText.Name = "serverText"
        Me.serverText.TabIndex = 1
        Me.serverText.Text = "localhost"
        '
        'encryptBox
        '
        Me.encryptBox.AutoSize = True
        Me.encryptBox.Checked = True
        Me.encryptBox.CheckState = System.Windows.Forms.CheckState.Checked
        Me.encryptBox.Location = New System.Drawing.Point(213, 13)
        Me.encryptBox.Name = "encryptBox"
        Me.encryptBox.TabIndex = 2
        Me.encryptBox.Text = "Encrypt?"
        '
        'connectButton
        '
        Me.connectButton.Location = New System.Drawing.Point(311, 13)
        Me.connectButton.Name = "connectButton"
        Me.connectButton.TabIndex = 3
        Me.connectButton.Text = "Connect"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(43, 86)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 14)
        Me.Label2.TabIndex = 4
        Me.Label2.Text = "Database:"
        '
        'databasesCombo
        '
        Me.databasesCombo.FormattingEnabled = True
        Me.databasesCombo.Location = New System.Drawing.Point(106, 83)
        Me.databasesCombo.Name = "databasesCombo"
        Me.databasesCombo.Size = New System.Drawing.Size(282, 21)
        Me.databasesCombo.TabIndex = 5
        '
        'tablesList
        '
        Me.tablesList.FormattingEnabled = True
        Me.tablesList.Location = New System.Drawing.Point(106, 123)
        Me.tablesList.Name = "tablesList"
        Me.tablesList.Size = New System.Drawing.Size(281, 160)
        Me.tablesList.TabIndex = 6
        '
        'columnsGrid
        '
        DataGridViewTextBoxColumn1.DefaultCellStyle = DataGridViewCellStyle1
        DataGridViewTextBoxColumn1.HeaderText = "Name"
        DataGridViewTextBoxColumn1.Name = "ColumnName"
        DataGridViewTextBoxColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        DataGridViewTextBoxColumn2.DefaultCellStyle = DataGridViewCellStyle1
        DataGridViewTextBoxColumn2.HeaderText = "DataType"
        DataGridViewTextBoxColumn2.Name = "DataType"
        DataGridViewTextBoxColumn2.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.columnsGrid.Columns.Add(DataGridViewTextBoxColumn1)
        Me.columnsGrid.Columns.Add(DataGridViewTextBoxColumn2)
        Me.columnsGrid.Location = New System.Drawing.Point(107, 350)
        Me.columnsGrid.Name = "columnsGrid"
        Me.columnsGrid.Size = New System.Drawing.Size(279, 86)
        Me.columnsGrid.TabIndex = 7
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(43, 123)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(41, 14)
        Me.Label3.TabIndex = 8
        Me.Label3.Text = "Tables:"
        '
        'addTableButton
        '
        Me.addTableButton.Location = New System.Drawing.Point(107, 320)
        Me.addTableButton.Name = "addTableButton"
        Me.addTableButton.TabIndex = 9
        Me.addTableButton.Text = "Add Table"
        '
        'tableNameText
        '
        Me.tableNameText.Location = New System.Drawing.Point(189, 323)
        Me.tableNameText.Name = "tableNameText"
        Me.tableNameText.Size = New System.Drawing.Size(196, 20)
        Me.tableNameText.TabIndex = 10
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(43, 350)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(52, 14)
        Me.Label4.TabIndex = 11
        Me.Label4.Text = "Columns:"
        '
        'serverVersionLabel
        '
        Me.serverVersionLabel.AutoSize = True
        Me.serverVersionLabel.Location = New System.Drawing.Point(107, 53)
        Me.serverVersionLabel.Name = "serverVersionLabel"
        Me.serverVersionLabel.Size = New System.Drawing.Size(77, 14)
        Me.serverVersionLabel.TabIndex = 12
        Me.serverVersionLabel.Text = "Server version"
        '
        'alterTableButton
        '
        Me.alterTableButton.Location = New System.Drawing.Point(151, 443)
        Me.alterTableButton.Name = "alterTableButton"
        Me.alterTableButton.TabIndex = 13
        Me.alterTableButton.Text = "Alter Table"
        '
        'dropTableButton
        '
        Me.dropTableButton.Location = New System.Drawing.Point(259, 443)
        Me.dropTableButton.Name = "dropTableButton"
        Me.dropTableButton.TabIndex = 14
        Me.dropTableButton.Text = "Drop Table"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(512, 476)
        Me.Controls.Add(Me.dropTableButton)
        Me.Controls.Add(Me.alterTableButton)
        Me.Controls.Add(Me.serverVersionLabel)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.tableNameText)
        Me.Controls.Add(Me.addTableButton)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.columnsGrid)
        Me.Controls.Add(Me.tablesList)
        Me.Controls.Add(Me.databasesCombo)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.connectButton)
        Me.Controls.Add(Me.encryptBox)
        Me.Controls.Add(Me.serverText)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "SMO Application"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents serverText As System.Windows.Forms.TextBox
    Friend WithEvents encryptBox As System.Windows.Forms.CheckBox
    Friend WithEvents connectButton As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents databasesCombo As System.Windows.Forms.ComboBox
    Friend WithEvents tablesList As System.Windows.Forms.ListBox
    Friend WithEvents columnsGrid As System.Windows.Forms.DataGridView
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents addTableButton As System.Windows.Forms.Button
    Friend WithEvents tableNameText As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents serverVersionLabel As System.Windows.Forms.Label
    Friend WithEvents alterTableButton As System.Windows.Forms.Button
    Friend WithEvents dropTableButton As System.Windows.Forms.Button

End Class
