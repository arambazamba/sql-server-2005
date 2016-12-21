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
        Me.viewSubs = New System.Windows.Forms.Button
        Me.createSubs = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'viewSubs
        '
        Me.viewSubs.Location = New System.Drawing.Point(22, 21)
        Me.viewSubs.Name = "viewSubs"
        Me.viewSubs.Size = New System.Drawing.Size(234, 27)
        Me.viewSubs.TabIndex = 0
        Me.viewSubs.Text = "View Subscriptions"
        '
        'createSubs
        '
        Me.createSubs.Location = New System.Drawing.Point(22, 67)
        Me.createSubs.Name = "createSubs"
        Me.createSubs.Size = New System.Drawing.Size(234, 28)
        Me.createSubs.TabIndex = 1
        Me.createSubs.Text = "Create Subscription"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(273, 117)
        Me.Controls.Add(Me.createSubs)
        Me.Controls.Add(Me.viewSubs)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents viewSubs As System.Windows.Forms.Button
    Friend WithEvents createSubs As System.Windows.Forms.Button

End Class
