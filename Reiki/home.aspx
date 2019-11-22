<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Reiki</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col mt-5">
        <asp:label CssClass="h1" runat="server" Text="Bienvenido Reikista!" ID="welcometext"></asp:label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Mes" HeaderText="Mes" ReadOnly="True" SortExpression="Mes" />
                <asp:BoundField DataField="TotalR" HeaderText="TotalR" ReadOnly="True" SortExpression="TotalR" />
            </Columns>
            <HeaderStyle CssClass="table-primary" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="SELECT MONTH(t.fecha) AS Mes, SUM(p.precio) AS TotalR FROM precios AS p INNER JOIN tickets AS t ON p.id = t.idprecio GROUP BY t.fecha, p.precio"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
                <asp:BoundField DataField="dni" HeaderText="dni" SortExpression="dni" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
            </Columns>
            <HeaderStyle CssClass="table-primary" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="SELECT turnos.id, turnos.fecha, turnos.hora, turnos.estado, pacientes.dni, pacientes.nombre, pacientes.apellido, pacientes.sexo, pacientes.telefono FROM pacientes INNER JOIN turnos ON pacientes.id = turnos.idpaciente"></asp:SqlDataSource>
    </div>
</asp:Content>

