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
                        <li class="nav-item"><a class="nav-link" href="#">Segundo Menu</a></li>
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link active" aria-expanded="false" data-bs-toggle="dropdown" href="#">Cadastros</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="cadClientes.jsp">Clientes</a>
                                <a class="dropdown-item" href="cadCategorias.jsp">Categorias</a>
                                <a class="dropdown-item" href="#">Third Item</a>
                            </div>
                        </li>
                    </ul>
                    <div class="d-md-none my-2"><button class="btn btn-light me-2" type="button">Button</button><button class="btn btn-primary" type="button">Button</button></div>
                </div>
                <div class="d-none d-md-block"><a class="btn btn-primary" role="button" href="action?a=logout">Sair</a></div>
            </div>
        </nav>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>

</html>
