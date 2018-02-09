<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="ListMagazines.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">



        .style5
        {
            text-align: right;
            width: 500px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style6">
                <strong>List Magazines</strong></td>
        </tr>
        <tr>
            <td class="style6">
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Library %>" 
                    
                    SelectCommand="SELECT inventory.itemID, inventory.itemName, inventory.itemAuthor, inventory.lock, stock.stockCopies FROM inventory INNER JOIN stock ON inventory.stockID = stock.stockID WHERE (inventory.itemType = 'Magazines')">
                </asp:SqlDataSource>
                <table class="style2" style="width: 99%">
                    <tr>
                        <td class="style7" colspan="2">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataKeyNames="itemID" DataSourceID="SqlDataSource1" 
                                EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemID" HeaderText="Magazine ID" ReadOnly="True" 
                                        SortExpression="itemID" />
                                    <asp:BoundField DataField="itemName" HeaderText="Magazine Name" 
                                        SortExpression="itemName" />
                                    <asp:BoundField DataField="itemAuthor" HeaderText="Magazine Author" 
                                        SortExpression="itemAuthor" />
                                    <asp:BoundField DataField="stockCopies" HeaderText="In Stock" 
                                        SortExpression="stockCopies" />
                                    <asp:BoundField DataField="lock" HeaderText="Issued" 
                                        SortExpression="lock" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:Button ID="Delete" runat="server" onclick="Delete_Click" 
                                Text="Remove Magazines From Stock" />
                        </td>
                        <td class="style7">
                            <asp:Label ID="Label2" runat="server" ForeColor="#0099FF"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

