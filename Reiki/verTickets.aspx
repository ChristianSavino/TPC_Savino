<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="verTickets.aspx.cs" Inherits="verTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Lista Tickets</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Lista de ticket-->
        <div class="col mt-5">
            <div class="form-inline mb-2" style="margin-left: 84%;">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Savino_DBConnectionString %>" DeleteCommand="DELETE FROM [tickets] WHERE [id] = @original_id AND [idturno] = @original_idturno AND [fecha] = @original_fecha AND [idpago] = @original_idpago AND [idprecio] = @original_idprecio" InsertCommand="INSERT INTO [tickets] ([idturno], [fecha], [idpago], [idprecio]) VALUES (@idturno, @fecha, @idpago, @idprecio)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT tc.id, tc.idturno, tc.fecha, p.nombre, s.precio FROM tickets tc INNER JOIN pagos p ON p.id = tc.idpago INNER JOIN precios s ON s.id = tc.idprecio INNER JOIN turnos t on tc.idturno = t.id WHERE t.idreiki = " UpdateCommand="UPDATE [tickets] SET [idturno] = @idturno, [fecha] = @fecha, [idpago] = @idpago, [idprecio] = @idprecio WHERE [id] = @original_id AND [idturno] = @original_idturno AND [fecha] = @original_fecha AND [idpago] = @original_idpago AND [idprecio] = @original_idprecio">
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="Ticket Numero" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="idturno" HeaderText="Numero Turno" SortExpression="idturno" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                    <asp:BoundField DataField="nombre" HeaderText="Forma Pago" SortExpression="nombre" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" />
                </Columns>
                <HeaderStyle CssClass="table-primary" />
            </asp:GridView>
        </div>
</asp:Content>

