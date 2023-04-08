<%-- 
    Document   : cadClientes
    Created on : Apr 7, 2023, 10:36:59 AM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.Cliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ArchFin</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
        <link rel="stylesheet" href="assets/css/Menu-dropdown-xl.css">
    </head>
    <body>
        <%@include file="menu.jsp"%>

        <%
            Cliente cliente = (Cliente) request.getAttribute("cliente");

            if (cliente == null) {
                cliente = new Cliente();
            }
            
             String retorno = (String) request.getAttribute("retorno");

            if (retorno == null) {
                retorno = "";
            }
        %>




        <div class="container-fluid" style="padding-left: 0px;padding-bottom: 0px;margin-bottom: 499px;margin-left: 25px;padding-right: 50px;">
            <div>
                <h3 class="text-dark" style="padding-top: 18px;padding-bottom: 0px;margin-bottom: 11px;">Cadastro de Clientes</h3>
            </div>
            <form action="action?a=cadastrarCliente" name="formCadastro" method="post">
                <div class="card" style="padding-bottom: 15px;">
                    <div class="card-header">

                        <%
                            if (!retorno.isEmpty()) {
                                if (retorno.contains("Erro")) {
                        %>
                                    <div class="alert alert-danger text-center" role="alert"><span>Erro ao salvar registro!</span></div>
                        <%
                                } else {
                        %>
                                    <div class="alert alert-success text-center" role="alert"><span>Registro salvo com sucesso!</span></div>
                        <%
                                }
                        %>

                        <%
                            }
                        %>




                        <h4 style="font-size: 18px;">Campos obrigatórios*</h4>
                        <label class="form-label">ID<input class="form-control" name="id" type="text" readonly="" value="<%= cliente.getId()%>"></label>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div style="padding-bottom: 15px;">
                                    <label class="form-label">Nome*</label><input class="form-control" name="nome" type="text" required=""></div>
                            </div>
                            <div class="col">
                                <div style="padding-bottom: 15px;"><label class="form-label">Email*</label><input class="form-control" name="email" type="email" required=""></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-3">
                                <div style="padding-bottom: 15px;"><label class="form-label">CPF/CNPJ*</label><input class="form-control" name="cpf_cnpj" type="text" placeholder="&quot;000.000.000-00 / 00.000.000/0000-00&quot;" required="" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}"></div>
                            </div>
                            <div class="col">
                                <div><label class="form-label">Telefone Celular</label><input class="form-control" name="telefone_cel" type="tel"></div>
                            </div>
                            <div class="col">
                                <div><label class="form-label">Telefone Fixo</label><input class="form-control" name="telefone_fixo" type="tel"></div>
                            </div>
                        </div>
                        <div class="row" style="padding: 0px;padding-right: 0px;padding-bottom: 15px;">
                            <div class="col-xl-6"><label class="form-label">Rua*</label><input class="form-control" name="rua" type="text" required=""></div>
                            <div class="col"><label class="form-label">Número*</label><input class="form-control" name="numero" type="text" required=""></div>
                            <div class="col"><label class="form-label">Complemento</label><input class="form-control" name="complemento" type="text"></div>
                        </div>
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col"><label class="form-label">Bairro*</label><input class="form-control" name="bairro" type="text" required=""></div>
                            <div class="col"><label class="form-label">CEP*</label><input class="form-control" name="cep" type="text" required="" pattern="^\d{5}-?\d{3}$" placeholder="00000-000"></div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="form-label">Cidade*</label><input class="form-control" name="cidade" type="text" required=""></div>
                            <div class="col"><label class="form-label">Estado</label><select class="form-select" name="uf" required="">
                                    <option value="">Selecione um estado</option>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select></div>
                        </div>
                    </div>
                </div>
                <div style="text-align: center;padding-top: 15px;"><button class="btn btn-primary" type="submit" style="text-align: center;margin-right: 2px;width: 140px;height: 51px;">Salvar</button></div>
            </form>
        </div>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>