<%-- 
    Document   : inicio
    Created on : Apr 7, 2023, 12:39:28 AM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.SomaMensal"%>
<%@page import="dao.ContaReceberDAO"%>
<%@page import="java.util.ArrayList"%>
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
            google.charts.setOnLoadCallback(drawChart);

            <% 
            ArrayList<SomaMensal> somas = new ContaReceberDAO().consultaSomasMensais(2023); 
        
            %>

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                ['Mês', 'Recebido', 'Pendente', { role: 'annotation' }],
            <%
                for (int i = 0; i < somas.size(); i++) {
            %>
                ['<%= somas.get(i).getMes() %>', <%= somas.get(i).getTotalPago() %>, <%= somas.get(i).getTotalPendente() %>, <%= somas.get(i).getTotalFatura() %> ],
            <%
                }
            %>
                ]);

                var options = {
                    chart: {
                        title: 'Totais Mensais',
                        subtitle: 'Recebido e Pendente',
                    },
                    isStacked: true,
                    vAxis: {format: 'currency'},
                };

                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>



    </head>
    <body>
        <%@include file="menu.jsp"%>            

        <div id="columnchart_material" style="width: 1200px; height: 500px; margin: auto; padding-top: 50px"></div>



    </body>
</html>
