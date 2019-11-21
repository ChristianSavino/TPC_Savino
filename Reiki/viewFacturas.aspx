<%@ Page Title="" Language="C#" MasterPageFile="~/Pacientes.master" AutoEventWireup="true" CodeFile="viewFacturas.aspx.cs" Inherits="viewFacturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Lista de ticket-->
        <div class="col mt-5">
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" DeleteCommand="DELETE FROM [tickets] WHERE [id] = @original_id AND [idturno] = @original_idturno AND [fecha] = @original_fecha AND [idpago] = @original_idpago AND [idprecio] = @original_idprecio" InsertCommand="INSERT INTO [tickets] ([idturno], [fecha], [idpago], [idprecio]) VALUES (@idturno, @fecha, @idpago, @idprecio)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT tickets.id, tickets.fecha, pagos.nombre, precios.precio FROM pacientes INNER JOIN pagos ON pacientes.id = pagos.id INNER JOIN precios ON pacientes.id = precios.id INNER JOIN tickets ON pagos.id = tickets.idpago AND precios.id = tickets.idprecio INNER JOIN turnos ON pacientes.id = turnos.idpaciente AND tickets.idturno = turnos.id" UpdateCommand="UPDATE [tickets] SET [idturno] = @idturno, [fecha] = @fecha, [idpago] = @idpago, [idprecio] = @idprecio WHERE [id] = @original_id AND [idturno] = @original_idturno AND [fecha] = @original_fecha AND [idpago] = @original_idpago AND [idprecio] = @original_idprecio">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int64" />
                    <asp:Parameter Name="original_idturno" Type="Int64" />
                    <asp:Parameter Name="original_fecha" Type="DateTime" />
                    <asp:Parameter Name="original_idpago" Type="Int32" />
                    <asp:Parameter Name="original_idprecio" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idturno" Type="Int64" />
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="idpago" Type="Int32" />
                    <asp:Parameter Name="idprecio" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idturno" Type="Int64" />
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="idpago" Type="Int32" />
                    <asp:Parameter Name="idprecio" Type="Int32" />
                    <asp:Parameter Name="original_id" Type="Int64" />
                    <asp:Parameter Name="original_idturno" Type="Int64" />
                    <asp:Parameter Name="original_fecha" Type="DateTime" />
                    <asp:Parameter Name="original_idpago" Type="Int32" />
                    <asp:Parameter Name="original_idprecio" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                </Columns>
                <HeaderStyle CssClass="table-primary" />
            </asp:GridView>
        </div>
</asp:Content>

