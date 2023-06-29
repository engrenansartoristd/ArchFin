<%-- 
    Document   : inicio
    Created on : Apr 7, 2023, 12:39:28 AM
    Author     : renan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.SomaMensal"%>
<%@page import="dao.ContaReceberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ArchFin</title>
        <link rel="shortcut icon" href="assets/ico/helmet.ico" type="image/x-icon">

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

            google.charts.load('current', {'packages': ['bar'], 'language': 'pt-BR'});
            google.charts.setOnLoadCallback(updateChart);


            var currency = "real"; // Valor padrão (real)

            // Função para atualizar o gráfico com a cotação selecionada
            function updateChart() {
                var currencySelect = document.getElementById("currencySelect");
                var selectedCurrency = currencySelect.options[currencySelect.selectedIndex].value;

                var options = {
                    chart: {
                        title: 'Totais Mensais (R$)',
                        subtitle: 'Recebido e Pendente',
                    },
                    isStacked: true,
                    vAxis: {format: 'decimal'},
                };

                if (selectedCurrency === 'dolar') {
                    options = {
                        chart: {
                            title: 'Totais Mensais (USD)',
                            subtitle: 'Recebido e Pendente',
                        },
                        isStacked: true,
                        vAxis: {format: 'decimal'},
                    };
                }

                var dataURL = "cotacao.jsp?currency=" + selectedCurrency;
                var req = new XMLHttpRequest();
                req.onreadystatechange = function () {
                    console.log(req.readyState, req.status)
                    if (req.readyState == 4 && req.status == 200) {
                        var somas = JSON.parse(req.responseText);
                        console.log(somas)
                        drawChart(somas, options);
                    }
                };

                req.open("GET", dataURL, true);
                req.send();
            }

            // Função para desenhar o gráfico com os dados fornecidos
            function drawChart(somas, options) {
                var data = google.visualization.arrayToDataTable([
                    ['Mês', 'Recebido', 'Pendente', {role: 'annotation'}],
                    ['1', somas.somas[0].totalPago, somas.somas[0].totalPendente, somas.somas[0].totalFatura],
                    ['2', somas.somas[1].totalPago, somas.somas[1].totalPendente, somas.somas[1].totalFatura],
                    ['3', somas.somas[2].totalPago, somas.somas[2].totalPendente, somas.somas[2].totalFatura],
                    ['4', somas.somas[3].totalPago, somas.somas[3].totalPendente, somas.somas[3].totalFatura],
                    ['5', somas.somas[4].totalPago, somas.somas[4].totalPendente, somas.somas[4].totalFatura],
                    ['6', somas.somas[5].totalPago, somas.somas[5].totalPendente, somas.somas[5].totalFatura],
                    ['7', somas.somas[6].totalPago, somas.somas[6].totalPendente, somas.somas[6].totalFatura],
                    ['8', somas.somas[7].totalPago, somas.somas[7].totalPendente, somas.somas[7].totalFatura],
                    ['9', somas.somas[8].totalPago, somas.somas[8].totalPendente, somas.somas[8].totalFatura],
                    ['10', somas.somas[9].totalPago, somas.somas[9].totalPendente, somas.somas[9].totalFatura],
                    ['11', somas.somas[10].totalPago, somas.somas[10].totalPendente, somas.somas[10].totalFatura],
                    ['12', somas.somas[11].totalPago, somas.somas[11].totalPendente, somas.somas[11].totalFatura]

                ]);

                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
    </head>
    <body>
        <%@include file="menu.jsp"%>            

        <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <div class="card bg-light" style="padding-bottom: 15px; max-width: 1550px; margin: auto;">
                <div class="card-body">
                    <select class="form-select" id="currencySelect">
                        <option value="real" selected>Real</option>
                        <option value="dolar">Dólar</option>
                    </select>
                    <div style="text-align: center;padding-top: 15px;">
                    <input class="btn btn-primary" type="button" value="Atualizar" onclick="updateChart()">
                    </div>
                    <div id="columnchart_material" style="width: 1200px; height: 500px; margin: auto; padding-top: 50px"></div>
                </div>
                
            </div>
        </div>

        

    </body>

    <%@include file="weather.jsp"%>        
</html>

