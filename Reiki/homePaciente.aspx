<%@ Page Title="" Language="C#" MasterPageFile="~/Pacientes.master" AutoEventWireup="true" CodeFile="homePaciente.aspx.cs" Inherits="homePaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Paciente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col mt-5">
        <asp:Label CssClass="h1" runat="server" Text="Bienvenido Reikista!" ID="welcometext"></asp:Label>
    </div>
    <div class="col mt-5">
        <asp:Label CssClass="h2" runat="server" Text="" ID="labeletc"></asp:Label>
    </div>
    <div class="col mt-5">
        <asp:Label CssClass="h2" runat="server" Text="Facturas:" ID="labelfac"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="Numero" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" />
            </Columns>
            <HeaderStyle CssClass="table-primary" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="SELECT turnos.id, turnos.fecha, turnos.hora, pagos.nombre, precios.precio FROM turnos INNER JOIN pagos ON turnos.id = pagos.id INNER JOIN precios ON turnos.id = precios.id WHERE turnos.idpaciente ="></asp:SqlDataSource>
    </div>
    <div class="col mt-5">
        <asp:Label CssClass="h2" runat="server" Text="Turnos pendientes:" ID="labelturnos"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:CommandField ShowSelectButton="True"/>
                <asp:BoundField DataField="id" HeaderText="Numero turno" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                <asp:BoundField DataField="idreiki" HeaderText="Reikista" SortExpression="idreiki" />
                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
            </Columns>
            <HeaderStyle CssClass="table-primary"/>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="Select t.id as 'id', t.fecha as 'fecha', t.hora as 'hora', CONCAT(u.nombre,' ',u.apellido) as 'idreiki', t.estado as 'estado' from turnos t inner join usuarios u on t.idreiki = u.id  where t.estado = 'en espera' and t.idpaciente ="></asp:SqlDataSource>
    </div>

</asp:Content>

