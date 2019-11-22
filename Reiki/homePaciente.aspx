<%@ Page Title="" Language="C#" MasterPageFile="~/Pacientes.master" AutoEventWireup="true" CodeFile="homePaciente.aspx.cs" Inherits="homePaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Paciente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col mt-5">
                <asp:label CssClass="h1" runat="server" Text="Bienvenido Reikista!" ID="welcometext"></asp:label>

    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
            <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
        </Columns>
        <HeaderStyle CssClass="table-primary" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" SelectCommand="SELECT turnos.id, turnos.fecha, turnos.hora, pagos.nombre, precios.precio FROM turnos INNER JOIN pagos ON turnos.id = pagos.id INNER JOIN precios ON turnos.id = precios.id"></asp:SqlDataSource>
</asp:Content>

