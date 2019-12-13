<%@ Page Title="" Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="Parametros.aspx.cs" Inherits="Parametros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col mt-5 mb-2">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">HORARIOS</h5>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <asp:Label CssClass="p" runat="server" Text="Hora Desde:" ID="Label21"></asp:Label>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtdesde" runat="server" placeholder="9" required="required" CssClass="form-control" TextMode="Number" MaxLength ="2"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <asp:Label CssClass="p" runat="server" Text="Hora Hasta:" ID="Label2"></asp:Label>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txthasta" runat="server" placeholder="18" required="required" CssClass="form-control" TextMode="Number" MaxLength ="2"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="btn btn-outline-dark" ID="aceptar" runat="server" OnClick="btnSolicitar_click" Text="ACTUALIZAR" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

