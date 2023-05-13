<%-- 
    Document   : cadProjetos
    Created on : Apr 7, 2023, 10:36:59 AM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.Projeto"%>
<%@page import="dao.ProjetoDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="entidade.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
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

        <%
            
            String clienteId = (String) request.getAttribute("cliente");
            String categoriaId = (String) request.getAttribute("categoria");
            String dataInicio = (String) request.getAttribute("data_inicio");
            String dataFim = (String) request.getAttribute("data_fim");

        %>


        <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <div>
                <h3 class="text-dark" style="padding-top: 18px;padding-bottom: 0px;margin-bottom: 11px; text-align: center;">Projetos</h3>
            </div>
            <form action="action?a=pesquisarProjeto" name="formCadastro" method="get">
                <div class="card bg-light" style="padding-bottom: 15px; max-width: 1150px; margin: auto;">
                    <input class="form-text" type="hidden" name="a" value="pesquisarProjeto">   

                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <label class="form-label">Cliente</label>
                                <select class="form-select" name="cliente" id="form-select-cliente">
                                    <option value="">Todos</option>
                                    <%
                                        ArrayList<Cliente> clientes = new ClienteDAO().consultarTodos();
                                        
                                        for (int i = 0; i < clientes.size(); i++) {
                                    %>
                                    <option value=<%= clientes.get(i).getId()%>><%= clientes.get(i).getNome()%></option>
                                    <%
                                        }
                                    %>
                                </select> 
                                <script>

                                    <% 
                                    if (clienteId != null)  {
                                    %>

                                    document.getElementById("form-select-cliente").value = "<%= clienteId %>";
                                    <% 
                                      }
                                    %>

                                </script>
                            </div>
                            <div class="col" style="padding-bottom: 15px;">
                                <label class="form-label">Categoria</label>
                                <select class="form-select" name="categoria" id="form-select-categoria">
                                    <option value="">Todos</option>
                                    <%
                                        ArrayList<Categoria> categorias = new CategoriaDAO().consultarTodos();
                                        
                                        for (int i = 0; i < categorias.size(); i++) {
                                    %>
                                    <option value=<%= categorias.get(i).getId()%>><%= categorias.get(i).getDescricao()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <script>
                                    <% 
                                    if (categoriaId != null) {
                                    %>

                                    document.getElementById("form-select-categoria").value = "<%= categoriaId %>";
                                    <% 
                                      }
                                    %>
                                </script>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col">
                                <label class="form-label">De</label>
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
                                    <% 
                                    if ((dataInicio != null) && (dataInicio != "")){
                                    %>

                                            const dataStr = "<%= dataInicio %>"; // string com a data no formato dd/mm/yyyy
                                            const partesData = dataStr.split("/"); // divide a string em partes separadas por "/"
                                            const data = new Date(partesData[2], partesData[1] - 1, partesData[0]); // cria o objeto Date com as partes da data
                                            $("#calendario").datepicker("setDate", data);
                                    <% 
                                      }
                                    %>
                                    });
                                </script>
                            </div>
                            <div class="col">
                                <label class="form-label">Até</label>
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
                                        <% 
                                             if ((dataFim != null) && (dataFim != "")){
                                        %>

                                            const dataStr = "<%= dataFim %>"; // string com a data no formato dd/mm/yyyy
                                            const partesData = dataStr.split("/"); // divide a string em partes separadas por "/"
                                            const data = new Date(partesData[2], partesData[1] - 1, partesData[0]); // cria o objeto Date com as partes da data
                                            $("#calendario_ate").datepicker("setDate", data);
                                        <% 
                                        }
                                        %>
                                    });

                                </script>
                            </div>
                        </div>    
                    </div>
                </div>
        </div>
        <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Pesquisar</button></div>
    </form> 
</div>

<div class="container-fluid" style="padding-left: 30px; padding-right: 30px; padding-top: 30px">
    <div class="table-responsive" style="max-width: 1600px; margin: auto;">
        <h3 style="text-align: center;">Lista de Projetos</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="font-size: 14px;font-weight: bold;">Id</th>
                    <th style="font-size: 14px;font-weight: bold;">Nome</th>
                    <th style="font-size: 14px;font-weight: bold; max-width: 200px;">Descrição</th>
                    <th style="font-size: 14px;font-weight: bold;">Data do Projeto</th>
                    <th style="font-size: 14px;font-weight: bold;">Cliente</th>
                    <th style="font-size: 14px;font-weight: bold;">Categoria</th>
                    <th style="font-size: 14px;font-weight: bold;">Valor do Contrato</th>
                    <th style="font-size: 14px;font-weight: bold;">Valor Pendente</th>
                    <th style="font-size: 14px;font-weight: bold;text-align: center;">Editar</th>
                    <th style="font-size: 14px;font-weight: bold;text-align: center;">Faturas</th>
                </tr>
            </thead>
            <tbody>

                <% 
                    ArrayList<Projeto> projetos = (ArrayList<Projeto>) request.getAttribute("projetos");
                    if (projetos != null) {
                        for (int i = 0; i < projetos.size(); i++) {                                              
                %>

                <tr>
                    <td style="font-size: 14px;"><%= projetos.get(i).getId()%></td>
                    <td style="font-size: 14px;"><%= projetos.get(i).getNomeProjeto()%></td>
                    <td style="font-size: 14px; max-width: 200px;"><%= projetos.get(i).getDescricao()%></td>
                    <td style="font-size: 14px;"><%= projetos.get(i).getData()%></td>
                    <td style="font-size: 14px;"><%= projetos.get(i).getIdCliente()%> - <%= projetos.get(i).getNomeCliente()%></td>
                    <td style="font-size: 14px;"><%= projetos.get(i).getIdCategoria()%> - <%= projetos.get(i).getNomeCategoria()%></td>
                    <td style="font-size: 14px;"><%= projetos.get(i).getValorContrato()%></td>
                    <td style="font-size: 14px;"><%= projetos.get(i).getValorPendente()%></td>
                    <td style="font-size: 14px;text-align: center;">
                        <a class="btn btn-sm" role="button" href="action?a=editarProjeto&id=<%= projetos.get(i).getId()%>">
                            <i class="fa fa-edit" data-bs-toggle="tooltip" title="Editar"></i>
                        </a>
                    </td>
                    <td style="font-size: 14px;text-align: center;">
                        <a class="btn btn-sm" role="button" href="action?a=cadContasReceber&id=<%= projetos.get(i).getId()%>">
                            <i class="fa fa-barcode" data-bs-toggle="tooltip" title="Faturas"></i>
                        </a>
                    </td>
                </tr>

                <%
                        }
                    }
                %>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
