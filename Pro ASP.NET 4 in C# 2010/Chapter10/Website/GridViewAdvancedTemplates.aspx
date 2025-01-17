﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewAdvancedTemplates.aspx.cs" Inherits="GridViewTemplates2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="sourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:Northwind %>"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products">
        </asp:SqlDataSource>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ProductID" DataSourceID="sourceProducts" 
            Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            
                <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                     ImageUrl='<%# GetStatusPicture(Container.DataItem) %>'                      
                      CommandName="StatusClick"                      
                       CommandArgument='<%# Eval("ProductID") %>'
                     
                      /></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
                <asp:BoundField DataField="UnitPrice" DataFormatString="{0:C}" HeaderText="Price"
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="Units In Stock" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblInfo" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label>
    
    </div>
    </form>
</body>
</html>
