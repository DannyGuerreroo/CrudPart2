<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="CrudPart2.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="ConfirmationLabel" runat="server" Text=""></asp:Label>
        </div>

        <br />

<asp:Repeater ID="RecentOrderRepeater" runat="server">
    <HeaderTemplate>
        <table>
        <tr><th>Order Number</th><th>Customer Name</th><th>Order Date</th><th>Quantity</th><th>Total Amount</th></tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# DataBinder.Eval(Container.DataItem, "OrderNumber") %></td>
            <td><%# DataBinder.Eval(Container.DataItem, "CustomerName") %></td>
            <td><%# DataBinder.Eval(Container.DataItem, "OrderDate", "{0:MM/dd/yyyy}") %></td>
            <td><%# DataBinder.Eval(Container.DataItem, "Quantity") %></td>
            <td><%# DataBinder.Eval(Container.DataItem, "TotalAmount") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
    </form>
</body>
</html>
