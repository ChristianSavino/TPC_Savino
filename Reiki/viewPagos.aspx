<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="viewPagos.aspx.cs" Inherits="viewPagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Pagos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Agregar Pago-->
    <div class="col mt-5 card border-primary" style="max-width: 50%; text-align: center; margin-left: 25%;">
      <div class="modal-header">
        <h5 class="modal-title">AGREGAR PAGO</h5>
      </div>
      <div class="modal-body">
        <div class="input-group mb-3">
            <asp:DropDownList ID="ddlPaciente" runat="server" CssClass="custom-select"></asp:DropDownList>
        </div>
        <div class="input-group mb-3">
            <asp:DropDownList ID="ddlTipoPago" runat="server" CssClass="custom-select"></asp:DropDownList>
        </div>
        <div class="input-group mb-3"> 
            <asp:DropDownList ID="ddlPago" runat="server" CssClass="custom-select"></asp:DropDownList> 
        </div>
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnagregar" runat="server" Text="Agregar" CssClass="btn btn-outline-secondary" OnClick="btnagregar_Click" />
      </div>
    </div>
</asp:Content>

