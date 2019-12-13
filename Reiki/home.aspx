<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Reiki</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col mt-5">
        <asp:Label CssClass="h1" runat="server" Text="Bienvenido Reikista!" ID="welcometext"></asp:Label>
    </div>
    <div class="col mt-5">
        <asp:Label CssClass="h2" runat="server" Text="Monto Recaudado:" ID="Label10"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Mes" HeaderText="Mes" ReadOnly="True" SortExpression="Mes" />
                <asp:BoundField DataField="TotalR" HeaderText="Monto Recaudado" ReadOnly="True" SortExpression="TotalR" />
            </Columns>
            <HeaderStyle CssClass="table-primary" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="SELECT MONTH(t.fecha) AS Mes, SUM(p.precio) AS TotalR FROM precios AS p INNER JOIN tickets AS t ON p.id = t.idprecio WHERE Year(t.fecha) = YEAR(GETDATE()) GROUP BY MONTH(t.fecha)"></asp:SqlDataSource>
    </div>
    <div class="col mt-5">
        <asp:Label CssClass="h2" runat="server" Text="Turnos pendientes:" ID="Label21"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Turno numero" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                <asp:BoundField DataField="dni" HeaderText="Dni" SortExpression="dni" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
            </Columns>
            <HeaderStyle CssClass="table-primary" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="SELECT turnos.id, turnos.fecha, turnos.hora, turnos.estado, pacientes.dni, pacientes.nombre, pacientes.apellido, pacientes.sexo, pacientes.telefono FROM pacientes INNER JOIN turnos ON pacientes.id = turnos.idpaciente WHERE turnos.estado = 'en espera' AND turnos.idreiki ="></asp:SqlDataSource>
    </div>
</asp:Content>

