<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrarse.aspx.cs" Inherits="Registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>KeruReiki</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .azul {
            background-color: rgb(32, 156, 238);
        }

        body {
            background-color: aliceblue;
        }

        .container {
            background-color: white;
        }

        footer {
            background-color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light azul">
            <a class="navbar-brand" style="margin-left: 20rem;">霊気</a>
            <div class="form-inline">
                <a class="btn btn-outline-dark my-2 my-sm-0" runat="server" href="index.aspx">Atras</a>
            </div>
        </nav>

        <!--Registro de usuarios-->
        <div class="col mt-5" style="max-width: 50%; text-align: center; margin-left: 25%;">
            <div class="card border-primary">
                <div class="card-body">
                    <h5 class="card-title">REGISTRARSE</h5>
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
                        <asp:Button ID="btnagregar" runat="server" Text="Registrarse" CssClass="btn btn-outline-secondary" OnClick="btnRegistrar_Onclick" />
                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
        <footer class="text-muted mt-2">
            <label class="ml-5">© 2019 - TODOS LOS DERECHOS RESERVADOS</label>
        </footer>
    </form>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
