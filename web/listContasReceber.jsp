

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="entidade.AuxiliarContaReceber"%>
<%@page import="java.util.ArrayList"%>
<%@page import="apoio.Formatacao"%>
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
            String situacao = (String) request.getAttribute("situacao");
            String dataInicio = (String) request.getAttribute("data_inicio");
            String dataFim = (String) request.getAttribute("data_fim");
            
            String retorno = (String) request.getAttribute("retorno");

            if (retorno == null) {
                retorno = "";
            }

        %>
 

        <%--
        
        ------------------------- PARÂMETROS PARA FILTRO-----------------------------------
        --%>


        <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <div>
                <h3 class="text-dark" style="padding-top: 18px;padding-bottom: 0px;margin-bottom: 11px; text-align: center;">Contas a Receber</h3>
            </div>
            <form action="action?a=pesquisarContas" name="formCadastro" method="get">
                <div class="card bg-light" style="padding-bottom: 15px; max-width: 1150px; margin: auto;">
                    <input class="form-text" type="hidden" name="a" value="pesquisarContas">   

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
                                <label class="form-label">Situação</label>
                                <select class="form-select" name="situacao" id="form-select-situacao">
                                    <option value="">Todas</option>
                                    <option value="false">Aberta</option>
                                    <option value="true">Fechada</option>
                                </select>
                                <script>
                                    <% 
                                    if (situacao != null) {
                                    %>
                                    document.getElementById("form-select-situacao").value = "<%= situacao %>";
                                    <% 
                                      }
                                    %>
                                </script>
                            </div>
                        </div>    
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
                                    <% 
                                    if ((dataInicio != null) && (dataInicio != "")){
                                    %>

                                        const dataStr = "<%= dataInicio %>"; // string com a data no formato dd/mm/yyyy
                                        const partesData = dataStr.split("/"); // divide a string em partes separadas por "/"
                                        const data = new Date(partesData[2], partesData[1] - 1, partesData[0]); // cria o objeto Date com as partes da data
                                        $("#calendario").datepicker("setDate", data);
                                    <% 
                                      } else {
                                    %>
                                        const dataAtual = new Date(); // data atual
                                        const primeiroDiaMes = new Date(dataAtual.getFullYear(), dataAtual.getMonth(), 1); // primeiro dia do mês atual
                                        $("#calendario").datepicker("setDate", primeiroDiaMes);
                                    <% 
                                      }
                                    %>
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
                                    <% 
                                             if ((dataFim != null) && (dataFim != "")){
                                    %>

                                        const dataStr = "<%= dataFim %>"; // string com a data no formato dd/mm/yyyy
                                        const partesData = dataStr.split("/"); // divide a string em partes separadas por "/"
                                        const data = new Date(partesData[2], partesData[1] - 1, partesData[0]); // cria o objeto Date com as partes da data
                                        $("#calendario_ate").datepicker("setDate", data);
                                    <% 
                                      } else {
                                    %>
                                        const dataAtual = new Date(); // data atual
                                        const ultimoDiaMes = new Date(dataAtual.getFullYear(), dataAtual.getMonth() + 1, 0); // último dia do mês atual
                                        $("#calendario_ate").datepicker("setDate", ultimoDiaMes);
                                    <% 
                                      }
                                    %>
                                    });

                                </script>
                            </div>
                        </div>    
                    </div>
                </div>
                <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Pesquisar</button></div>
            </form>
            <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px;padding-right: 30px;">
                <%
                if (!retorno.isEmpty()) {
                    if (retorno.contains("Erro")) {
                %>
                <div class="alert alert-danger text-center" role="alert"><span><%= retorno%></span></div>
                        <%
                                } else {
                        %>
                <div class="alert alert-success text-center" role="alert"><span><%= retorno%></span></div>
                        <%
                                }
                        %>

                <%
                    }
                %>
            </div>
        </div>



        <%--

------------------------- TABELA COM RESULTADOS DO FILTRO-----------------------------------
        --%>


        <div class="container-fluid" style="padding-left: 30px; padding-right: 30px; padding-top: 30px">
            <div class="table-responsive" style="max-width: 1600px; margin: auto;">
                <h3 style="text-align: center;">Lista de Conta a Receber</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="font-size: 14px;font-weight: bold;">Id</th>
                            <th style="font-size: 14px;font-weight: bold;">Cliente</th>
                            <th style="font-size: 14px;font-weight: bold;">Projeto</th>
                            <th style="font-size: 14px;font-weight: bold;">Categoria</th>
                            <th style="font-size: 14px;font-weight: bold;">Valor da Fatura</th>
                            <th style="font-size: 14px;font-weight: bold;">Data de Vencimento</th>
                            <th style="font-size: 14px;font-weight: bold;">Data do Pagamento</th>
                            <th style="font-size: 14px;font-weight: bold;">Valor Pago</th>
                            <th style="font-size: 14px;font-weight: bold;">Situação</th>
                            <th style="font-size: 14px;font-weight: bold;text-align: center;">Editar</th>
                            <th style="font-size: 14px;font-weight: bold;text-align: center;">Pagamento</th>
                        </tr>
                    </thead>
                    <tbody>

                        <% 
                            ArrayList<AuxiliarContaReceber> contas = (ArrayList<AuxiliarContaReceber>) request.getAttribute("contas");
                            if (contas != null) {
                                for (int i = 0; i < contas.size(); i++) {                                              
                        %>

                        <tr>
                            <td style="font-size: 14px;"><%= contas.get(i).getId()%></td>
                            <td style="font-size: 14px;"><%= contas.get(i).getNomeCliente()%></td>
                            <td style="font-size: 14px;"><%= contas.get(i).getNomeProjeto()%></td>
                            <td style="font-size: 14px;"><%= contas.get(i).getCategoria()%></td>
                            <td style="font-size: 14px;"><%= Formatacao.formatarMoeda(contas.get(i).getValorFatura())%></td>
                            <td style="font-size: 14px;"><%= contas.get(i).getDataVencimento()%></td>
                            <td style="font-size: 14px;"><%= contas.get(i).getDataPagamento()%></td>
                            <td style="font-size: 14px;"><%= Formatacao.formatarMoeda(contas.get(i).getValorPago())%></td>

                            <%
                                if (contas.get(i).isFaturaFechada()) {
                            %>
                            <td style="font-size: 14px;">Fechada</td>
                            <%
                            } else {
                            %>
                            <td style="font-size: 14px;">Aberta</td>
                            <%
                            }
                            %>

                            <td style="font-size: 14px;text-align: center;">
                                <a class="btn btn-sm" role="button" href="action?a=editarProjeto&id=<%= contas.get(i).getId()%>">
                                    <i class="fa fa-edit" data-bs-toggle="tooltip" title="Editar"></i>
                                </a>
                            </td>
                            <td style="font-size: 14px;text-align: center;">
                                <a class="btn btn-sm" role="button" onclick="expandirLinha('linha<%= i %>')">
                                    <i class="fa fa-money" data-bs-toggle="tooltip" title="Faturas"></i>
                                </a>
                            </td>
                        </tr>

                        <%--
                        
                        Linhas que serão expandidas ao clicar no botão de pagamento
                        --%>
                        <tr id="linha<%= i %>" class="linha-expandida" style="display: none;">
                    <form action="action?a=cadastrarPagamento" name="formCadastroPagamento" method="post">
                        <input class="form-text" type="hidden" readonly="" name="id" value=<%= contas.get(i).getId()%>>     
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>   
                        <td></td>
                        <td> 
                            <input class="form-control" id="calendario_vencimento<%= i %>" name="data_pagamento" required="" type="text" style="max-width: 120px; font-size: 14px" autocomplete="off"/>
                            <script>
                                $(function () {
                                    $("#calendario_vencimento<%= i %>").datepicker({
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

                                    const data = new Date(); // cria o objeto Date com as partes da data
                                    $("#calendario_vencimento<%= i %>").datepicker("setDate", data);

                                });

                            </script>


                        </td>

                        <td colspan="2" style="font-size: 14px;">

                            <input class="form-control" id="valor_pago<%= i %>" onchange="formatarMoeda('valor_pago<%= i %>')" type="text" name="valor_pago" 
                                   oninput="removerNaoNumeros(this)" 
                                   required=""
                                   title="Por favor, preencha este campo obrigatório."
                                   autocomplete="off"
                                   style="max-width: 120px; font-size: 14px">

                            <script>

                                document.getElementById('valor_pago<%= i %>').value = new Intl.NumberFormat("pt-BR", {
                                    style: "currency",
                                    currency: "BRL"
                                }).format(<%= contas.get(i).getValorFatura()%>);
                            </script>
                        </td>

                        <td>
                            <button class="btn btn-primary" type="submit" >Confirmar</button>
                        </td>
                        <td>
                            <button class="btn btn-secondary" type="button" onclick="fecharConfirmacao('linha<%= i %>')">Cancelar</button>
                        </td>

                    </form>

                    </tr>


                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>

                <script>
                    function expandirLinha(linhaId) {
                        var linhaExpandida = document.getElementById(linhaId);
                        linhaExpandida.style.display = "table-row";
                    }

                    function fecharConfirmacao(linhaId) {
                        var linhaExpandida = document.getElementById(linhaId);
                        linhaExpandida.style.display = "none"; // Esconder a linha expandida novamente
                    }

                    function formatarMoeda(idInputValorPago) {
                        const valor = document.getElementById(idInputValorPago).value;
                        const valorFormatado = new Intl.NumberFormat("pt-BR", {
                            style: "currency",
                            currency: "BRL"
                        }).format(parseFloat(valor.replace(",", ".")));
                        document.getElementById(idInputValorPago).value = valorFormatado;
                    }
                    function removerNaoNumeros(input) {
                        input.value = input.value.replace(/[^\d,]/g, "");
                    }
                </script>
            </div>
        </div>      
    </body>
</html>

