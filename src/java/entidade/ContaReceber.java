
package entidade;

import apoio.Formatacao;

public class ContaReceber {
    
    private int id;
    private int idProjeto;
    private String dataFatura = Formatacao.getDataAtual();
    private String dataVencimento = "";
    private double valorFatura;
    private double valorPendente;
    private double valorPago;
    private String dataPagamento = "";
    private boolean faturaFechada;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProjeto() {
        return idProjeto;
    }

    public void setIdProjeto(int idProjeto) {
        this.idProjeto = idProjeto;
    }

    public String getDataFatura() {
        return dataFatura;
    }

    public void setDataFatura(String dataFatura) {
        this.dataFatura = dataFatura;
    }

    public String getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(String dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    public double getValorFatura() {
        return valorFatura;
    }

    public void setValorFatura(double valorFatura) {
        this.valorFatura = valorFatura;
    }

    public double getValorPendente() {
        return valorPendente;
    }

    public void setValorPendente(double valorPendente) {
        this.valorPendente = valorPendente;
    }

    public double getValorPago() {
        return valorPago;
    }

    public void setValorPago(double valorPago) {
        this.valorPago = valorPago;
    }

    public String getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(String dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public boolean isFaturaFechada() {
        return faturaFechada;
    }

    public void setFaturaFechada(boolean faturaFechada) {
        this.faturaFechada = faturaFechada;
    }
    
    
    
}
