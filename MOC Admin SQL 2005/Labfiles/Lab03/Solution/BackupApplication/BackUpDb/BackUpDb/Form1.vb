'##### Add imports statements here #####
Imports Microsoft.SqlServer.Management.Smo
Imports Microsoft.SqlServer.Management.Common


Public Class Form1

    '##### Add variable declarations here #####
    Dim myServer As New Server()
    Dim conn As ServerConnection


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '##### Add connection code here #####
        conn = myServer.ConnectionContext
        conn.ServerInstance = "localhost"
        conn.Connect()


        '##### Add list database code here #####
        Dim db As Database
        For Each db In myServer.Databases
            DatabaseList.Items.Add(db.Name)
        Next


    End Sub

    Private Sub BackupButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BackupButton.Click
        ' If no database is selected, exit this event handler
        If DatabaseList.SelectedIndex = -1 Then Exit Sub

        '##### Add backup code here #####
        Dim dbName As String = DatabaseList.SelectedItem.ToString
        Dim MyBackup As New Backup

        MyBackup.Action = BackupActionType.Database
        MyBackup.BackupSetName = dbName & "Backup"
        MyBackup.Database = dbName
        MyBackup.DeviceType = DeviceType.File
        MyBackup.Devices.Add("C:\Program Files\Microsoft " _
          & "Learning\2733\Labfiles\Lab03\Starter\" _
          & dbName & ".bak")
        MyBackup.SqlBackup(myServer)
        MessageBox.Show(dbName & " backed up")


    End Sub
End Class
