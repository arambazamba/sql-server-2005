Module Module1

    Sub Main()

        Dim proxy As New ws.PersonEndpoint
        proxy.Credentials = System.Net.CredentialCache.DefaultCredentials

        Dim results As DataSet = proxy.ListPerson
        For Each r As DataRow In results.Tables(0).Rows
            Console.WriteLine(r.Item(0) & " " & r.Item(1))
        Next
    End Sub

End Module
