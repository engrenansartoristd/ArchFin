<%-- 
    Document   : relatorioValoresRecebidos
    Created on : May 17, 2023, 9:46:04 PM
    Author     : renan
--%>

<%@page import="dao.ContaReceberDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório de Valores Recebidos por Período</title>
    </head>
    <body>
        <%  
            
            String dataInicio = request.getParameter( "data_inicio");
            String dataFim = request.getParameter( "data_fim");
            
            if (dataInicio == null || dataInicio ==  ""){
            dataInicio = "01/01/2023";
             }
             
             if (dataFim == null || dataFim ==  ""){
            dataFim = "31/12/2023";
             }
            
            
            byte[] bytes = new ContaReceberDAO().gerarRelatorioValoresRecebidos(dataInicio, dataFim);

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();  
            outStream.close();
        %>

    </body>
</html>