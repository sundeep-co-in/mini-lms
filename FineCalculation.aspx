<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="FineCalculation.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">



        .style5
        {
            text-align: right;
            width: 520px;
        }
        .style6
        {
            width: 500px;
        }
        .style7
    {
            width: 163px;
            text-align: left;
        }
    .style8
    {
            text-align: left;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style5">
    <tr>
        <td>
            <strong>Fine Calculation</strong></td>
    </tr>
    <tr>
        <td>
            <br />
            <br />
            <table cellpadding="3" cellspacing="5" class="style6">
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        User ID</td>
                    <td class="style7" colspan="2">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="userID" DataValueField="userID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT DISTINCT [userID] FROM [issue]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        Transaction ID</td>
                    <td class="style7" colspan="2">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="issueID" DataValueField="issueID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT DISTINCT [issueID] FROM [issue] WHERE (([userID] = @userID) AND ([status] = @status))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="userID" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:Parameter DefaultValue="False" Name="status" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8" colspan="3" rowspan="3"><br />
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            CellPadding="4" DataSourceID="SqlDataSource3" EnableModelValidation="True" 
                            ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
                            Width="292px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="itemID" HeaderText="Article ID" 
                                    SortExpression="itemID" />
                                <asp:BoundField DataField="issueDate" HeaderText="Issue Date" 
                                    SortExpression="issueDate" />
                                <asp:BoundField DataField="returnDate" HeaderText="Assigned Date" 
                                    SortExpression="returnDate" />
                                <asp:BoundField DataField="actualReturnDate" HeaderText="Return Date" 
                                    SortExpression="actualReturnDate" />                               
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT DISTINCT [itemID], [returnDate], [actualReturnDate], [issueDate] FROM [issue] WHERE ([issueID] = @issueID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList2" Name="issueID" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource><br />
                    </td>
                </tr>
                
                <tr>
                    <td class="style9">
                        </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        &nbsp;</td>
                    <td class="style7" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        Amount Per Day</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:Button ID="AddArticle" UseSubmitBehavior="true" runat="server" 
                            Text="Calculate Fine" onclick="AddArticle_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        &nbsp;</td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="Enter Per Day Amount " 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8" colspan="3">
                        <asp:Label ID="FineAmt" runat="server" ForeColor="#0066FF" 
                            style="text-align: center"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </td>
    </tr>
</table>
</asp:Content>

