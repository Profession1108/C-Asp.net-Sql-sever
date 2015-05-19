<%@ Page Title="" Language="C#" MasterPageFile="~/handler.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Handler" Runat="Server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            text-align: left;
            color: #FF0000;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style5 {
            width: 188px;
        }
        .auto-style6 {
            width: 72px;
            text-align: right;
            height: 23px;
        }
        .auto-style7 {
            width: 188px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            width: 72px;
        }
    </style>
<script type ="text/javascript">
</script>
</head>
<body>
    <div class="auto-style1">
    
        Login Page</div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style6">UserName</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="180px" AutoCompleteType="Disabled"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px" style="margin-left: 0px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Login" Width="185px" style="margin-left: 0px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
</body>
</html>

</asp:Content>

