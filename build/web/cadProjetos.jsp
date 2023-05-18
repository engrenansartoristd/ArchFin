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
    </head>
    <body>
        <%@include file="menu.jsp"%>

        <%
            Projeto projeto = (Projeto) request.getAttribute("projeto");

            if (projeto == null) {
                projeto = new Projeto();
            }
            
             String retorno = (String) request.getAttribute("retorno");

            if (retorno == null) {
                retorno = "";
            }
        %>




        <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <div>
                <h3 class="text-dark" style="padding-top: 18px;padding-bottom: 0px;margin-bottom: 11px; text-align: center;">Cadastro de Projetos</h3>
            </div>
            <form action="action?a=cadastrarProjeto" name="formCadastro" method="post">
                <div class="card bg-light" style="padding-bottom: 15px; max-width: 1150px; margin: auto;">
                    <div class="card-header">

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

                        <h4 style="font-size: 18px;">Campos obrigatórios*</h4>
                        <div class="row">
                            <div class="col">
                                <label class="form-label">ID</label>
                                <input class="form-control" id="id_projeto" name="id" type="text" readonly="" style="max-width: 80px" value="<%= projeto.getId()%>">
                            </div>
                            <div class="col">
                                <label class="form-label">Data do Projeto</label>
                                <input class="form-control" id="data_projeto" type="text" name="data_projeto" style="max-width: 140px" value="<%= projeto.getData()%>">
                                <script>
                                    if (document.getElementById("id_projeto").value === "0") {
                                        document.getElementById("data_projeto").readOnly = true;
                                    } else {
                                        document.getElementById("data_projeto").readOnly = false;
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div style="padding-bottom: 15px;"><label class="form-label">Nome*</label>
                                    <input class="form-control" type="text" required="" maxlength="45" name="nome" title="Por favor, preencha este campo obrigatório." value="<%= projeto.getNomeProjeto()%>">
                                           </div>
                                           </div>
                                           </div>
                                           <div class="row">
                                    <div class="col">
                                        <label class="form-label">Cliente*</label>
                                        <select class="form-select" required="" name="cliente" id="form-select-cliente">
                                            <option value="">Selecione um cliente...</option>
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
                                            if (<%= projeto.getIdCliente()%> === 0) {
                                                document.getElementById("form-select-cliente").value = "";
                                            } else {
                                                document.getElementById("form-select-cliente").value = "<%= projeto.getIdCliente()%>";
                                            }
                                        </script>
                                    </div>
                                    <div class="col" style="padding-bottom: 15px;">
                                        <label class="form-label">Categoria*</label>
                                        <select class="form-select" required="" name="categoria" id="form-select-categoria">
                                            <option value="">Selecione uma categoria...</option>
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
                                            if (<%= projeto.getIdCategoria()%> === 0) {
                                                document.getElementById("form-select-categoria").value = "";
                                            } else {
                                                document.getElementById("form-select-categoria").value = "<%= projeto.getIdCategoria()%>";
                                            }
                                        </script>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col" style="padding-bottom: 15px;">
                                        <label class="form-label">Descrição</label>
                                        <textarea class="form-control form-control-lg"
                                                  minlength="0" maxlength="500" autocomplete="off" name="descricao" style="font-size: 16px" ><%= projeto.getDescricao()%></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col"><label class="form-label">Valor do Contrato*</label>
                                        <input class="form-control" id="valor_contrato" onchange="formatarMoeda()" type="text" name="valor_contrato" 
                                               oninput="removerNaoNumeros(this)" 
                                               required=""
                                               title="Por favor, preencha este campo obrigatório."
                                               autocomplete="off">
                                        
                                        <script>
                                            function formatarMoeda() {
                                                const valor = document.getElementById("valor_contrato").value;
                                                const valorFormatado = new Intl.NumberFormat("pt-BR", {
                                                    style: "currency",
                                                    currency: "BRL"
                                                }).format(parseFloat(valor.replace(",", ".")));
                                                document.getElementById("valor_contrato").value = valorFormatado;
                                            }
                                            function removerNaoNumeros(input) {
                                                input.value = input.value.replace(/[^\d,]/g, "");
                                            }
                                            document.getElementById("valor_contrato").value = new Intl.NumberFormat("pt-BR", {
                                                    style: "currency",
                                                    currency: "BRL"
                                                }).format(<%= projeto.getValorContrato()%>);
                                        </script>
                                    </div>
                                    <div class="col" style="padding-bottom: 15px;"><label class="form-label">Valor Pendente</label>
                                        <input class="form-control" id="valor_pendente" type="text" readonly="" name="valor_pendente" value="<%= projeto.getValorPendente()%>"> 
                                        <script>
                                            document.getElementById("valor_pendente").value = new Intl.NumberFormat("pt-BR", {
                                                    style: "currency",
                                                    currency: "BRL"
                                                }).format(<%= projeto.getValorPendente()%>);
                                            
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Salvar</button></div>
            </form> 
        </div>

        <div class="container-fluid" style="padding-left: 30px; padding-right: 30px;">
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
                            <th style="font-size: 14px;font-weight: bold;text-align: center;">Excluir</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            ArrayList<Projeto> projetos = new ProjetoDAO().consultarTodosExtendido();
                            
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
                                <a class="btn btn-sm" role="button" href="action?a=excluirProjeto&id=<%= projetos.get(i).getId()%>">
                                    <i class="fa fa-trash" data-bs-toggle="tooltip" title="Excluir"></i>
                                </a>
                            </td>
                        </tr>

                        <%
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
