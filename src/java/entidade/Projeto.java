
package entidade;

import apoio.Formatacao;


public class Projeto {
    
    private int id = 0;
    private String nomeProjeto = "";
    private String descricao = "";
    private int idCliente = 0;
    private int idCategoria = 0;
    private double valorContrato = 0.0;
    private double valorPendente = 0.0;
    private String data = Formatacao.getDataAtual();
    
    //Apenas para uso no carregamento da página
    private String nomeCategoria;
    private String nomeCliente;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeProjeto() {
        return nomeProjeto;
    }

    public void setNomeProjeto(String nomeProjeto) {
        this.nomeProjeto = nomeProjeto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public double getValorContrato() {
        return valorContrato;
    }

    public void setValorContrato(double valorContrato) {
        this.valorContrato = valorContrato;
    }

    public double getValorPendente() {
        return valorPendente;
    }

    public void setValorPendente(double valorPendente) {
        this.valorPendente = valorPendente;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }
    
    
      
}
