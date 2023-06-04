<%-- 
Document   : barra_menu
Created on : Apr 6, 2023, 7:30:25 PM
Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.Usuario"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <%
            HttpSession sessao = request.getSession();
            Usuario usuario = (Usuario) sessao.getAttribute("user");
            if (usuario == null) {
                response.sendRedirect("index.jsp");
            }
        
        %>





        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ArchFin</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
        <link rel="stylesheet" href="assets/css/Menu-dropdown-xl.css">
    </head>

    <body>
        <nav class="navbar navbar-dark navbar-expand-md bg-dark py-3" style="margin: auto">
            <div class="container"><a class="navbar-brand d-flex align-items-center" href="#"></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-6"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse flex-grow-0 order-md-first" id="navcol-6">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link active" href="inicio.jsp">Início</a></li>
                        <li class="nav-item"><a class="nav-link active" href="listProjetos.jsp">Projetos</a></li>
                        <li class="nav-item"><a class="nav-link active" href="listContasReceber.jsp">Contas a Receber</a></li>
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link active" aria-expanded="false" data-bs-toggle="dropdown" href="#">Cadastrar</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="cadClientes.jsp">Clientes</a>
                                <a class="dropdown-item" href="cadCategorias.jsp">Categorias</a>
                                <a class="dropdown-item" href="cadProjetos.jsp">Projetos</a>
                            </div>
                        </li> 
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link active" aria-expanded="false" data-bs-toggle="dropdown" href="#">Relatórios</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="selAnoRelatorio.jsp">Faturamento Mensal</a>
                                <a class="dropdown-item" href="selPerRelatorio.jsp">Valores Recebidos por Período</a>
                                <a class="dropdown-item" href="selAnoRelatorioProjetos.jsp">Quantidade de Projetos por Categoria</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="d-none d-md-block"><a class="btn btn-primary" role="button" href="action?a=logout">Sair</a></div>
            </div>
        </nav>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>

</html>
