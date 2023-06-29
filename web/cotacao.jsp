<%-- 
    Document   : cotacao
    Created on : 28 de jun. de 2023, 22:29:40
    Author     : re_sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.InputStreamReader" %>
<%@page import="java.net.URL" %>
<%@page import="java.net.HttpURLConnection" %>
<%@page import="java.io.IOException" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.SomaMensal"%>
<%@page import="dao.ContaReceberDAO"%>
<%@page import="com.google.gson.Gson"%>
        <%
            String currencyParam = request.getParameter("currency"); // Obter o valor do parâmetro "currency" da URL
        
            String currency = "BRL";
            if (currencyParam != null && currencyParam.equals("dolar")) {
                currency = "USD";
            }

            // URL da API de cotação
            String url = "https://api.exchangerate-api.com/v4/latest/" + currency;

            try {
                URL apiURL = new URL(url);
                HttpURLConnection connection = (HttpURLConnection) apiURL.openConnection();

                connection.setRequestMethod("GET");

                // Ler a resposta da API
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;
                StringBuilder resposta = new StringBuilder();
                while ((line = reader.readLine()) != null) {
                    resposta.append(line);
                }
                reader.close();

                // Extrair a cotação da resposta
                String jsonResponse = resposta.toString();
                double exchangeRate = Double.parseDouble(jsonResponse.split("\"BRL\":")[1].split(",")[0]);

                // Calcular os dados atualizados para o gráfico
                ArrayList<SomaMensal> somas = new ContaReceberDAO().consultaSomasMensais(2023);
                for (SomaMensal soma : somas) {
                    soma.setTotalPago(soma.getTotalPago() / exchangeRate);
                    soma.setTotalPendente(soma.getTotalPendente() / exchangeRate);
                    soma.setTotalFatura(soma.getTotalFatura() / exchangeRate);
                }

                // Converter os dados para um formato que pode ser enviado como resposta
                Map<String, Object> data = new HashMap<>();
                data.put("somas", somas);

                // Enviar os dados como resposta no formato JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(new Gson().toJson(data));

            } catch (IOException e) {
                e.printStackTrace();
            }
        %>

