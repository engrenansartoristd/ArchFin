

package dao;

import apoio.ConexaoBD;
import apoio.Formatacao;
import apoio.IDAOT;
import entidade.AuxiliarContaReceber;
import entidade.ContaReceber;
import entidade.SomaMensal;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;



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
        
        ContaReceber conta = new ContaReceber();
        
        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from contas_receber "
                    + "where id = " + id;

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                

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
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar contas a receber: " + e);
        }

        return conta;
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
    
    public ArrayList<AuxiliarContaReceber> consultarComFiltro(String criterio) {
        ArrayList<AuxiliarContaReceber> contas = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select cr.*, pr.nome_projeto as nome_projeto, cl.nome as nome_cliente, "
                    + "cat.descricao as categoria "
                    + "from contas_receber cr, projetos pr, clientes cl, categoria cat "
                    + " where cr.id_projeto = pr.id and pr.id_cliente = cl.id_cliente and pr.id_categoria = cat.id "
                    + criterio
                    + " order by cr.data_vencimento";
            
            /*
            select cr.*, pr.nome_projeto as nome_projeto, cl.nome as nome_cliente, 
            cat.descricao as categoria
            from contas_receber cr, projetos pr, clientes cl, categoria cat
            where cr.id_projeto = pr.id and pr.id_cliente = cl.id_cliente and pr.id_categoria = cat.id
            and cr.data_vencimento <= to_date('31/05/2023', 'DD/MM/YYYY') and cr.data_vencimento >= to_date('01/10/2022', 'DD/MM/YYYY') 
            order by cr.data_vencimento
            */

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {

                AuxiliarContaReceber conta = new AuxiliarContaReceber();

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
                conta.setCategoria(retorno.getString("categoria"));
                conta.setNomeCliente(retorno.getString("nome_cliente"));
                conta.setNomeProjeto(retorno.getString("nome_projeto"));

                contas.add(conta);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar conta: " + e);
        }

        return contas;
    }
    
    public String cadastrarPagamento(int id, String dataPagamento, double valorPago, double valorPendente, boolean faturaFechada) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            
            String sql = "update contas_receber "
                    + "set valor_pago = "+ valorPago +", "
                    + "data_pagamento = to_date('" + dataPagamento + "', 'DD/MM/YYYY'), "
                    + "valor_pendente = " + valorPendente + ", "
                    + "fatura_fechada = " + faturaFechada + " "
                    + "where id = " + id;
            
            System.out.println("SQL: " + sql);
            
            st.executeUpdate(sql);
            
            return null;
            
        } catch (Exception e) {
            System.err.println("Erro ao atualizar pagamento: " + e);
            return e.toString();
        }
    }
    
    public double consultaSomaValoresPagosProjeto(int id) {
        
        double soma = 0.0;

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select sum(valor_pago) as soma "
                    + "from contas_receber "
                    + "where id_projeto = " + id;

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {

                soma = retorno.getDouble("soma");
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar soma de valores pagos: " + e);
        }

        return soma;
        
    }
    
    
    public ArrayList<SomaMensal> consultaSomasMensais(int ano) {
        
         ArrayList<SomaMensal> somas = new ArrayList();
        
        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from somas_mensais "
                    + "where ano = " + ano;

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                SomaMensal soma = new SomaMensal();
                
                soma.setMes(retorno.getInt("mes"));
                soma.setAno(retorno.getInt("ano"));
                soma.setTotalFatura(retorno.getDouble("total_fatura"));
                soma.setTotalPago(retorno.getDouble("total_pago"));
                soma.setTotalPendente(retorno.getDouble("total_pendente"));
                
                somas.add(soma);
                
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar somas mensais: " + e);
        }

        return somas;
        
    }
    
    public ArrayList<SomaMensal> consultaSomasMensais() {
        
         ArrayList<SomaMensal> somas = new ArrayList();
        
        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from somas_mensais";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                SomaMensal soma = new SomaMensal();
                
                soma.setMes(retorno.getInt("mes"));
                soma.setAno(retorno.getInt("ano"));
                soma.setTotalFatura(retorno.getDouble("total_fatura"));
                soma.setTotalPago(retorno.getDouble("total_pago"));
                soma.setTotalPendente(retorno.getDouble("total_pendente"));
                
                somas.add(soma);
                
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar somas mensais: " + e);
        }

        return somas;
        
    }
    
    public byte[] gerarRelatorio(int ano) {
        try {
            Connection conn = ConexaoBD.getInstance().getConnection();

            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/relatorio_fat_previsto.jrxml"));

            Map parameters = new HashMap();
            parameters.put("ano", ano);

            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);

            return bytes;
        } catch (Exception e) {
            System.out.println("erro ao gerar relatorio: " + e);
            return null;
        }
    }
    
    
    
}
