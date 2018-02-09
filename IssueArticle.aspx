<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="IssueArticle.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .style5
        {
            text-align: right;
            width: 580px;
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
            width: 130px;
        }
        .style9
        {
            text-align: left;
            width: 130px;
            height: 26px;
        }
        .style10
        {
            text-align: left;
            height: 26px;
        }
        .style11
        {
            text-align: left;
            height: 26px;
            width: 139px;
        }
        .style12
        {
            text-align: left;
            width: 139px;
        }
        .style13
        {
            text-align: left;
            width: 130px;
            height: 17px;
        }
        .style14
        {
            text-align: left;
            height: 17px;
        }
    .style15
    {
        text-align: left;
        height: 17px;
        width: 166px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style5">
        <tr>
            <td>
                <strong>Issue Article</strong></td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
                <table cellpadding="3" cellspacing="5" class="style6">
                    <tr>
                        <td class="style9">
                            Item Type</td>
                        <td class="style11">
                            <asp:DropDownList ID="ItemType" runat="server" AutoPostBack="True">
                                <asp:ListItem Selected="True">Books</asp:ListItem>
                                <asp:ListItem>CDs</asp:ListItem>
                                <asp:ListItem>Magazines</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style10" colspan="2">
                            Issuing Article
                            ID</td>
                        <td class="style10">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource2" DataTextField="itemID" DataValueField="itemID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Library %>" 
                                SelectCommand="SELECT [itemID] FROM [inventory] WHERE ([itemName] = @itemName)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ItemName" Name="itemName" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Article Name</td>
                        <td class="style7" colspan="4">
                            <asp:DropDownList ID="ItemName" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="itemName" 
                                DataValueField="itemName">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Library %>" 
                                
                                SelectCommand="SELECT [itemName] FROM [inventory] WHERE (([itemType] = @itemType) AND ([lock] = @lock))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ItemType" Name="itemType" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:Parameter DefaultValue="False" Name="lock" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            Borrower</td>
                        <td class="style14" colspan="2">
                            <asp:DropDownList ID="Borrower" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="userName" 
                                DataValueField="userName" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Library %>" 
                                SelectCommand="SELECT [userName] FROM [users] WHERE ([userRole] = @userRole)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="borrower" Name="userRole" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style15">
                            User ID</td>
                        <td class="style14">
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="SqlDataSource4" DataTextField="userID" DataValueField="userID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Library %>" 
                                SelectCommand="SELECT [userID] FROM [users] WHERE ([userName] = @userName)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Borrower" Name="userName" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Issue Date</td>
                        <td class="style7" colspan="2">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <ajax:CalendarExtender ID="IssueDate" runat="server" 
                                        Enabled="True" TargetControlID="TextBox5">
                                    </ajax:CalendarExtender>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" >
                            </asp:ScriptManager>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox5" ErrorMessage="Issue Date Cannot be Blank" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Return Date</td>
                        <td class="style7" colspan="3">
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            <ajax:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox6">
                                    </ajax:CalendarExtender>
                        </td>
                        <td class="style4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox6" ErrorMessage="Return Date Cannot be Blank" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style7" colspan="2">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style8">
                            &nbsp;</td>
                        <td class="style12">
                            <asp:Button ID="AddArticle" UseSubmitBehavior="true" runat="server" 
                            Text="Issue Article" onclick="AddArticle_Click" />
                        </td>
                        <td class="style7" colspan="2">
                            <asp:Label ID="IssueStatus" runat="server" ForeColor="#0066FF"></asp:Label>
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

