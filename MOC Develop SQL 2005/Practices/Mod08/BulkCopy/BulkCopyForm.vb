Imports System.Data.SqlClient
Imports System.Configuration
Public Class bulkCopyForm
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
    Friend WithEvents copyDataButton As System.Windows.Forms.Button

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerNonUserCode()> Private Sub InitializeComponent()
        Me.copyDataButton = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'copyDataButton
        '
        Me.copyDataButton.Location = New System.Drawing.Point(104, 49)
        Me.copyDataButton.Name = "copyDataButton"
        Me.copyDataButton.TabIndex = 0
        Me.copyDataButton.Text = "Copy Data"
        '
        'bulkCopyForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 144)
        Me.Controls.Add(Me.copyDataButton)
        Me.Name = "bulkCopyForm"
        Me.Text = "Bulk Copy"
        Me.ResumeLayout(False)

    End Sub

    Friend Shared ReadOnly Property GetInstance() As bulkCopyForm
        Get
            If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                SyncLock m_SyncObject
                    If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                        m_DefaultInstance = New bulkCopyForm
                    End If
                End SyncLock
            End If
            Return m_DefaultInstance
        End Get
    End Property
    Private Shared m_DefaultInstance As bulkCopyForm
    Private Shared m_SyncObject As New Object

#End Region

    Private Sub bulkCopyForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Use a utility function to create the destination database for the sample
        CreateDestination()
    End Sub
    Private Sub copyDataButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles copyDataButton.Click
        ' Retrieve data from the source server.
        Dim sourceConn As New SqlConnection(ConfigurationSettings.ConnectionStrings("AWConnectionString").ConnectionString)

        Dim dA As New SqlDataAdapter("SELECT ProductID, Name, ListPrice FROM Production.Product", sourceConn)
        Dim ds As New DataSet()
        dA.Fill(ds, "Products")

        ' Connect to the destination server.
        Dim destConn As New SqlConnection("SERVER=localhost;DATABASE=AWProductsData;Integrated Security=TRUE")
        destConn.Open()

        'count the existing rows
        Dim verifyCmd As New SqlCommand("SELECT COUNT(*) FROM dbo.Products", destConn)
        Dim initialCount As Integer = CInt(verifyCmd.ExecuteScalar())

        'Perform the copy operation
        Using bcp As New SqlBulkCopy(destConn)
            bcp.DestinationTableName = "dbo.Products"
            ' Note that if column names matched, no mappings would be needed.
            bcp.ColumnMappings.Add("ProductID", "ProductCode")
            bcp.ColumnMappings.Add("Name", "ProductName")
            bcp.ColumnMappings.Add("ListPrice", "Price")
            bcp.WriteToServer(ds.Tables("Products"))
        End Using

        'Verify the data transfer
        Dim postCopyCount As Integer = CInt(verifyCmd.ExecuteScalar())
        Dim copiedRows As Integer = postCopyCount - initialCount
        MessageBox.Show(copiedRows.ToString & " rows copied")
        destConn.Close()
    End Sub
#Region "Utility code"
    Private Sub CreateDestination()
        Try
            Using conn As New SqlConnection("SERVER=localhost;DATABASE=master;INTEGRATED SECURITY=true;")
                conn.Open()
                Dim SqlCmd As New SqlCommand("CREATE DATABASE AWProductsData", conn)
                SqlCmd.ExecuteNonQuery()
                SqlCmd.CommandText = "CREATE TABLE AWProductsData.dbo.Products (ProductCode integer, ProductName nvarchar(40), Price money)"
                SqlCmd.ExecuteNonQuery()
                conn.Close()
            End Using
        Catch Ex As Exception
            MessageBox.Show(Ex.Message)
        End Try
    End Sub

 
#End Region

End Class
