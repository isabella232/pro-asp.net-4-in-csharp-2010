﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SqlDataSourceUpdate.aspx.cs" Inherits="SqlDataSourceUpdates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="sourceEmployees" runat="server" ProviderName="System.Data.SqlClient" 
         ConnectionString="<%$ ConnectionStrings:Northwind %>"
         SelectCommand="SELECT EmployeeID, FirstName, LastName, Title, City FROM Employees" 
         UpdateCommand="UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, Title=@Title, City=@City FROM Employees WHERE EmployeeID=@EmployeeID">
        </asp:SqlDataSource>
        <br />
        
        <asp:GridView ID="GridView1" runat="server" DataSourceID="sourceEmployees" CellPadding="4"
         Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" GridLines="None"
         DataKeyNames="EmployeeID" EnableSortingAndPagingCallbacks="True" PageSize="5"
         AutoGenerateEditButton="true">           
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
