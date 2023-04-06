
package entidade;

import java.time.LocalDateTime;

/*

CREATE TABLE IF NOT EXISTS clientes (
  id_cliente SERIAL NOT NULL,
  nome VARCHAR(150) NULL,
  email VARCHAR(45) NULL,
  rua VARCHAR(50) NULL,
  numero INT NULL,
  complemento VARCHAR(45) NULL,
  cep VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  cidade VARCHAR(45) NULL,
  uf VARCHAR(45) NULL,
  telefone_cel VARCHAR(45) NULL,
  telefone_fixo VARCHAR(45) NULL,
  cpf_cnpj VARCHAR(45) NULL,
  data_alteracao TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (id_cliente)
);

*/

public class Cliente {
    
    private int id;
    private String nome;
    private String email;
    private String rua;
    private int numero;    
    private String complemento;
    private String cep;
    private String bairro;
    private String cidade;
    private String uf;
    private String telefone_cel;
    private String telefone_fixo;
    private String cpf_cnpj;
    private LocalDateTime data_alteracao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getTelefone_cel() {
        return telefone_cel;
    }

    public void setTelefone_cel(String telefone_cel) {
        this.telefone_cel = telefone_cel;
    }

    public String getTelefone_fixo() {
        return telefone_fixo;
    }

    public void setTelefone_fixo(String telefone_fixo) {
        this.telefone_fixo = telefone_fixo;
    }

    public String getCpf_cnpj() {
        return cpf_cnpj;
    }

    public void setCpf_cnpj(String cpf_cnpj) {
        this.cpf_cnpj = cpf_cnpj;
    }

    public LocalDateTime getData_alteracao() {
        return data_alteracao;
    } 
    
    
}
