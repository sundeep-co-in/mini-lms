<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="ReturnArticle.aspx.cs" Inherits="Default2" %>

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
        text-align: left;
    }
    .style8
    {
        text-align: left;
        width: 125px;
    }
    .style9
    {
        text-align: left;
        width: 30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style5">
    <tr>
        <td>
            <strong>Return Article</strong></td>
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
                            <asp:ListItem Selected="True">Books</asp:ListItem>
                            <asp:ListItem>CDs</asp:ListItem>
                            <asp:ListItem>Magazines</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT DISTINCT [userID] FROM [users] WHERE ([userRole] = @userRole)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="borrower" Name="userRole" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
                                <asp:Parameter DefaultValue="True" Name="status" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        Issue Date</td>
                    <td class="style7" colspan="2">
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="issueDate" 
                            DataValueField="issueDate">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT [issueDate] FROM [issue] WHERE ([issueID] = @issueID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList2" Name="issueID" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        Return Date</td>
                    <td class="style7" colspan="2">
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            DataSourceID="SqlDataSource4" DataTextField="returnDate" 
                            DataValueField="returnDate">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT DISTINCT [returnDate] FROM [issue] WHERE ([issueID] = @issueID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList2" Name="issueID" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        Article ID</td>
                    <td class="style7" colspan="2">
                        <asp:DropDownList ID="DropDownList5" runat="server" 
                            DataSourceID="SqlDataSource5" DataTextField="itemID" DataValueField="itemID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Library %>" 
                            SelectCommand="SELECT DISTINCT [itemID] FROM [issue] WHERE ([issueID] = @issueID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList2" Name="issueID" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        Actual Return On</td>
                    <td class="style7" colspan="2">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <ajax:CalendarExtender ID="IssueDate" runat="server" 
                                        Enabled="True" TargetControlID="TextBox5">
                                    </ajax:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="Provide Actual Return Date" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" >
                            </asp:ScriptManager>                            
                        </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        &nbsp;</td>
                    <td class="style7">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style8">
                        &nbsp;</td>
                    <td class="style7">
                        <asp:Button ID="AddArticle" UseSubmitBehavior="true" runat="server" 
                            Text="Return Article" onclick="AddArticle_Click" />
                    </td>
                    <td class="style4">
                        <asp:Label ID="Label2" runat="server" ForeColor="#0066FF"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </td>
    </tr>
</table>
</asp:Content>

