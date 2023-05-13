

package dao;

import apoio.ConexaoBD;
import apoio.Formatacao;
import apoio.IDAOT;
import entidade.ContaReceber;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class ContaReceberDAO implements IDAOT<ContaReceber> {

    @Override
    public String salvar(ContaReceber o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "insert into projetos "
                    + "(id, id_projeto, valor_fatura,  valor_pendente, data_vencimento, "
                    + "valor_pago, data_pagamento, fatura_fechada) "
                    + "values(default, "
                    + "'" + String.valueOf(o.getIdProjeto())+ "', "
                    + "'" + String.valueOf(o.getValorFatura())+ "', "
                    + "'" + String.valueOf(o.getValorPendente()) + "', "
                    + "to_date('" + String.valueOf(o.getDataVencimento()) + "', 'DD/MM/YYYY'), "
                    + "'" + String.valueOf(o.getValorPago()) + "', "
                    + "to_date('" + String.valueOf(o.getDataPagamento()) + "', 'DD/MM/YYYY'), "
                    + "'" + String.valueOf(o.isFaturaFechada()) + "')";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao inserir cliente: " + e);
            return e.toString();
        }
    }

    @Override
    public String atualizar(ContaReceber o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String excluir(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<ContaReceber> consultarTodos() {
        ArrayList<ContaReceber> contas = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from contas_receber "
                    + "order by data_vencimento";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                ContaReceber conta = new ContaReceber();

                conta.setId(retorno.getInt("id"));
                conta.setIdProjeto(retorno.getInt("id_projeto"));
                conta.setDataFatura(Formatacao.formatarData(retorno.getDate("data_fatura")));
                conta.setDataVencimento(Formatacao.formatarData(retorno.getDate("data_vencimento")));
                conta.setValorFatura(retorno.getDouble("valor_fatura"));
                conta.setValorPendente(retorno.getDouble("valor_pendente"));
                conta.setValorPago(retorno.getDouble("valor_pago"));
                
                Date dataVencimento = retorno.getDate("data_pagamento");
                if (dataVencimento == null) {
                    conta.setDataPagamento("");
                } else {
                    conta.setDataPagamento(Formatacao.formatarData(dataVencimento));
                }
                conta.setFaturaFechada(retorno.getBoolean("fatura_fechada"));

                contas.add(conta);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar contas a receber: " + e);
        }

        return contas;
    }
    

    @Override
    public ArrayList<ContaReceber> consultar(String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ContaReceber consultarId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public String cadastrarContas(BigDecimal[] valores, List<LocalDate> datasVencimento, int idProjeto) {
         try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "insert into contas_receber "
                    + "(id, id_projeto, valor_fatura,  valor_pendente, data_vencimento) "
                    + "values ";
            
            String dados = "";
            for (int i = 0; i < valores.length; i++) {
                double valorFatura = valores[i].doubleValue();
                String dataVencimento = datasVencimento.get(i).toString();
                
                if (i > 0) {
                dados += ", ";
                }
                dados += "(default, "+ idProjeto + ", " + valorFatura + ", " + valorFatura + ", '" + dataVencimento + "')" ;
            }
            sql += dados;


            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao inserir cliente: " + e);
            return e.toString();
        }
    }
    
    public ArrayList<ContaReceber> consultarIdProjeto(int idProjeto) {
        ArrayList<ContaReceber> contas = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from contas_receber "
                    + "where id_projeto = " + idProjeto + " "
                    + "order by data_vencimento";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                ContaReceber conta = new ContaReceber();

                conta.setId(retorno.getInt("id"));
                conta.setIdProjeto(retorno.getInt("id_projeto"));
                conta.setDataFatura(Formatacao.formatarData(retorno.getDate("data_fatura")));
                conta.setDataVencimento(Formatacao.formatarData(retorno.getDate("data_vencimento")));
                conta.setValorFatura(retorno.getDouble("valor_fatura"));
                conta.setValorPendente(retorno.getDouble("valor_pendente"));
                conta.setValorPago(retorno.getDouble("valor_pago"));
                
                Date dataVencimento = retorno.getDate("data_pagamento");
                if (dataVencimento == null) {
                    conta.setDataPagamento("");
                } else {
                    conta.setDataPagamento(Formatacao.formatarData(dataVencimento));
                }
                conta.setFaturaFechada(retorno.getBoolean("fatura_fechada"));

                contas.add(conta);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar contas a receber: " + e);
        }

        return contas;
    }
    
    
    
}
