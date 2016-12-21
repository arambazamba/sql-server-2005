<%@ Page Language="VB" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>

<script runat="server">
    'Connection for Adventure Works database
    Dim ConnectionString As String = "server=localhost;database=adventureworks;integrated security=true"
    Dim myConnection As New SqlConnection(ConnectionString)

    Sub Page_Load(ByVal Sender As Object, ByVal E As EventArgs)
        
        'Get the product details
        Dim CommandText As String = "SELECT ProductID, Name, ListPrice Price FROM Production.Product WHERE ProductID = " & Request.QueryString("productid")
        Dim myCommand As New SqlCommand(CommandText, myConnection)
        Try
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader()
            dr.Read()
            'Display the product information on the page
            productID.Text = dr("ProductID")
            productName.Text = dr("Name")
            productPrice.Text = Format(dr("Price"), "c")
            dr.Close()
            
            'Now get any reviews for the product and display them in the data grid
            ShowReviews()
            
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            If myConnection.State <> ConnectionState.Closed Then
                myConnection.Close()
            End If
        End Try
    End Sub

   
    Sub submitReview_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim commandText As String
        Dim myCommand As SqlCommand
        Try
            'Insert the review
            commandText = "INSERT Production.ProductReview VALUES(" & productID.Text & ", '" & reviewerName.Text & "', GetDate(), '" & reviewerEmail.Text & "', " & Integer.Parse(reviewRating.Text) & ", '" & reviewComments.Text & "', getdate()) "
            myCommand = New SqlCommand(commandText, myConnection)
            myConnection.Open()
            myCommand.ExecuteNonQuery()
            
            'Don't allow any more reviews
            reviewedMessage.Text = " Thank you for your review"
            reviewerName.Enabled = False
            reviewerEmail.Enabled = False
            reviewRating.Enabled = False
            reviewComments.Enabled = False
            submitReview.Enabled = False
            ShowReviews()
        Catch ex As Exception
            reviewedMessage.Text = ex.Message
        Finally
            If myConnection.State <> ConnectionState.Closed Then
                myConnection.Close()
            End If
        End Try

        
    End Sub
    
    Sub submitSubscription_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '##### Add code to create subscriber and subscription here #####  
        
        
    End Sub
       
    Sub ShowReviews()
        Try
            'Retrieve the reviews for this product and bind the data grid
            Dim reviewCommand As New SqlCommand("SELECT ReviewerName Name, Rating, Comments FROM Production.ProductReview WHERE ProductID = " & productID.Text, myConnection)
            reviewsGrid.DataSource = reviewCommand.ExecuteReader()
            reviewsGrid.DataBind()
        Catch Ex As Exception
            Response.Write(Ex.Message)
        End Try
    End Sub
</script>
<html>
<head>
</head>
<body>
    <form runat="server">
        <h1><font color="#400080" face="Arial">Adventure Works</font> 
        </h1>
        <p><a href="default.aspx">Home Page</a>
        </p>
                <hr />
        <p>
        </p>
        <table>
        <tr>
        <td style="WIDTH: 305px">
        <p> <asp:label id="productName" runat="server" width="254px" font-bold="True" font-size="Medium"></asp:label>
        </p>
         <p>
            ProductID: <asp:label id="productID" runat="server" width="176px"></asp:label>
             <br />
             <br />
            <asp:label id="productPrice" runat="server" width="254px"></asp:label>
         </p>        
        </td>
        <td style="WIDTH: 144px">
            &nbsp;<asp:image runat ="Server" imageurl ="images/bike.jpg" id="Image2" width="208px" height="160px" /> 
        </td>
        </tr>
        </table>
        &nbsp;
        <hr size="1" />
             <p><strong>Reviews</strong></p>
        <asp:datagrid id="reviewsGrid" runat="server" cellspacing="1" gridlines="None" cellpadding="3" backcolor="White" forecolor="Black" enableviewstate="False" autogeneratecolumns="False" width="728px">
            <Columns>
                <asp:boundcolumn headertext="Reviewer" datafield="Name"></asp:boundcolumn>
                <asp:boundcolumn headertext="Rating" datafield="Rating"></asp:boundcolumn>
                <asp:boundcolumn headertext="Comments" datafield="Comments"></asp:boundcolumn>
            </Columns>
            <summarytitlestyle forecolor="Black" backcolor="White">
            </summarytitlestyle>
            <detailtitlestyle forecolor="Black" backcolor="White">
            </detailtitlestyle>
            <HeaderStyle font-bold="True" forecolor="White" backcolor="#4A3C8C"></HeaderStyle>
            <ItemStyle backcolor="#DEDFDE"></ItemStyle>
        </asp:datagrid>


             <hr size="1" />
             <p><strong>Add a review for this product:</strong><asp:label id="reviewedMessage" runat="server" width="254px" font-bold="true" forecolor="Red"></asp:label></p>
                     <p>
            Name:&nbsp; <asp:textbox id="reviewerName" runat="server" width="254px"></asp:textbox>
        </p>
        <p>
            Email:&nbsp;<asp:textbox id="reviewerEmail" runat="server" width="255px"></asp:textbox>
        </p>
                            <p>
            Rating:&nbsp; <asp:textbox id="reviewRating" runat="server" width="254px"></asp:textbox>
        </p>
        <p>
            Comments:&nbsp;<br />
            <asp:textbox id="reviewComments" runat="server" width="544px"></asp:textbox>
        </p>
        <p>
            <asp:button id="submitReview" runat="server" text="Submit Review" onclick="submitReview_Click" ></asp:button>
        </p>

<hr size="1" />
        <p>
            <strong>
            Tell me when this product is reviewed:</strong><asp:label id="subscriptionMessage" runat="server" width="254px" font-bold="true" forecolor="Red"></asp:label>
        </p>
        <p>
            Name: 
            <asp:textbox id="subscriberName" runat="server" width="254px"></asp:textbox>
        </p>
        <p>
            Email:&nbsp;<asp:textbox id="subscriberEmail" runat="server" width="255px"></asp:textbox>
        </p>
        <p>
            <asp:button id="submitSubscription" runat="server" text="Subscribe" onclick="submitSubscription_Click"></asp:button>
        </p>
    </form>
</body>
</html>
