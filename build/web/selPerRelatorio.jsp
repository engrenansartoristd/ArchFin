<%-- 
    Document   : selPerRelatorio
    Created on : May 17, 2023, 9:39:53 PM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ArchFin</title>
        <link rel="shortcut icon" href="assets/ico/helmet.ico" type="image/x-icon">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
        <link rel="stylesheet" href="assets/css/Menu-dropdown-xl.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        
        <link rel="stylesheet" href="assets/jquery-ui-1.13.2.custom/jquery-ui.css">
        <script src="assets/js/jquery-3.6.4.min.js"></script>
        <script src="assets/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
    </head>
    <body>
        <%@include file="menu.jsp"%>



        <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <form action="relatorioValoresRecebidos.jsp" target="_blank" name="formCadastro" method="get">
                <div class="card bg-light" style="padding-bottom: 15px; max-width: 1150px; margin: auto;">

                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <label class="form-label">De <span class="fa fa-calendar"></span> </label>
                                <div class="input-group">
                                    <input class="form-control" id="calendario" name="data_inicio" type="text" autocomplete="off"/>
                                </div>
                                <script>
                                    $(function () {
                                        $("#calendario").datepicker({
                                            dateFormat: 'dd/mm/yy',
                                            closeText: "Fechar",
                                            prevText: "&#x3C;Anterior",
                                            nextText: "Próximo&#x3E;",
                                            currentText: "Hoje",
                                            monthNames: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
                                            monthNamesShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
                                            dayNames: ["Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"],
                                            dayNamesShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
                                            dayNamesMin: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
                                            weekHeader: "Sm",
                                            firstDay: 1
                                        });
         
                                        const dataAtual = new Date(); // data atual
                                        const primeiroDiaMes = new Date(dataAtual.getFullYear(), dataAtual.getMonth(), 1); // primeiro dia do mês atual
                                        $("#calendario").datepicker("setDate", primeiroDiaMes);

                                    });
                                </script>
                            </div>
                            <div class="col">
                                <label class="form-label">Até <span class="fa fa-calendar"></span> </label>
                                <input class="form-control" id="calendario_ate" name="data_fim" type="text"  autocomplete="off"/>
                                <script>
                                    $(function () {
                                        $("#calendario_ate").datepicker({
                                            dateFormat: 'dd/mm/yy',
                                            closeText: "Fechar",
                                            prevText: "&#x3C;Anterior",
                                            nextText: "Próximo&#x3E;",
                                            currentText: "Hoje",
                                            monthNames: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
                                            monthNamesShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
                                            dayNames: ["Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"],
                                            dayNamesShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
                                            dayNamesMin: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
                                            weekHeader: "Sm",
                                            firstDay: 1
                                        });
  
                                        const dataAtual = new Date(); // data atual
                                        const ultimoDiaMes = new Date(dataAtual.getFullYear(), dataAtual.getMonth() + 1, 0); // último dia do mês atual
                                        $("#calendario_ate").datepicker("setDate", ultimoDiaMes);

                                    });

                                </script>
                            </div>
                        </div>    

                    </div>
                </div>
                <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Gerar Relatório</button></div>
            </form> 
        </div>

    </body>
</html>
