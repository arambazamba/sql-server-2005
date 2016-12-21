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
        Me.DatabaseList = New System.Windows.Forms.ListBox
        Me.BackupButton = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'DatabaseList
        '
        Me.DatabaseList.FormattingEnabled = True
        Me.DatabaseList.Location = New System.Drawing.Point(13, 13)
        Me.DatabaseList.Name = "DatabaseList"
        Me.DatabaseList.Size = New System.Drawing.Size(121, 147)
        Me.DatabaseList.TabIndex = 0
        '
        'BackupButton
        '
        Me.BackupButton.Location = New System.Drawing.Point(143, 13)
        Me.BackupButton.Name = "BackupButton"
        Me.BackupButton.Size = New System.Drawing.Size(99, 31)
        Me.BackupButton.TabIndex = 1
        Me.BackupButton.Text = "Backup database"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(275, 182)
        Me.Controls.Add(Me.BackupButton)
        Me.Controls.Add(Me.DatabaseList)
        Me.Name = "Form1"
        Me.Text = "Backup Application"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents DatabaseList As System.Windows.Forms.ListBox
    Friend WithEvents BackupButton As System.Windows.Forms.Button



End Class
