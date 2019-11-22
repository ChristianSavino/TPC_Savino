<%@ Page Title="" Language="C#" MasterPageFile="~/Pacientes.master" AutoEventWireup="true" CodeFile="viewSolicitar.aspx.cs" Inherits="viewSolicitar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Solicitar Turnos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Dar turnos-->
    <div class="col mt-5 mb-2">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">SOLICITAR TURNO</h5>
                </div>
                <div class="modal-body">
                    <%--<div class="input-group mb-3">
                    <asp:DropDownList ID="ddlPacientes" runat="server" CssClass="custom-select" required="required" autofocus="autofocus"></asp:DropDownList>             
                </div>--%>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtFecha" runat="server" placeholder="21/10/2019" required="required" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtTime" runat="server" placeholder="10:00" required="required" CssClass="form-control" TextMode="Time"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <asp:DropDownList ID="ddlUsuario" runat="server" CssClass="custom-select"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-outline-dark" ID="Button1" runat="server" OnClick="btnSolicitar_click" Text="SOLICITAR" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

