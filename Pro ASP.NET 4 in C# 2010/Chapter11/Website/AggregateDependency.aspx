﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AggregateDependency.aspx.cs" Inherits="AggregateDependency" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button id="cmdModify" runat="server" Text="Modify File" Width="103px" OnClick="cmdModfiy_Click"></asp:Button>
    <asp:button id="cmdGetItem" runat="server" Text="Check for Item" Width="103px" OnClick="cmdGetItem_Click"></asp:button>
    <br /><br />
    <asp:Label id="lblInfo" runat="server" Width="480px" BorderWidth="2px" BorderStyle="Groove" BackColor="LightYellow"></asp:Label>
    </div>
    </form>
    
</body>
</html>
