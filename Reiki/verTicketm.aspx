<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verTicketm.aspx.cs" Inherits="verTicketm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ticket</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-barcode.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Print js -->
    <script type="text/javascript">
        function printDiv(nombreDiv) {
            var contenido = document.getElementById(nombreDiv).innerHTML;
            var contenidoOriginal = document.body.innerHTML;
            document.body.innerHTML = contenido;
            window.print();
            document.body.innerHTML = contenidoOriginal;
        }
        window.onresize = function () {
            window.resizeTo(320, 500);
        }
        window.onclick = function () {
            window.resizeTo(320, 500);
        }
        $(function () {
            //$("#barcode").barcode("1234567890128", "ean13");
            $("#barcode").barcode("1234567890128", "ean13",{barWidth:2, barHeight:30});
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 26px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="ticket">
        <div class="col mt-2" style="max-width: 50%; margin-left: 25%; text-align:center;">
            <div class="card border-primary" style="border-bottom-width: 5px; border-left-width: 3px;">
                    
                <table class="w-100">
                    <tr>
                        <td class="text-left"><b>KERU-REIKI CO.</b> </td>
                        <td class="text-center"><strong>B</strong></td>
                        <td class="text-right"><strong>FACTURA </strong><asp:Label ID="lblNumero" runat="server">2020202020</asp:Label></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="text-left">Pedro Henriquez Ureña 2251<br />
                            B1614 Villa de Mayo, Buenos Aires<br />
                            Tel: 0888-111-333<br />
                            <br />
                            IVA Responsable inscripto</td>
                        <td>&nbsp;</td>
                        <td class="text-right"><strong>Fecha de Vto: </strong>15/11/2020<br />
                            <strong>Fecha de emicion: </strong><asp:Label ID="lblFecha" runat="server">22/11/2019</asp:Label><br />
                            <br />
                            CUIT:202020202020<br />
                            ING.BRUTO:202020-20<br />
                            INICIO DE ACTIVIDAD: 01/01/2019</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="text-left"><strong>DATOS DEL CLIENTES<br />
                            CUENTA: </strong><asp:Label ID="lblId" runat="server">#1</asp:Label><strong><br />
                            </strong><asp:Label ID="lblNombre" runat="server">Parrota Fede</asp:Label></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">TOTAL A PAGAR <asp:Label ID="lblTotal" runat="server">$1500</asp:Label></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <div id="barcode"></div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                    
            </div>
        </div>
    </div>
    <input type="button" onclick="printDiv('ticket')" value="IMPRIMIR" style="float:right;margin-top:8px;"/>
    </form>
    
</body>
</html>
