<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrudPart2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Firstname: <asp:TextBox ID="txtFirstName" runat="server" Text="Your_Firstname"/>
            Lastname: <asp:TextBox ID="txtLastName" runat="server" Text="Your_lastname"/>
            <br />
            City: <asp:TextBox ID="txtCity" runat="server" Text="Centralia"/>
            Country: <asp:TextBox ID="txtCountry" runat="server" Text="USA"/>
            Phone: <asp:TextBox ID="txtPhone" runat="server" Text="(555) 1234"/>
            <br />
            Product: <asp:DropDownList ID="ddlProducts" runat="server"/>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" OnClick="btnSubmit_Click"/>
        </div>
    </form>
</body>
</html>
