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
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Dim DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn
        Dim DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn
        Dim DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.ProductsDS = New WindowsDataClient.ProductsDS
        Me.GetProductsDataConnector = New System.Windows.Forms.DataConnector(Me.components)
        Me.GetProductsTableAdapter = New WindowsDataClient.GetProductsTableAdapter
        Me.GetProductsDataNavigator = New System.Windows.Forms.DataNavigator(Me.components)
        Me.dataNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton
        Me.dataNavigatorCountItem = New System.Windows.Forms.ToolStripLabel
        Me.dataNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton
        Me.dataNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton
        Me.dataNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton
        Me.dataNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator
        Me.dataNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox
        Me.dataNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator
        Me.dataNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton
        Me.dataNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton
        Me.dataNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator
        Me.dataNavigatorSaveItem = New System.Windows.Forms.ToolStripButton
        Me.leftRaftingContainer = New System.Windows.Forms.RaftingContainer
        Me.rightRaftingContainer = New System.Windows.Forms.RaftingContainer
        Me.topRaftingContainer = New System.Windows.Forms.RaftingContainer
        Me.bottomRaftingContainer = New System.Windows.Forms.RaftingContainer
        Me.GetProductsDataGridView = New System.Windows.Forms.DataGridView
        CType(Me.ProductsDS, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GetProductsDataConnector, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GetProductsDataNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GetProductsDataNavigator.SuspendLayout()
        CType(Me.leftRaftingContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.rightRaftingContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.topRaftingContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.topRaftingContainer.SuspendLayout()
        CType(Me.bottomRaftingContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ProductsDS
        '
        Me.ProductsDS.DataSetName = "ProductsDS"
        Me.ProductsDS.Locale = New System.Globalization.CultureInfo("en-US")
        Me.ProductsDS.RemotingFormat = System.Data.SerializationFormat.Xml
        '
        'GetProductsDataConnector
        '
        Me.GetProductsDataConnector.DataMember = "GetProducts"
        Me.GetProductsDataConnector.DataSource = Me.ProductsDS
        '
        'GetProductsTableAdapter
        '
        Me.GetProductsTableAdapter.ClearBeforeFill = True
        '
        'GetProductsDataNavigator
        '
        Me.GetProductsDataNavigator.AddNewItem = Me.dataNavigatorAddNewItem
        Me.GetProductsDataNavigator.CountItem = Me.dataNavigatorCountItem
        Me.GetProductsDataNavigator.CountItemFormat = "of {0}"
        Me.GetProductsDataNavigator.DataConnector = Me.GetProductsDataConnector
        Me.GetProductsDataNavigator.DeleteItem = Me.dataNavigatorDeleteItem
        Me.GetProductsDataNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.dataNavigatorMoveFirstItem, Me.dataNavigatorMovePreviousItem, Me.dataNavigatorSeparator, Me.dataNavigatorPositionItem, Me.dataNavigatorCountItem, Me.dataNavigatorSeparator1, Me.dataNavigatorMoveNextItem, Me.dataNavigatorMoveLastItem, Me.dataNavigatorSeparator2, Me.dataNavigatorAddNewItem, Me.dataNavigatorDeleteItem, Me.dataNavigatorSaveItem})
        Me.GetProductsDataNavigator.Location = New System.Drawing.Point(0, 0)
        Me.GetProductsDataNavigator.MoveFirstItem = Me.dataNavigatorMoveFirstItem
        Me.GetProductsDataNavigator.MoveLastItem = Me.dataNavigatorMoveLastItem
        Me.GetProductsDataNavigator.MoveNextItem = Me.dataNavigatorMoveNextItem
        Me.GetProductsDataNavigator.MovePreviousItem = Me.dataNavigatorMovePreviousItem
        Me.GetProductsDataNavigator.Name = "GetProductsDataNavigator"
        Me.GetProductsDataNavigator.PositionItem = Me.dataNavigatorPositionItem
        Me.GetProductsDataNavigator.Raft = System.Windows.Forms.RaftingSides.Top
        Me.GetProductsDataNavigator.ShowItemToolTips = True
        Me.GetProductsDataNavigator.TabIndex = 0
        Me.GetProductsDataNavigator.Text = "DataNavigator1"
        '
        'dataNavigatorAddNewItem
        '
        Me.dataNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorAddNewItem.Image = CType(resources.GetObject("dataNavigatorAddNewItem.Image"), System.Drawing.Image)
        Me.dataNavigatorAddNewItem.Name = "dataNavigatorAddNewItem"
        Me.dataNavigatorAddNewItem.SettingsKey = "Form1.dataNavigatorAddNewItem"
        Me.dataNavigatorAddNewItem.Text = "Add new"
        '
        'dataNavigatorCountItem
        '
        Me.dataNavigatorCountItem.AutoToolTip = False
        Me.dataNavigatorCountItem.Name = "dataNavigatorCountItem"
        Me.dataNavigatorCountItem.SettingsKey = "Form1.dataNavigatorCountItem"
        Me.dataNavigatorCountItem.Text = "of 0"
        Me.dataNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'dataNavigatorDeleteItem
        '
        Me.dataNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorDeleteItem.Image = CType(resources.GetObject("dataNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.dataNavigatorDeleteItem.Name = "dataNavigatorDeleteItem"
        Me.dataNavigatorDeleteItem.SettingsKey = "Form1.dataNavigatorDeleteItem"
        Me.dataNavigatorDeleteItem.Text = "Delete"
        '
        'dataNavigatorMoveFirstItem
        '
        Me.dataNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorMoveFirstItem.Image = CType(resources.GetObject("dataNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.dataNavigatorMoveFirstItem.Name = "dataNavigatorMoveFirstItem"
        Me.dataNavigatorMoveFirstItem.SettingsKey = "Form1.dataNavigatorMoveFirstItem"
        Me.dataNavigatorMoveFirstItem.Text = "Move first"
        '
        'dataNavigatorMovePreviousItem
        '
        Me.dataNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorMovePreviousItem.Image = CType(resources.GetObject("dataNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.dataNavigatorMovePreviousItem.Name = "dataNavigatorMovePreviousItem"
        Me.dataNavigatorMovePreviousItem.SettingsKey = "Form1.dataNavigatorMovePreviousItem"
        Me.dataNavigatorMovePreviousItem.Text = "Move previous"
        '
        'dataNavigatorSeparator
        '
        Me.dataNavigatorSeparator.Name = "dataNavigatorSeparator"
        Me.dataNavigatorSeparator.SettingsKey = "Form1.dataNavigatorSeparator"
        '
        'dataNavigatorPositionItem
        '
        Me.dataNavigatorPositionItem.Font = New System.Drawing.Font("Tahoma", 8.25!)
        Me.dataNavigatorPositionItem.Name = "dataNavigatorPositionItem"
        Me.dataNavigatorPositionItem.SettingsKey = "Form1.dataNavigatorPositionItem"
        Me.dataNavigatorPositionItem.Text = "0"
        Me.dataNavigatorPositionItem.ToolTipText = "Current position"
        '
        'dataNavigatorSeparator1
        '
        Me.dataNavigatorSeparator1.Name = "dataNavigatorSeparator1"
        Me.dataNavigatorSeparator1.SettingsKey = "Form1.dataNavigatorSeparator1"
        '
        'dataNavigatorMoveNextItem
        '
        Me.dataNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorMoveNextItem.Image = CType(resources.GetObject("dataNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.dataNavigatorMoveNextItem.Name = "dataNavigatorMoveNextItem"
        Me.dataNavigatorMoveNextItem.SettingsKey = "Form1.dataNavigatorMoveNextItem"
        Me.dataNavigatorMoveNextItem.Text = "Move next"
        '
        'dataNavigatorMoveLastItem
        '
        Me.dataNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorMoveLastItem.Image = CType(resources.GetObject("dataNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.dataNavigatorMoveLastItem.Name = "dataNavigatorMoveLastItem"
        Me.dataNavigatorMoveLastItem.SettingsKey = "Form1.dataNavigatorMoveLastItem"
        Me.dataNavigatorMoveLastItem.Text = "Move last"
        '
        'dataNavigatorSeparator2
        '
        Me.dataNavigatorSeparator2.Name = "dataNavigatorSeparator2"
        Me.dataNavigatorSeparator2.SettingsKey = "Form1.dataNavigatorSeparator2"
        '
        'dataNavigatorSaveItem
        '
        Me.dataNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.dataNavigatorSaveItem.Image = CType(resources.GetObject("dataNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.dataNavigatorSaveItem.Name = "dataNavigatorSaveItem"
        Me.dataNavigatorSaveItem.SettingsKey = "Form1.dataNavigatorSaveItem"
        Me.dataNavigatorSaveItem.Text = "Save Data"
        '
        'leftRaftingContainer
        '
        Me.leftRaftingContainer.Dock = System.Windows.Forms.DockStyle.Left
        Me.leftRaftingContainer.Name = "leftRaftingContainer"
        '
        'rightRaftingContainer
        '
        Me.rightRaftingContainer.Dock = System.Windows.Forms.DockStyle.Right
        Me.rightRaftingContainer.Name = "rightRaftingContainer"
        '
        'topRaftingContainer
        '
        Me.topRaftingContainer.Controls.Add(Me.GetProductsDataNavigator)
        Me.topRaftingContainer.Dock = System.Windows.Forms.DockStyle.Top
        Me.topRaftingContainer.Name = "topRaftingContainer"
        '
        'bottomRaftingContainer
        '
        Me.bottomRaftingContainer.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.bottomRaftingContainer.Name = "bottomRaftingContainer"
        '
        'GetProductsDataGridView
        '
        Me.GetProductsDataGridView.AutoGenerateColumns = False
        DataGridViewTextBoxColumn1.DataPropertyName = "ProductID"
        DataGridViewTextBoxColumn1.HeaderText = "ProductID"
        DataGridViewTextBoxColumn1.Name = "ProductID"
        DataGridViewTextBoxColumn1.ReadOnly = True
        DataGridViewTextBoxColumn1.ValueType = GetType(Integer)
        DataGridViewTextBoxColumn2.DataPropertyName = "Name"
        DataGridViewTextBoxColumn2.HeaderText = "Name"
        DataGridViewTextBoxColumn2.Name = "Name"
        DataGridViewTextBoxColumn2.ValueType = GetType(String)
        DataGridViewTextBoxColumn3.DataPropertyName = "ListPrice"
        DataGridViewTextBoxColumn3.HeaderText = "ListPrice"
        DataGridViewTextBoxColumn3.Name = "ListPrice"
        DataGridViewTextBoxColumn3.ValueType = GetType(Decimal)
        Me.GetProductsDataGridView.Columns.Add(DataGridViewTextBoxColumn1)
        Me.GetProductsDataGridView.Columns.Add(DataGridViewTextBoxColumn2)
        Me.GetProductsDataGridView.Columns.Add(DataGridViewTextBoxColumn3)
        Me.GetProductsDataGridView.DataSource = Me.GetProductsDataConnector
        Me.GetProductsDataGridView.Location = New System.Drawing.Point(8, 47)
        Me.GetProductsDataGridView.Name = "GetProductsDataGridView"
        Me.GetProductsDataGridView.Size = New System.Drawing.Size(300, 220)
        Me.GetProductsDataGridView.TabIndex = 0
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(328, 287)
        Me.Controls.Add(Me.GetProductsDataGridView)
        Me.Controls.Add(Me.leftRaftingContainer)
        Me.Controls.Add(Me.rightRaftingContainer)
        Me.Controls.Add(Me.topRaftingContainer)
        Me.Controls.Add(Me.bottomRaftingContainer)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.ProductsDS, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GetProductsDataConnector, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GetProductsDataNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GetProductsDataNavigator.ResumeLayout(False)
        Me.GetProductsDataNavigator.PerformLayout()
        CType(Me.leftRaftingContainer, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.rightRaftingContainer, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.topRaftingContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.topRaftingContainer.ResumeLayout(False)
        Me.topRaftingContainer.PerformLayout()
        CType(Me.bottomRaftingContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ProductsDS As WindowsDataClient.ProductsDS
    Friend WithEvents GetProductsDataConnector As System.Windows.Forms.DataConnector
    Friend WithEvents GetProductsTableAdapter As WindowsDataClient.GetProductsTableAdapter
    Friend WithEvents GetProductsDataNavigator As System.Windows.Forms.DataNavigator
    Friend WithEvents leftRaftingContainer As System.Windows.Forms.RaftingContainer
    Friend WithEvents rightRaftingContainer As System.Windows.Forms.RaftingContainer
    Friend WithEvents topRaftingContainer As System.Windows.Forms.RaftingContainer
    Friend WithEvents bottomRaftingContainer As System.Windows.Forms.RaftingContainer
    Friend WithEvents dataNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents dataNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents dataNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents dataNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents dataNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents dataNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents dataNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents dataNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents dataNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents dataNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents dataNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents dataNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents GetProductsDataGridView As System.Windows.Forms.DataGridView

End Class
