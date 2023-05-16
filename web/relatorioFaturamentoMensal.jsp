





<%@page import="dao.ContaReceberDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório de Faturamento Mensal</title>
    </head>
    <body>
        <%  
            
            String ano = request.getParameter( "ano");
            
            if (ano == null || ano ==  ""){
            ano = "2023";
             }
            
            
            byte[] bytes = new ContaReceberDAO().gerarRelatorio(Integer.parseInt(ano));

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();  
            outStream.close();
        %>

    </body>
</html>
