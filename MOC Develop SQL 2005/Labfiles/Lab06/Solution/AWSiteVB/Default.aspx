<%@ Page Language="VB" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(ByVal Sender As Object, ByVal E As EventArgs)
        'Connection for the Adventure Works database
        Dim ConnectionString As String = "server=localhost;database=adventureworks;integrated security=true"
        
        'Command to retrieve products 953 - 993 (just sample data, no particular reason why those products)
        Dim CommandText As String = "select ProductID, Name from Production.Product WHERE ProductID BETWEEN 953 AND 993 ORDER BY ProductID"
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlCommand(CommandText, myConnection)
    
        Try
            'Retrieve the product list and bind it to the data grid
            myConnection.Open()
            productsGrid.DataSource = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            productsGrid.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            If myConnection.State <> ConnectionState.Closed Then
                myConnection.Close()
            End If
        End Try
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial" ms_positioning="GridLayout">
    <h1><font color="#400080">Adventure Works</font> 
    </h1>
    <hr size="1" />
    <form runat="server">
    <table border = 0>
    <tr>
    <td bgcolor="silver">
     <strong><font color="#333399">Best Selling Bikes<br />
                </font></strong>
        <asp:datagrid id="productsGrid" runat="server" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="White" ForeColor="Black" EnableViewState="False" AutoGenerateColumns="False" showheader="False">
            <Columns>
                <asp:boundcolumn headertext="Product ID" datafield="ProductID">
                </asp:boundcolumn>
                <asp:hyperlinkcolumn datanavigateurlformatstring="product.aspx?productid={0}" datatextfield="Name"
                    datanavigateurlfield="ProductID" headertext="Name">
                </asp:hyperlinkcolumn>
            </Columns>
            <summarytitlestyle forecolor="Black" backcolor="White">
            </summarytitlestyle>
            <detailtitlestyle forecolor="Black" backcolor="White">
            </detailtitlestyle>
            <HeaderStyle font-bold="True" forecolor="White" backcolor="#4A3C8C"></HeaderStyle>
            <ItemStyle backcolor="#DEDFDE"></ItemStyle>
        </asp:datagrid>
    </td>
    <td> &nbsp;&nbsp;
    
    </td>
    </tr> 
    </table>
        <div style="DISPLAY: inline; Z-INDEX: 103; LEFT: 360px; WIDTH: 216px; POSITION: absolute; TOP: 136px; HEIGHT: 136px"
            ms_positioning="FlowLayout">
            <p align="left">Adventure Works cycles are designed and built to the
            highest specifications. Whichever model you choose, an Adventure Works cycle will
            go anywhere your adventure takes you.</p>
        </div>
        <div style="DISPLAY: inline; Z-INDEX: 102; LEFT: 360px; WIDTH: 232px; POSITION: absolute; TOP: 112px; HEIGHT: 24px"
            ms_positioning="FlowLayout">
            <strong>The adventure starts here</strong></div>
        <asp:image runat ="Server" imageurl ="images/cycle.jpg" style="Z-INDEX: 101; LEFT: 240px; POSITION: absolute; TOP: 112px" id="Image2" width="112px" height="160px" /> 
       
    </form>
</body>
</html>