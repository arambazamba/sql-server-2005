'##### Add imports statements here #####


Public Class Form1

    '##### Add variable declarations here #####


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '##### Add connection code here #####


        '##### Add list database code here #####


    End Sub

    Private Sub BackupButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BackupButton.Click
        ' If no database is selected, exit this event handler
	If DatabaseList.SelectedIndex = -1 Then Exit Sub

        '##### Add backup code here #####


    End Sub
End Class
