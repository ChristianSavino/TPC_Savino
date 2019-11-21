<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="viewPrecios.aspx.cs" Inherits="viewPrecios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Lista Precios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Agregar Precios-->
    <div class="col mt-5 card border-primary" style="max-width: 50%; text-align: center; margin-left: 25%;">
      <div class="modal-header">
        <h5 class="modal-title">AGREGAR PRECIO</h5>
      </div>
      <div class="modal-body">
        <div class="input-group mb-3"> 
            <asp:TextBox ID="txtPrecio" runat="server" placeholder="Ejemplo: 100$" required="required" CssClass="form-control" TextMode="Number"></asp:TextBox>
        </div>
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnagregar" runat="server" Text="Agregar" CssClass="btn btn-outline-secondary" OnClick="btnagregar_Click"  />
      </div>
    </div>
</asp:Content>

