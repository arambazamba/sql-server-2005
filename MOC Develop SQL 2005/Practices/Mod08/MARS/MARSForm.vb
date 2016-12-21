Imports System.Data.SqlClient
Imports System.Configuration
Public Class marsForm
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
    Friend WithEvents listOrdersButton As System.Windows.Forms.Button
    Friend WithEvents orderListBox As System.Windows.Forms.ListBox
    Friend WithEvents detailListBox As System.Windows.Forms.ListBox

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerNonUserCode()> Private Sub InitializeComponent()
        Me.listOrdersButton = New System.Windows.Forms.Button
        Me.orderListBox = New System.Windows.Forms.ListBox
        Me.detailListBox = New System.Windows.Forms.ListBox
        Me.SuspendLayout()
        '
        'listOrdersButton
        '
        Me.listOrdersButton.Location = New System.Drawing.Point(99, 17)
        Me.listOrdersButton.Name = "listOrdersButton"
        Me.listOrdersButton.TabIndex = 0
        Me.listOrdersButton.Text = "List Orders"
        '
        'orderListBox
        '
        Me.orderListBox.Location = New System.Drawing.Point(80, 47)
        Me.orderListBox.Name = "orderListBox"
        Me.orderListBox.Size = New System.Drawing.Size(120, 95)
        Me.orderListBox.TabIndex = 1
        '
        'detailListBox
        '
        Me.detailListBox.Location = New System.Drawing.Point(80, 152)
        Me.detailListBox.Name = "detailListBox"
        Me.detailListBox.Size = New System.Drawing.Size(120, 95)
        Me.detailListBox.TabIndex = 2
        '
        'marsForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.detailListBox)
        Me.Controls.Add(Me.orderListBox)
        Me.Controls.Add(Me.listOrdersButton)
        Me.Name = "marsForm"
        Me.Text = "Multiple Active Result Sets"
        Me.ResumeLayout(False)

    End Sub

    Friend Shared ReadOnly Property GetInstance() As marsForm
        Get
            If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                SyncLock m_SyncObject
                    If m_DefaultInstance Is Nothing OrElse m_DefaultInstance.IsDisposed() Then
                        m_DefaultInstance = New marsForm
                    End If
                End SyncLock
            End If
            Return m_DefaultInstance
        End Get
    End Property

    Private Shared m_DefaultInstance As marsForm
    Private Shared m_SyncObject As New Object
#End Region
    Dim conn As SqlConnection
    Private Sub marsForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        conn = New SqlConnection(ConfigurationSettings.ConnectionStrings("AWConnectionString").ConnectionString)
    End Sub
    Private Sub listOrdersButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles listOrdersButton.Click
        'Open the connection (if not already open) and retrieve all order headers
        If conn.State <> ConnectionState.Open Then
            conn.Open()
        End If
        Dim orderReader As SqlDataReader
        Dim getOrders As New SqlCommand("SELECT SalesOrderID FROM Sales.SalesOrderHeader WHERE SalesOrderID > 70000", conn)
        orderReader = getOrders.ExecuteReader()
        While orderReader.Read()
            orderListBox.Items.Add(orderReader("SalesOrderID"))
        End While

        'Select the first order and display the products it contains
        orderListBox.SelectedIndex = 0
        DisplayProducts(orderListBox.SelectedItem.ToString)
    End Sub

    Private Sub orderListBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles orderListBox.SelectedIndexChanged
        DisplayProducts(orderListBox.SelectedItem.ToString)
    End Sub

    Private Sub DisplayProducts(ByVal OrderID As String)
        'Open the connection if it's closed, otherwise just use it
        If conn.State <> ConnectionState.Open Then
            conn.Open()
        End If
        'Display the products for the selected order
        Dim detailReader As SqlDataReader
        Dim getDetails As New SqlCommand("SELECT ProductID FROM Sales.SalesOrderDetail WHERE SalesOrderID = " & OrderID, conn)
        detailReader = getDetails.ExecuteReader()
        detailListBox.Items.Clear()
        While detailReader.Read()
            detailListBox.Items.Add(detailReader("ProductID"))
        End While
        conn.Close()
    End Sub



End Class
