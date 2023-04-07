package dao;

import apoio.ConexaoBD;
import apoio.IDAOT;
import entidade.Usuario;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author renan
 */
public class UsuarioDAO implements IDAOT<Usuario> {

    @Override
    public String salvar(Usuario o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String atualizar(Usuario o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String excluir(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Usuario> consultarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Usuario> consultar(String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Usuario consultarId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Usuario autenticar(String email, String senha) {

        Usuario user = null;

        try {
            String sql
                    = "SELECT * "
                    + "FROM usuario "
                    + "WHERE "
                    + "email = '" + email + "' and "
                    + "senha = '" + senha + "' and "
                    + "situacao = 'a';";

            System.out.println("SQL: " + sql);

            ResultSet resultadoQ = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            if (resultadoQ.next()) {
                user = new Usuario();
                user.setId(resultadoQ.getInt("id"));
                user.setNome(resultadoQ.getString("nome"));
                user.setSenha(resultadoQ.getString("senha"));
                user.setEmail(resultadoQ.getString("email"));
                user.setSituacao(resultadoQ.getString("situacao").charAt(0));
            }
        } catch (Exception e) {
            System.out.println("Erro ao autenticar usuário: " + e);
        }
        
        return user;
        
    }

}
