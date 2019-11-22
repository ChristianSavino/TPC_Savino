<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="viewPacientes.aspx.cs" Inherits="viewPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Pacientes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Registro de usuarios-->
    <div class="col mt-5" style="max-width: 50%; text-align: center; margin-left: 25%;">
        <div class="card border-primary">
            <div class="card-body">
                <h5 class="card-title">AGREGAR PACIENTE</h5>
                <h6 class="card-subtitle mb-2 mb-3 text-muted">Completar todos los campos</h6>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtDni" runat="server" placeholder="Dni" required="required" CssClass="form-control" autofocus="autofocus" TextMode="Number"></asp:TextBox>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" required="required" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" required="required" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtTel" runat="server" placeholder="Tel: 1111-1111" required="required" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtDate" runat="server" placeholder="21/10/2019" required="required" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="input-group mb-3">
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="custom-select"></asp:DropDownList>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtMail" runat="server" placeholder="Email@mail.com" required="required" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtClave" runat="server" placeholder="Clave" required="required" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnagregar" runat="server" Text="Agregar" CssClass="btn btn-outline-secondary" OnClick="btnagregar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

