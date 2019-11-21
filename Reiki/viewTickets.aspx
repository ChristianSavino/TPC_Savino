<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewTickets.aspx.cs" Inherits="viewTickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>KeruReiki</title>
    <link href="css/ticket.css" rel="stylesheet"/>
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
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <div id="ticket">
        <div class="ticket">
        <b>KERU-REIKI CO.</b><br/>
        Pedro Henriquez Ureña 2251<br/> 
        B1614 Villa de Mayo, Buenos Aires<br/><br/>
        <asp:label runat="server" id="numTicket">TICKET NUMERO: 01</asp:label><br/><br/>
        <span class="fecha">Fecha<br/><asp:label runat="server" id="fechaTicket">18/11/1997</asp:label></span>
        <span class="hora">HORA<br/><asp:label runat="server" id="horaTicket">15:58</asp:label></span><br/><br/><br/>
        <b>IMPORTE TOTAL <asp:label runat="server" id="Monto">$200,00</asp:label></b><br/>
        <div class="footer">
        IVA RESPONSABLE INSCRIPTO A CONSUMIDOR FINAL</div>
        </div>
    </div>
    <input type="button" onclick="printDiv('ticket')" value="IMPRIMIR" style="float:right;margin-top:8px;"/>
    </form>
</body>
</html>
