Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        GetProductsTableAdapter.Fill(ProductsDS)
    End Sub

    Private Sub dataNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles dataNavigatorSaveItem.Click
        GetProductsTableAdapter.Update(ProductsDS)
    End Sub
End Class
