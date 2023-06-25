package controle;

import apoio.Formatacao;
import dao.ContaReceberDAO;
import dao.ProjetoDAO;
import entidade.AuxiliarContaReceber;
import entidade.ContaReceber;
import entidade.Projeto;
import jakarta.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import negocio.Parcelamento;

/**
 *
 * @author renan
 */
public class ContaReceberControle {

    public String criarContasReceber(HttpServletRequest request) {

        String retorno;

        int id = Integer.parseInt(request.getParameter("id_projeto"));
        String dataVencimento = request.getParameter("data_vencimento");
        
        String valorFaturaString = request.getParameter("valor_total");
        double valorTotal = Formatacao.removerFormatacaoMoeda(valorFaturaString);
        
        int qtdeParcelas = Integer.parseInt(request.getParameter("qtde_parcelas"));

        //Calcular parcelas 
        BigDecimal[] parcelas = Parcelamento.calcularParcelas(new BigDecimal(valorTotal), qtdeParcelas);

        
        //Calular datas de vencimento
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.forLanguageTag("pt-BR"));
        LocalDate dataInicial = LocalDate.parse(dataVencimento, formatter);
        List<LocalDate> datasVencimento = Parcelamento.calcularDatasVencimento(dataInicial, qtdeParcelas);
        
        retorno = new ContaReceberDAO().cadastrarContas(parcelas, datasVencimento, id);
        
        return retorno;

    }
    
    public ArrayList<AuxiliarContaReceber> consultar(String cliente, String faturaFechada, String dataInicio, String dataFim) {
        
        String criterio = "";
        
        if (!cliente.equals("") ){
            criterio = criterio + " and pr.id_cliente = " + cliente; 
        } 
        
        if (!faturaFechada.equals("") ){
            criterio = criterio + " and cr.fatura_fechada = " + faturaFechada;  
        } 
        
        if (!dataInicio.equals("") ){
            criterio = criterio + " and cr.data_vencimento >= to_date('" + dataInicio + "', 'DD/MM/YYYY')";
        } 
        
        if (!dataFim.equals("") ){
            criterio = criterio + " and data_vencimento <= to_date('" + dataFim + "', 'DD/MM/YYYY')";
        } 

        ArrayList<AuxiliarContaReceber>  projetos = new ContaReceberDAO().consultarComFiltro(criterio);
        
        return projetos;
    }
    
    public String cadastarPagamento(HttpServletRequest request) {
        
        String retorno;
        
        int id = Integer.parseInt(request.getParameter("id"));
        String dataPagamento = request.getParameter("data_pagamento");
        double valorPago = Formatacao.removerFormatacaoMoeda(request.getParameter("valor_pago"));
        
        ContaReceber conta = new ContaReceberDAO().consultarId(id);
        double valorFatura = conta.getValorFatura();
  
        double valorPendenteAtual = valorFatura - valorPago;
        
        //Atualiza banco de dados com os dados do pagamento
        retorno = new ContaReceberDAO().cadastrarPagamento(id, dataPagamento, valorPago, valorPendenteAtual, true);
        
        if (retorno == null) {
            Projeto projeto =  new ProjetoDAO().consultarId(conta.getIdProjeto());
            
            double somaValorPago = new ContaReceberDAO().consultaSomaValoresPagosProjeto(conta.getIdProjeto());
            
            double valorPendenteProjeto = projeto.getValorContrato() - somaValorPago;
            
            retorno = new ProjetoDAO().atualizarValorPendente(conta.getIdProjeto(), valorPendenteProjeto);        
            
        }
        
        return retorno;
        
    }

}
