<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>KeruReiki</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .azul{background-color:rgb(32, 156, 238);}
        body{background-color: aliceblue;}
        .container{background-color: white;}
        footer{background-color: white;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="collapse" id="navbarLogin">
            <div class="azul p-4">
                <h5 class="text-white h4">Login</h5>
                <div class="modal-body bg-light">
                  <div class="form-group">
                    <asp:TextBox ID="mail" CssClass="form-control" runat="server" placeholder="Usuario@mail.com" required="required"></asp:TextBox>
                  </div>
                  <div class="form-group">
                    <asp:TextBox ID="pass" CssClass="form-control" runat="server" TextMode="Password" placeholder="Contraseña" required="required"></asp:TextBox>
                  </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-lg btn-block btn-outline-dark" ID="Button2" runat="server" Text="Ingresar" />
                </div>
            </div>
        </div>
        <nav class="navbar navbar-light azul">
          <a class="navbar-brand" style="margin-left:20rem;">霊気</a>
          <div class="form-inline">
            <button class="btn btn-outline-dark my-2 my-sm-0" type="button" data-toggle="collapse" data-target="#navbarLogin" aria-controls="navbarLogin" aria-expanded="false" aria-label="Toggle navigation">Login</button>
            <a class="btn btn-outline-dark my-2 my-sm-0 ml-2" href="Registrarse.aspx">Registrarse</a>
          </div>
        </nav>

    <div class="container">
        <div class="jumbotron mt-5" style="background-image:url('../img/index.jpeg'); background-repeat: no-repeat; background-position: center center; background-size: 100% auto; height:560px">
            <h1 class="text-center" style="margin-top:200px;">KeruReiki</h1>
        </div>
        <div class="align-content-center">
            <div class="row">
                <div class="col-lg-4">
                    <img class="rounded-circle" src="img/R.jpg" alt="..." width="140" height="140" />
                        <h2>Nosotros</h2>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
                <div class="col-lg-4">
                    <img class="rounded-circle" src="img/l.jpg" alt="..." width="140" height="140" />
                        <h2>Nuestro servicio</h2>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
                <div class="col-lg-4">
                    <img class="rounded-circle" src="img/d.jpg" alt="..." width="140" height="140" />
                        <h2>Beneficios</h2>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt mollit anim id est laborum.
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
