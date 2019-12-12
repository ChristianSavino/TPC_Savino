<%@ Page Language="C#" MasterPageFile="~/Reiki.master" AutoEventWireup="true" CodeFile="Formulario.aspx.cs" Inherits="Formulario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Reiki</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div class="row">
                <div class="col-lg-8 mt-2">
                    <div class="card mb-3 ml-1">
                        <div class="card-header">Recaudacion por mes</div>
                        <div class="card-body">
                            <canvas id="myBarChart" width="100%" height="50"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-2">
                    <div class="card mb-3 mr-1">
                        <div class="card-header">Pacientes por sexo</div>
                        <div class="card-body">
                            <canvas id="myPieChart" width="100%" height="100"></canvas>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
