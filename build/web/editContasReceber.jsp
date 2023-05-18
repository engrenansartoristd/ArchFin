<%-- 
    Document   : editContasReceber
    Created on : May 11, 2023, 7:30:34 PM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    
    
    <div class="container-fluid" style="padding-left: 30px;padding-bottom: 0px;margin-bottom: 10px;padding-right: 30px;">
            <div>
                <h3 class="text-dark" style="padding-top: 18px;padding-bottom: 0px;margin-bottom: 11px; text-align: center;">Cadastro de Contas a Receber</h3>
            </div>
            <form action="action?a=cadastrarFaturas" name="formCadastro" method="post">
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
                        <label class="form-label">ID<input class="form-control" name="id" type="text" readonly="" value="<%= conta.getId()%>"></label>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div style="padding-bottom: 15px;">
                                    <label class="form-label">ID Projeto*</label>
                                    <input class="form-control" name="id_projeto" type="text" value="<%= conta.getIdProjeto()%>" readonly="">
                                </div>
                            </div>
                            <div class="col">
                                <div style="padding-bottom: 15px;">
                                    <label class="form-label">Data da Fatura*</label>
                                    <input class="form-control" name="data_fatura" type="text" value="<%= conta.getDataFatura()%>" readonly="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="form-label">Valor da Fatura</label>
                                <input class="form-control" id="valor_fatura" onchange="formatarMoeda()" type="text" name="valor_fatura" 
                                       oninput="removerNaoNumeros(this)" 
                                       required=""
                                       title="Por favor, preencha este campo obrigatório."
                                       autocomplete="off">

                                <script>
                                    function formatarMoeda() {
                                        const valor = document.getElementById("valor_fatura").value;
                                        const valorFormatado = new Intl.NumberFormat("pt-BR", {
                                            style: "currency",
                                            currency: "BRL"
                                        }).format(parseFloat(valor.replace(",", ".")));
                                        document.getElementById("valor_fatura").value = valorFormatado;
                                    }
                                    function removerNaoNumeros(input) {
                                        input.value = input.value.replace(/[^\d,]/g, "");
                                    }
                                    document.getElementById("valor_fatura").value = new Intl.NumberFormat("pt-BR", {
                                        style: "currency",
                                        currency: "BRL"
                                    }).format(<%= conta.getValorFatura()%>);
                                </script>
                            </div>
                            <div class="col" style="padding-bottom: 15px;"><label class="form-label">Valor Pendente</label>
                                <input class="form-control" id="valor_pendente" type="text" readonly="" name="valor_pendente" value="<%= conta.getValorPendente()%>"> 
                                <script>
                                    document.getElementById("valor_pendente").value = new Intl.NumberFormat("pt-BR", {
                                        style: "currency",
                                        currency: "BRL"
                                    }).format(<%= conta.getValorPendente()%>);

                                </script>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Salvar</button></div>
            </form>
        </div>
    
    
    
    
</html>
