Imports Microsoft.SqlServer.Management.Common
Imports Microsoft.SqlServer.Replication

Public Class Form1
    ' Global variables
    Dim subServer As String = "SQL2005PC" ' replace SQL2005PC with your computer name
    Dim pubServer As String = "SQL2005PC" ' replace SQL2005PC with your computer name
    Dim pubName As String = "AWContacts"
    Dim pubDB As String = "AdventureWorks"
    Dim subDB As String = "AdventureWorksDW"
    Dim subCon As ServerConnection
    Dim pubCon As ServerConnection

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ' Connect to the subscriber and publisher servers
        subCon = New ServerConnection(subServer)
        subCon.Connect()
        pubCon = New ServerConnection(pubServer)
        pubCon.Connect()
    End Sub

    Private Sub viewSubs_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles viewSubs.Click
        ' Connect to publication using the publisher connection
        Dim tranPub As TransPublication = New TransPublication(pubName, pubDB, pubCon)
        If tranPub.LoadProperties() Then
            ' If subscribers exist
            If tranPub.TransSubscriptions.Count > 0 Then
                ' List them in message boxes
                For Each subs As TransSubscription In tranPub.TransSubscriptions
                    MessageBox.Show(subs.Name)
                Next
            Else
                ' Inform the user
                MessageBox.Show("There are no subscribers for the AWContacts publication")
            End If
        End If
    End Sub

    Private Sub createSubs_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles createSubs.Click
        ' Define the subscription
        Dim tranPullSub As TransPullSubscription = New TransPullSubscription()
        tranPullSub.ConnectionContext = subCon
        tranPullSub.DatabaseName = subDB
        tranPullSub.PublisherName = pubServer
        tranPullSub.PublicationDBName = pubDB
        tranPullSub.PublicationName = pubName
        tranPullSub.SynchronizationAgentProcessSecurity.Login = "SQL2005PC\SQLServer" ' replace SQL2005PC with your computer name
        tranPullSub.SynchronizationAgentProcessSecurity.Password = "P@ssw0rd"

        ' Create the subscription
        tranPullSub.Create()

        ' Make the pull subscription known to the publisher
        Dim tranPub As TransPublication = New TransPublication(pubName, pubDB, pubCon)
        If tranPub.LoadProperties() Then
            tranPub.MakePullSubscriptionWellKnown(subServer, subDB, SubscriptionSyncType.Automatic, tranPullSub.SubscriberType)
        End If

        MessageBox.Show("Subscription created")
        createSubs.Enabled = False
    End Sub
End Class
