#Region "namespaces"
' Add namespaces here
Imports Microsoft.SqlServer.Management.Smo
Imports Microsoft.SqlServer.Management.Common

#End Region

Public Class Form1
#Region "declarations"
    'Declare variables here
    Dim connInfo As SqlConnectionInfo
    Dim svrConn As ServerConnection
    Dim svr As Server
    Dim db As Database

#End Region

#Region "Connect to server"
    Private Sub connectButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles connectButton.Click
        'Add code to connect here
        connInfo = New SqlConnectionInfo(serverText.Text)
        connInfo.ApplicationName = "SMO Application"
        connInfo.EncryptConnection = encryptBox.Checked
        svrConn = New ServerConnection(connInfo)
        svr = New Server(svrConn)

        DisplayServerInfo()
    End Sub
#End Region

#Region "Display Server Information"

    Private Sub DisplayServerInfo()
        'Add code to display server version here
        serverVersionLabel.Text = svr.Information.Product & _
               " " & svr.Information.VersionString
        databasesCombo.Items.Clear()
        'Add code to list server databases here
        For Each dbase As Database In svr.Databases
            databasesCombo.Items.Add(dbase.Name)
        Next
        databasesCombo.SelectedIndex = 0
    End Sub
    Private Sub databasesCombo_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles databasesCombo.SelectedIndexChanged
        'Add code to display tables in selected database here
        db = svr.Databases(databasesCombo.Text)
        tablesList.Items.Clear()
        For Each tbl As Table In db.Tables
            tablesList.Items.Add(tbl.Schema & "." & tbl.Name)
        Next

    End Sub
#End Region

#Region "Create table"
    Private Sub addTableButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles addTableButton.Click
        Dim tableName As String
        Dim schemaName As String
        Dim tableDetails() As String
        If columnsGrid.Rows.Count < 2 Then
            MessageBox.Show("Please specify column details")
        Else
            If tableNameText.Text.Contains(".") Then
                tableDetails = tableNameText.Text.Split(Char.Parse("."))
            Else
                ReDim tableDetails(1)
                tableDetails(0) = "dbo"
                tableDetails(1) = tableNameText.Text
            End If
            schemaName = tableDetails(0)
            tableName = tableDetails(1)

            Dim tableExists As Boolean = True
            'Check to see if table exists
            tableExists = db.Tables.Contains(tableName, schemaName)

            If tableExists Then
                MessageBox.Show("Table Already Exists")
            Else
                'Declare table and column variables here
                Dim tbl As New Table(db, tableName, schemaName)
                Dim col As Column

                Dim i As Integer

                For i = 0 To columnsGrid.Rows.Count - 2
                    Dim colName As String = columnsGrid.Rows(i).Cells(0).Value.ToString()
                    Dim colType As String = columnsGrid.Rows(i).Cells(1).Value.ToString()
                    'Create column and add it to the table here
                    col = New Column(tbl, colName)
                    Select Case colType
                        Case "integer"
                            col.DataType = DataType.Int
                        Case "nvarchar"
                            col.DataType = DataType.NVarChar(50)
                        Case "money"
                            col.DataType = DataType.Money
                        Case Else
                            col.DataType = DataType.NVarCharMax
                    End Select
                    tbl.Columns.Add(col)

                Next
                'Create the table here
                tbl.Create()

                MessageBox.Show("Table Created")
                tablesList.Items.Clear()
                For Each t As Table In db.Tables
                    tablesList.Items.Add(t.Schema & "." & t.Name)
                Next

            End If
        End If
    End Sub
#End Region

#Region "Modify database objects"


    Private Sub alterTableButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles alterTableButton.Click
        Dim tableName As String
        Dim schemaName As String
        Dim tableDetails() As String
        tableDetails = tablesList.SelectedItem.ToString().Split(Char.Parse("."))
        schemaName = tableDetails(0)
        tableName = tableDetails(1)
        Dim tableExists As Boolean = False
        Dim columnExists As Boolean = False

        'Declare table and column variables here
        Dim tbl As Table
        Dim col As Column

        'Verify the table exists here
        tableExists = db.Tables.Contains(tableName, schemaName)

        If tableExists Then
            'Get the table here
            tbl = db.Tables(tableName, schemaName)

            Dim i As Integer

            For i = 0 To columnsGrid.Rows.Count - 2
                Dim colName As String = columnsGrid.Rows(i).Cells(0).Value.ToString()
                Dim colType As String = columnsGrid.Rows(i).Cells(1).Value.ToString()

                'Get specified data type here
                Dim specifiedType As DataType
                Select Case colType
                    Case "integer"
                        specifiedType = DataType.Int
                    Case "nvarchar"
                        specifiedType = DataType.NVarChar(50)
                    Case "money"
                        specifiedType = DataType.Money
                    Case Else
                        specifiedType = DataType.NVarCharMax
                End Select

                'Check column exists here
                columnExists = tbl.Columns.Contains(colName)

                If columnExists Then
                    'Update data type here
                    tbl.Columns(colName).DataType = specifiedType

                Else
                    'Add the column to the table here
                    col = New Column(tbl, colName, specifiedType)
                    tbl.Columns.Add(col)
                End If

            Next
            'Alter the table here
            tbl.Alter()

            MessageBox.Show("The table has been altered")

        Else
            MessageBox.Show("Table does not exist")
        End If
    End Sub

    Private Sub dropTableButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles dropTableButton.Click
        Dim tableName As String
        Dim schemaName As String
        Dim tableDetails() As String
        tableDetails = tablesList.SelectedItem.ToString().Split(Char.Parse("."))
        schemaName = tableDetails(0)
        tableName = tableDetails(1)
        Dim tableExists As Boolean = False
        'Verify the table exists here
        tableExists = db.Tables.Contains(tableName, schemaName)
        If tableExists Then
            Dim result As DialogResult
            result = MessageBox.Show("Are you sure you want to drop " _
                & tablesList.SelectedItem.ToString() & "?", _
                "Drop Table", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If result = Windows.Forms.DialogResult.Yes Then

                'Add code to drop the selected table here
                db.Tables(tableName, schemaName).Drop()

                MessageBox.Show("Table dropped successfully")
                tablesList.Items.Clear()
                For Each t As Table In db.Tables
                    tablesList.Items.Add(t.Schema & "." & t.Name)
                Next
            End If

        Else
            MessageBox.Show("Table does not exist")
        End If

    End Sub
#End Region

End Class
