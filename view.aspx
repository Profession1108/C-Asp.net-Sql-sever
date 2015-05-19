<%@ Page Title="" Language="C#" MasterPageFile="~/handler.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Handler" Runat="Server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
        <asp:table borderwidth="1" id="Table1" runat="server" Height="27px" Visible="False">
        </asp:table>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
    </div>
</body>
</html>

</asp:Content>

