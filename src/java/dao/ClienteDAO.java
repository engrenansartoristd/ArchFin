
package dao;

import apoio.ConexaoBD;
import apoio.IDAOT;
import entidade.Cliente;
import java.sql.Statement;
import java.util.ArrayList;

public class ClienteDAO implements IDAOT<Cliente>{

    @Override
    public String salvar(Cliente o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            
            String sql = "insert into cliente values(default, '"+ o.getNome() +"',"
                    + "'" + o.getEmail() + "', "
                    + "'" + o.getCpf_cnpj()+ "', "
                    + "'" + o.getTelefone_cel() + "')" ;
            
            System.out.println("SQL: " + sql);
            
            st.executeUpdate(sql);
            
            return null;
            
        } catch (Exception e) {
            System.err.println("Erro ao inserir cliente: " + e);
            return e.toString();
        }
    }

    @Override
    public String atualizar(Cliente o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String excluir(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Cliente> consultarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Cliente> consultar(String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Cliente consultarId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
