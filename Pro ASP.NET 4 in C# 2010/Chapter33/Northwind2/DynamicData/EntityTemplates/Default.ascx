﻿<%@ Control Language="C#" CodeFile="Default.ascx.cs" Inherits="DefaultEntityTemplate" %>

<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <tr class="td">
            <td class="DDLightHeader">
                <asp:Label runat="server" Text="Field name:" />
            </td>
            <td>
                <asp:Label runat="server" OnInit="Label_Init" />
            </td>
            <td class="DDLightHeader">
                <asp:Label runat="server" Text="Field value:" />
            </td>
            <td>
                <asp:DynamicControl runat="server" OnInit="DynamicControl_Init" />
            </td>
        </tr>
    </ItemTemplate>
</asp:EntityTemplate>

