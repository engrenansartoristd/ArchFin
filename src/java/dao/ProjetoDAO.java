package dao;

import apoio.ConexaoBD;
import apoio.Formatacao;
import apoio.IDAOT;
import entidade.Projeto;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProjetoDAO implements IDAOT<Projeto> {

    @Override
    public String salvar(Projeto o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "insert into projetos "
                    + "(id, nome_projeto, descricao, id_cliente, id_categoria, "
                    + "valor_contrato, valor_pendente) "
                    + "values(default, "
                    + "'" + o.getNomeProjeto() + "',"
                    + "'" + o.getDescricao() + "', "
                    + "'" + String.valueOf(o.getIdCliente()) + "', "
                    + "'" + String.valueOf(o.getIdCategoria()) + "', "
                    + "'" + String.valueOf(o.getValorContrato()) + "', "
                    + "'" + String.valueOf(o.getValorPendente()) + "')";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao inserir cliente: " + e);
            return e.toString();
        }
    }

    @Override
    public String atualizar(Projeto o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "update projetos "
                    + "set nome_projeto = '" + o.getNomeProjeto() + "', "
                    + "descricao = '" + o.getDescricao() + "', "
                    + "id_cliente = '" + o.getIdCliente() + "', "
                    + "id_categoria = '" + o.getIdCategoria() + "', "
                    + "valor_contrato = '" + o.getValorContrato() + "', "
                    + "valor_pendente = '" + o.getValorPendente() + "', "
                    + "data = to_date('" + o.getData() + "', 'DD/MM/YYYY') "
                    + "where id = '" + o.getId() + "'";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao atualizar cliente: " + e);
            return e.toString();
        }
    }

    @Override
    public String excluir(int id) {
        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "delete from projetos "
                    + "where id = " + id;

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao excluir projeto: " + e);
            return e.toString();
        }
    }

    @Override
    public ArrayList<Projeto> consultarTodos() {
        ArrayList<Projeto> projetos = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from projetos "
                    + "order by data";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                Projeto projeto = new Projeto();

                projeto.setId(retorno.getInt("id"));
                projeto.setNomeProjeto(retorno.getString("nome_projeto"));
                projeto.setDescricao(retorno.getString("descricao"));
                projeto.setIdCliente(retorno.getInt("id_cliente"));
                projeto.setIdCategoria(retorno.getInt("id_categoria"));
                projeto.setValorContrato(retorno.getDouble("valor_contrato"));
                projeto.setValorPendente(retorno.getDouble("valor_pendente"));
                projeto.setData(Formatacao.formatarData(retorno.getDate("data")));

                projetos.add(projeto);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar projeto: " + e);
        }

        return projetos;
    }

    @Override
    public ArrayList<Projeto> consultar(String criterio) {
        ArrayList<Projeto> projetos = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select pr.id, pr.nome_projeto, pr.descricao, cl.nome as nome_cliente, pr.id_cliente, "
                    + "cat.descricao as categoria, pr.id_categoria, pr.valor_contrato, pr.valor_pendente, pr.data "
                    + "from projetos pr, clientes cl, categoria cat "
                    + "where cl.id_cliente = pr.id_cliente and pr.id_categoria = cat.id "
                    + criterio
                    + " order by data desc";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {

                Projeto projeto = new Projeto();

                projeto.setId(retorno.getInt("id"));
                projeto.setNomeProjeto(retorno.getString("nome_projeto"));
                projeto.setDescricao(retorno.getString("descricao"));
                projeto.setIdCliente(retorno.getInt("id_cliente"));
                projeto.setIdCategoria(retorno.getInt("id_categoria"));
                projeto.setNomeCliente(retorno.getString("nome_cliente"));
                projeto.setNomeCategoria(retorno.getString("categoria"));
                projeto.setValorContrato(retorno.getDouble("valor_contrato"));
                projeto.setValorPendente(retorno.getDouble("valor_pendente"));
                projeto.setData(Formatacao.formatarData(retorno.getDate("data")));

                projetos.add(projeto);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar projeto: " + e);
        }

        return projetos;
    }

    @Override
    public Projeto consultarId(int id) {

        Projeto projeto = new Projeto();
        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from projetos "
                    + "where id = " + id;

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {

                projeto.setId(retorno.getInt("id"));
                projeto.setNomeProjeto(retorno.getString("nome_projeto"));
                projeto.setDescricao(retorno.getString("descricao"));
                projeto.setIdCliente(retorno.getInt("id_cliente"));
                projeto.setIdCategoria(retorno.getInt("id_categoria"));
                projeto.setValorContrato(retorno.getDouble("valor_contrato"));
                projeto.setValorPendente(retorno.getDouble("valor_pendente"));
                projeto.setData(Formatacao.formatarData(retorno.getDate("data")));
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar projeto: " + e);
        }

        return projeto;
    }

    public ArrayList<Projeto> consultarTodosExtendido() {
        ArrayList<Projeto> projetos = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select pr.id, pr.nome_projeto, pr.descricao, cl.nome as nome_cliente, pr.id_cliente, "
                    + "cat.descricao as categoria, pr.id_categoria, pr.valor_contrato, pr.valor_pendente, pr.data "
                    + "from projetos pr, clientes cl, categoria cat "
                    + "where cl.id_cliente = pr.id_cliente and pr.id_categoria = cat.id order by data desc";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {

                Projeto projeto = new Projeto();

                projeto.setId(retorno.getInt("id"));
                projeto.setNomeProjeto(retorno.getString("nome_projeto"));
                projeto.setDescricao(retorno.getString("descricao"));
                projeto.setIdCliente(retorno.getInt("id_cliente"));
                projeto.setIdCategoria(retorno.getInt("id_categoria"));
                projeto.setNomeCliente(retorno.getString("nome_cliente"));
                projeto.setNomeCategoria(retorno.getString("categoria"));
                projeto.setValorContrato(retorno.getDouble("valor_contrato"));
                projeto.setValorPendente(retorno.getDouble("valor_pendente"));
                projeto.setData(Formatacao.formatarData(retorno.getDate("data")));

                projetos.add(projeto);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar projeto: " + e);
        }

        return projetos;
    }
    
    public String atualizarValorPendente(int id, double valorPendente) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "update projetos "
                    + "set valor_pendente = " + valorPendente + " "
                    + "where id = " + id;

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao atualizar cliente: " + e);
            return e.toString();
        }
    }
    

}
