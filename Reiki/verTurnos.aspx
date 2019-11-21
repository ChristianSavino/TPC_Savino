<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="verTurnos.aspx.cs" Inherits="verTurnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Lista Turnos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--VER TURNOS-->
     <div class="col mt-5">
        <div class="form-inline mb-2" style="margin-left: 84%;">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
        </div>
        <%--<table id="eventos-table" class="table table-hover">--%>
            <asp:GridView ID="gvturnos" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="dni" HeaderText="dni" SortExpression="dni" ReadOnly="True" />
                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" ReadOnly="True" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" ReadOnly="True" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" ReadOnly="True" />
                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" ReadOnly="True" />
                    <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" ReadOnly="True" />
                    <%--<asp:BoundField DataField="idreiki" HeaderText="idreiki" SortExpression="idreiki" ReadOnly="True" />--%>
                    <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" ApplyFormatInEditMode="True" />
                </Columns>
                <HeaderStyle CssClass="table-primary" />
         </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" DeleteCommand="DELETE FROM [turnos] WHERE [id] = @original_id AND [fecha] = @original_fecha AND [hora] = @original_hora AND [idpaciente] = @original_idpaciente AND [idreiki] = @original_idreiki AND [estado] = @original_estado" InsertCommand="INSERT INTO [turnos] ([fecha], [hora], [idpaciente], [idreiki], [estado]) VALUES (@fecha, @hora, @idpaciente, @idreiki, @estado)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [turnos] t INNER JOIN pacientes p ON p.id=t.idpaciente" UpdateCommand="UPDATE [turnos] SET [estado] = @estado WHERE [id] = @original_id">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int64" />
                    <asp:Parameter DbType="Date" Name="original_fecha" />
                    <asp:Parameter DbType="Time" Name="original_hora" />
                    <asp:Parameter Name="original_idpaciente" Type="Int32" />
                    <asp:Parameter Name="original_idreiki" Type="Int32" />
                    <asp:Parameter Name="original_estado" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="fecha" />
                    <asp:Parameter DbType="Time" Name="hora" />
                    <asp:Parameter Name="idpaciente" Type="Int32" />
                    <asp:Parameter Name="idreiki" Type="Int32" />
                    <asp:Parameter Name="estado" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <%--<asp:Parameter DbType="Date" Name="fecha" />
                    <asp:Parameter DbType="Time" Name="hora" />
                    <asp:Parameter Name="idpaciente" Type="Int32" />
                    <asp:Parameter Name="idreiki" Type="Int32" />--%>
                    <asp:Parameter Name="estado" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int64" />
                    <asp:Parameter DbType="Date" Name="original_fecha" />
                    <asp:Parameter DbType="Time" Name="original_hora" />
                    <asp:Parameter Name="original_idpaciente" Type="Int32" />
                    <%--<asp:Parameter Name="original_idreiki" Type="Int32" />--%>
                    <asp:Parameter Name="original_estado" Type="String" />
                </UpdateParameters>
         </asp:SqlDataSource>

    </div>
</asp:Content>

