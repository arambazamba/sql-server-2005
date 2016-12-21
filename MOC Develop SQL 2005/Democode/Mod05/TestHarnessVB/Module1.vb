Module Module1

    Sub Main()
        Dim proxy As New _
            AWWebService.AWProduction()

        proxy.Credentials = _
            System.Net.CredentialCache.DefaultCredentials

        Dim ds As System.Data.DataSet = proxy.GetProducts()

        For Each r As System.Data.DataRow In ds.Tables(0).Rows
            Console.WriteLine(r("Name").ToString())
        Next
    End Sub

End Module
