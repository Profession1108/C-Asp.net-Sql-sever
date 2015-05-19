<%@ Page Title="" Language="C#" MasterPageFile="~/handler.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Handler" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 106px;
        }
        .auto-style3 {
            width: 106px;
            height: 20px;
            text-align: right;
        }
        .auto-style4 {
            height: 20px;
            text-align: left;
        }
        .auto-style6 {
            width: 176px;
        }
        .auto-style7 {
            height: 20px;
            width: 176px;
        }
        .auto-style9 {
            color: #FF0000;
        }
        #Reset1 {
            width: 49px;
            height: 25px;
        }
        .auto-style10 {
            width: 106px;
            height: 3px;
        }
        .auto-style11 {
            width: 176px;
            height: 3px;
        }
        .auto-style12 {
            height: 3px;
        }
        .auto-style13 {
            width: 106px;
            text-align: right;
            height: 23px;
        }
        .auto-style14 {
            width: 176px;
            height: 23px;
        }
        .auto-style15 {
            text-align: left;
            height: 23px;
        }
        .auto-style16 {
            height: 20px;
            font-size: xx-large;
            color: #FF0000;
        }
        </style>
<script type ="text/javascript">
</script>
</head>
<body>
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style16" colspan="3"><strong>Registration Page</strong></td>
            </tr>
            <tr>
                <td class="auto-style13">User Name:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="TextBoxUN" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" CssClass="auto-style9" ErrorMessage="User Name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPass" CssClass="auto-style9" ErrorMessage="Password is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp; Confirm Password:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxRPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxRPass" CssClass="auto-style9" ErrorMessage="Confirm Password is required."></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRPass" ErrorMessage="Both password must be same" style="color: #FF0000"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">E-mail:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxEmail" CssClass="auto-style9" ErrorMessage="E-mail is required."></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="You must enter the valid Email Id" style="color: #FF0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">Country</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="180px" style="height: 19px">
                        <asp:ListItem>Select Country</asp:ListItem>
                        <asp:ListItem>USA</asp:ListItem>
                        <asp:ListItem>Germany</asp:ListItem>
                        <asp:ListItem>France</asp:ListItem>
                        <asp:ListItem>UK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListCountry" CssClass="auto-style9" ErrorMessage="Select a country name" InitialValue="Select Country"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:Button ID="Button1" runat="server" Height="25px" OnClick="Button1_Click" Text="Submit" />
                    <input id="Reset1" aria-atomic="False" aria-disabled="False" aria-invalid="false" type="reset" value="reset" aria-pressed="false" /></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
</body>
</html>
</asp:Content>

