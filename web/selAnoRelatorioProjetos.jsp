<%-- 
    Document   : selAnoRelatorioProjetos
    Created on : May 17, 2023, 11:12:36 PM
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
            <form action="relatorioProjetosCategoria.jsp" target="_blank" name="formCadastro" method="get">
                <div class="card bg-light" style="padding-bottom: 15px; max-width: 1150px; margin: auto;">

                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <label class="form-label">Selecione o ano do relatório</label>
                                <select class="form-select" name="ano" id="form-select-cliente">
                                    <option value='2020'>2020</option>
                                    <option value='2021'>2021</option>
                                    <option value='2022'>2022</option>
                                    <option value='2023'>2023</option>
                                    <option value='2024'>2024</option>
                                    <option value='2025'>2025</option>
                                    <option value='2026'>2026</option>
                                    <option value='2027'>2027</option>
                                    <option value='2028'>2028</option>
                                    <option value='2029'>2029</option>
                                    <option value='2030'>2030</option>

                                </select> 

                            </div>

                        </div>    

                    </div>
                </div>
                <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Gerar Relatório</button></div>
            </form> 
        </div>

    </body>
</html>

