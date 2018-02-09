<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Library Management System</title>
    <link rel="stylesheet" type="text/css" href="CSS/LibraryStyle.css" />
    <style type="text/css">
        .style1
        {
            width: 800px;
            background-color: #FFFFFF;
        }
        .style2
        {
            width: 840px;
            height: 450px;
        }
        .style5
        {
            color: #0066FF;
        }
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <table align="center" cellpadding="2" cellspacing="0" class="style1">
        <tr>
            <td>
                <div class="header"><br />Library Management System<br /></div></td>
        </tr>
        <tr>
            <td>
            <table class="style2" cellpadding="4" cellspacing="4" align="center">
        <tr>
            <td>
            <form action="" method="post">
                <table align="center" cellpadding="4" cellspacing="4" class="loginbody">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            </td>
                    </tr>
                    <tr>
                        <td>
                            Username</td>
                        <td>
                            <asp:TextBox ID="username" TextMode="SingleLine" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password</td>
                        <td>
                            <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Login"  UseSubmitBehavior="true" runat="server" Text="Login" 
                               onclick="Login_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                            </td>
                        <td>&nbsp;
                            </td>
                    </tr>
                </table></form>
            </td>
            <td>
            <div class="introtext">
                <em>
                <span class="style5">Facilities provided by the system.</span><br /></em>
                <br />
                <br />
                <br />
                1. <strong>Librarian</strong><br />
                <br />
                Can manage inventory: Books, CDs and Magazines. Can perform transactions: 
                article issue, return, fine calculation for borrowers.<br />
                <br />
                Username: <em>admin</em><br />
                Password: <em>password</em><br />
                <br />
                <br />
                2. <strong>Borrower</strong><br />
                <br />
                Can list articles avaliable to be issued, 
                and details of borrowed articles.<br />
                <br />
                Username: <em>user</em><br />
                Password: <em>password</em></td>
        </tr>
    </table>
    </div></td>
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
    </form>
</body>
</html>
