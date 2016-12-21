#Region "namespaces"
' Add namespaces here


#End Region

Public Class Form1
#Region "declarations"
    'Declare variables here


#End Region

#Region "Connect to server"
    Private Sub connectButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles connectButton.Click
        'Add code to connect here


        DisplayServerInfo()
    End Sub
#End Region

#Region "Display Server Information"

    Private Sub DisplayServerInfo()
        'Add code to display server version here


        databasesCombo.Items.Clear()
        'Add code to list server databases here


        databasesCombo.SelectedIndex = 0
    End Sub
    Private Sub databasesCombo_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles databasesCombo.SelectedIndexChanged
        'Add code to display tables in selected database here


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


            If tableExists Then
                MessageBox.Show("Table Already Exists")
            Else
                'Declare table and column variables here
                

                Dim i As Integer

                For i = 0 To columnsGrid.Rows.Count - 2
                    Dim colName As String = columnsGrid.Rows(i).Cells(0).Value.ToString()
                    Dim colType As String = columnsGrid.Rows(i).Cells(1).Value.ToString()
                    'Create column and add it to the table here
                    

                Next
                'Create the table here


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
        

        'Verify the table exists here


        If tableExists Then
            'Get the table here


            Dim i As Integer

            For i = 0 To columnsGrid.Rows.Count - 2
                Dim colName As String = columnsGrid.Rows(i).Cells(0).Value.ToString()
                Dim colType As String = columnsGrid.Rows(i).Cells(1).Value.ToString()

                'Get specified data type here


                'Check column exists here


                If columnExists Then
                    'Update data type here


                Else
                    'Add the column to the table here

                End If

            Next
            'Alter the table here


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


        If tableExists Then
            Dim result As DialogResult
            result = MessageBox.Show("Are you sure you want to drop " _
                & tablesList.SelectedItem.ToString() & "?", _
                "Drop Table", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If result = Windows.Forms.DialogResult.Yes Then

                'Add code to drop the selected table here


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
