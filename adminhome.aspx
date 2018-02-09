<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminhome.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            text-align: right;
            width: 500px;
        }
        .style6
        {
            width: 450px;
        }
    .style7
    {
        text-align: left;
        width: 44px;
    }
    .style8
    {
        text-align: left;
        width: 246px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style5">
        <tr>
            <td>
                <strong>STATS</strong></td>
        </tr>
        <tr>
            <td>
                <br />
                <br /><br /><hr />
                <table cellpadding="3" cellspacing="5" class="style6">
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style8">
                            Total Number of Books</td>
                        <td class="style4">
                            <asp:Label ID="Label2" runat="server" ForeColor="#0066FF"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style8">
                            Total Number of CDs</td>
                        <td class="style4">
                            <asp:Label ID="Label3" runat="server" ForeColor="#0066FF"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style8">
                            Total Number of Magazines</td>
                        <td class="style4">
                            <asp:Label ID="Label4" runat="server" ForeColor="#0066FF"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style8">
                            Number of Articles Issued</td>
                        <td class="style4">
                            <asp:Label ID="Label5" runat="server" ForeColor="#0066FF"></asp:Label>
                        </td>
                    </tr>
                    </table><hr /><br /><br />
            </td>
        </tr>
    </table>
</asp:Content>

