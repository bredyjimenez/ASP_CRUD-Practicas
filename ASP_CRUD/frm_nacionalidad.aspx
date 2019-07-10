<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_nacionalidad.aspx.cs" Inherits="ASP_CRUD.frm_nacionalidad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="p_busqueda" runat="server">
                <br />
                <asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label>
                <asp:TextBox ID="txt_id_busqueda" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label>
                <asp:DropDownList ID="ddl_nacionalidad_busqueda" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL_CRUDConnectionString %>" SelectCommand="SELECT [id], [nombre] FROM [nacionalidades] WHERE ([estado] = @estado)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="estado" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource><br /><br />
                <asp:Button ID="Button1" runat="server" Text="Buscar" />
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
