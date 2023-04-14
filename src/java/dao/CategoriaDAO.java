package dao;

import apoio.ConexaoBD;
import apoio.IDAOT;
import entidade.Categoria;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author renan
 */
public class CategoriaDAO implements IDAOT<Categoria> {

    @Override
    public String salvar(Categoria o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "insert into categoria "
                    + "(id, descricao)  "
                    + "values(default, "
                    + "'" + o.getDescricao() + "')";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao inserir categoria: " + e);
            return e.toString();
        }

    }

    @Override
    public String atualizar(Categoria o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "update categoria "
                    + "set descricao = '" + o.getDescricao() + "' "
                    + "where id = " + o.getId();

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao atualizar categoria: " + e);
            return e.toString();
        }
    }

    @Override
    public String excluir(int id) {
        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "delete from categoria "
                    + "where id = " + id;

            System.out.println("SQL: " + sql);

            int retorno = st.executeUpdate(sql);

            return null;

        } catch (Exception e) {
            System.err.println("Erro ao excluir categoria: " + e);
            return e.toString();
        }
    }

    @Override
    public ArrayList<Categoria> consultarTodos() {
        ArrayList<Categoria> categorias = new ArrayList();

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from categoria "
                    + "order by descricao";

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(retorno.getInt("id"));
                categoria.setDescricao(retorno.getString("descricao"));

                categorias.add(categoria);
            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar categorias: " + e);
        }

        return categorias;
    }

    @Override
    public ArrayList<Categoria> consultar(String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Categoria consultarId(int id) {
        Categoria categoria = null;

        try {

            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "select * "
                    + "from categoria "
                    + "where id = " + id;

            System.out.println("SQL: " + sql);

            ResultSet retorno = st.executeQuery(sql);

            while (retorno.next()) {
                categoria = new Categoria();
                categoria.setId(retorno.getInt("id"));
                categoria.setDescricao(retorno.getString("descricao"));

            }

        } catch (Exception e) {
            System.err.println("Erro ao consultar categoria: " + e);
        }

        return categoria;
    }
}
