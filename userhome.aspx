<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userhome.aspx.cs" Inherits="userhome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User - Library Management System</title>
    <link rel="stylesheet" type="text/css" href="CSS/LibraryStyle.css" />
    <style type="text/css">

        .style1
        {
            width: 800px;
            background-color: #FFFFFF;
        }
        .style2
        {
            width: 100%;
            height: 450px;
        }
        .style3
        {
            border: 1px solid #CCCCCC;
            padding: 10px;
            vertical-align: middle;
            text-align: left;
        }
        .style4
        {
            width: 100%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table align="center" cellpadding="2" cellspacing="0" class="style1">
        <tr>
            <td>
                <div class="header"><br />Library Management System<br /></div></td>
        </tr>
        <tr><td><div class="style3">
        Welcome 
            <asp:Label ID="Label1" runat="server" ForeColor="#0066FF"></asp:Label> !!  
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
        </div>
        </td>
        </tr>
        <tr>
            <td>
            <table cellpadding="10" cellspacing="10" class="style2">
        <tr>
            <td class="style4">
                <table align="center" cellpadding="10" cellspacing="10" class="style4">
                    <tr>
                        <td>
                            <strong>List of Articals Available to Issue</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Library %>" 
                                SelectCommand="SELECT DISTINCT [itemType], [itemName], [itemAuthor], [itemPublisher] FROM [inventory] WHERE ([lock] = @lock)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="False" Name="lock" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="#333333" 
                                GridLines="None" Width="708px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="itemType" HeaderText="Article Type" 
                                        SortExpression="itemType" />
                                    <asp:BoundField DataField="itemName" HeaderText="Article Name" 
                                        SortExpression="itemName" />
                                    <asp:BoundField DataField="itemAuthor" HeaderText="Article Author" 
                                        SortExpression="itemAuthor" />
                                    <asp:BoundField DataField="itemPublisher" HeaderText="Article Publisher" 
                                        SortExpression="itemPublisher" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>List of Articals Borrowed</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Library %>" 
                                SelectCommand="SELECT DISTINCT inventory.itemType, inventory.itemName, inventory.itemAuthor, inventory.itemPublisher, issue.returnDate FROM inventory INNER JOIN issue ON inventory.itemID = issue.itemID">
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource2" EnableModelValidation="True" ForeColor="#333333" 
                                GridLines="None" Width="709px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="itemType" HeaderText="Article Type" 
                                        SortExpression="itemType" />
                                    <asp:BoundField DataField="itemName" HeaderText="Article Name" 
                                        SortExpression="itemName" />
                                    <asp:BoundField DataField="itemAuthor" HeaderText="Article Author" 
                                        SortExpression="itemAuthor" />
                                    <asp:BoundField DataField="itemPublisher" HeaderText="Article Publisher" 
                                        SortExpression="itemPublisher" />
                                    <asp:BoundField DataField="returnDate" HeaderText="Returning On" 
                                        SortExpression="returnDate" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
            </td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        <tr>
            <td>
                &copy; 2010 [library.init.co.in] Library Management System</td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
