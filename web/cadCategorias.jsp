<%-- 
    Document   : cadCategoria
    Created on : Apr 13, 2023, 8:31:16 PM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            Categoria categoria = (Categoria) request.getAttribute("categoria");

            if (categoria == null) {
                categoria = new Categoria();
            }
            
             String retorno = (String) request.getAttribute("retorno");

            if (retorno == null) {
                retorno = "";
            }
        %>




        <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <div>
                <h3 class="text-dark" style="padding-top: 18px;padding-bottom: 0px;margin-bottom: 11px; text-align: center;">Cadastro de Categorias</h3>
            </div>
            <form action="action?a=cadastrarCategoria" name="formCadastro" method="post">
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
                        <label class="form-label">ID<input class="form-control" name="id" type="text" readonly="" value="<%= categoria.getId()%>"></label>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div style="padding-bottom: 15px;">
                                    <label class="form-label">Descrição*</label>
                                    <input class="form-control" name="descricao" type="text" value="<%= categoria.getDescricao()%>" required title="Por favor, preencha este campo obrigatório.">
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
                <div style="text-align: center;padding-top: 15px;">
                    <button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Salvar</button>
                </div>
            </form>
        </div>

        <div class="container-fluid" style="padding-left: 30px; padding-right: 30px;">
            <div class="table-responsive" style="max-width: 1000px; margin: auto;">
                <h3 style="text-align: center;">Lista de Categorias</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="font-size: 14px;font-weight: bold;">Id</th>
                            <th style="font-size: 14px;font-weight: bold;">Descrição</th>
                            <th style="font-size: 14px;font-weight: bold;text-align: center;">Editar</th>
                            <th style="font-size: 14px;font-weight: bold;text-align: center;">Excluir</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            ArrayList<Categoria> categorias = new CategoriaDAO().consultarTodos();
                            
                            for (int i = 0; i < categorias.size(); i++) {
                        %>

                        <tr>
                            <td style="font-size: 14px;"><%= categorias.get(i).getId()%></td>
                            <td style="font-size: 14px;"><%= categorias.get(i).getDescricao()%></td>
                            <td style="font-size: 14px;text-align: center;">
                                <a class="btn btn-sm" role="button" href="action?a=editarCategoria&id=<%= categorias.get(i).getId()%>">
                                    <i class="fa fa-edit" data-bs-toggle="tooltip" title="Editar"></i>
                                </a>
                            </td>
                            <td style="font-size: 14px;text-align: center;">
                                <a class="btn btn-sm" role="button" href="action?a=excluirCategoria&id=<%= categorias.get(i).getId()%>">
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
