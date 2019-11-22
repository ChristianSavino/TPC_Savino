<%@ Page Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="Formulario.aspx.cs" Inherits="Formulario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Reiki</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/Chart.min.js"></script>
    <body>
            <div class="row">
                <div class="col-lg-8">
                    <div class="card mb-3 ml-1">
                        <div class="card-header">Recaudacion por mes</div>
                        <div class="card-body">
                            <canvas id="myBarChart" width="100%" height="50"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card mb-3 mr-1">
                        <div class="card-header">Pacientes por sexo</div>
                        <div class="card-body">
                            <canvas id="myPieChart" width="100%" height="100"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        <script>
            var ctx = document.getElementById("myBarChart");
            var myLineChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ["Julio", "Agosto", "Septiembre", "Octubre", "Nobiembre", "Diciembre"],
                    datasets: [{
                        label: "Total",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: <% =this.ChartData1 %>,
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'month'
                        },
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            maxTicksLimit: 6
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 1500,
                            maxTicksLimit: 5
                        },
                        gridLines: {
                            display: true
                        }
                    }],
                },
                legend: {
                    display: false
                }
            }
        });

        //Torta chart 
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ["Femenino", "Masculino"],
                datasets: [{
                    backgroundColor: ['#007bff', '#dc3545'],
                    //data: [1, 2],
                    data: <% =this.ChartData2 %>,
                }],
            },
        });
        </script>
    </body>
    </html>
</asp:Content>
