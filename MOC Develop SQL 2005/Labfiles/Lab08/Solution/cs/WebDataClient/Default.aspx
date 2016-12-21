<%@ Page Language="C#" CompileWith="Default.aspx.cs" ClassName="Default_aspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" Runat="server" SelectCommand="Production.GetProducts"
            UpdateCommand="Production.UpdateProduct" ConnectionString="<%$ ConnectionStrings:AppConnectionString1 %>">
            <UpdateParameters>
                <asp:Parameter Type="Int32" Name="productid"></asp:Parameter>
                <asp:Parameter Type="String" Name="name"></asp:Parameter>
                <asp:Parameter Type="Decimal" Name="listprice"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" Runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ProductID"
            AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" BorderWidth="1px"
            BackColor="White" CellPadding="4" BorderStyle="None" BorderColor="#CC9966">
            <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
            <PagerStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="#FFFFCC"></PagerStyle>
            <HeaderStyle ForeColor="#FFFFCC" Font-Bold="True" BackColor="#990000"></HeaderStyle>
            <Columns>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                <asp:BoundField ReadOnly="True" HeaderText="ProductID" InsertVisible="False" DataField="ProductID"
                    SortExpression="ProductID"></asp:BoundField>
                <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name"></asp:BoundField>
                <asp:BoundField HeaderText="ListPrice" DataField="ListPrice" SortExpression="ListPrice"></asp:BoundField>
            </Columns>
            <SelectedRowStyle ForeColor="#663399" Font-Bold="True" BackColor="#FFCC66"></SelectedRowStyle>
            <RowStyle ForeColor="#330099" BackColor="White"></RowStyle>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
