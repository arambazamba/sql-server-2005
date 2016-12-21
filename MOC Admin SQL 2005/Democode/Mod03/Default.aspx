<%@ Page Language="C#" CompileWith="Default.aspx.cs" ClassName="Default_aspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Server name:
        <asp:TextBox ID="txtServerName" Runat="server">localhost</asp:TextBox>
    
    </div>
        <div>
            &nbsp;</div>
        <div>
            &nbsp;</div>
        <div>
            <asp:Button ID="btnListDatabases" Runat="server" Text="List databases" OnClick="btnListDatabases_Click" />
            <asp:Button ID="btnCreateDatabase" Runat="server" Text="Create database" OnClick="btnCreateDatabase_Click" /></div>
        <div>
            &nbsp;</div>
        <div>
            <asp:ListBox ID="lstDatabases" Runat="server" Width="206px" Height="184px">
            </asp:ListBox>
        </div>
    </form>
</body>
</html>
