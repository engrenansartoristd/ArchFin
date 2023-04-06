<%-- 
    Document   : index
    Created on : Mar 30, 2023, 10:24:15 PM
    Author     : renan
--%>
<%@page import="apoio.ConexaoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <h1>Hello World!</h1>
     
       <body>
        <h2>Bem-vindo</h2>

        <form action="action?a=login" name="login" method="post">
            <label for="fname">Usuário</label><br>
            <input type="text" id="user" name="user"><br>

            <label for="lname">Senha</label><br>
            <input type="text" id="passwd" name="passwd"> <br> <br>

            <input type="submit" value="Acessar">
        </form>

    </body>
    
</html>
