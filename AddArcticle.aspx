<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="AddArcticle.aspx.cs" Inherits="Default2" %>

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
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style5">
    <tr>
        <td>
            <strong>Add Article</strong></td>
    </tr>
    <tr>
        <td>
            <br />
            <br />
            <table cellpadding="3" cellspacing="5" class="style6">
                <tr>
                    <td class="style4">
                        Item Type</td>
                    <td class="style7">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Selected="True">Books</asp:ListItem>
                            <asp:ListItem>CDs</asp:ListItem>
                            <asp:ListItem>Magazines</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        Item ID</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="Unique ID is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Item Name</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="Article Name  is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Item Author</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="Item Author is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Item Publisher</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="Item Publisher is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style7">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style7">
                        <asp:Button ID="AddArticle" UseSubmitBehavior="true" runat="server" 
                            Text="Add Article" onclick="AddArticle_Click" />
                    </td>
                    <td class="style4">
                        <asp:Label ID="Label2" runat="server" ForeColor="#0066FF"></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" ForeColor="#0066FF"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </td>
    </tr>
</table>
</asp:Content>

