'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version:2.0.40426.20
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Namespace My
    
    Partial Class MyApplication
        Inherits System.Windows.Forms.WindowsFormsApplicationBase
        
        Public Sub New()
            MyBase.New(System.Windows.Forms.AuthenticationMode.Windows)
            Me.IsSingleInstance = false
            Me.EnableVisualStyles = false
            Me.ShutDownStyle = System.Windows.Forms.ShutdownMode.AfterMainFormCloses
        End Sub
        
        Protected Overrides Sub OnCreateMainForm()
            Me.MainForm = My.Forms.snapshotForm
        End Sub
    End Class
End Namespace
