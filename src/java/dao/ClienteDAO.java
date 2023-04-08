
package dao;

import apoio.ConexaoBD;
import apoio.IDAOT;
import entidade.Cliente;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ClienteDAO implements IDAOT<Cliente>{

    @Override
    public String salvar(Cliente o) {
        try {
            //Cria Statement para conexão com o banco de dados
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            
            String sql = "insert into clientes "
                    + "(id_cliente, nome, email, rua, numero, "
                    + "complemento, cep, bairro, cidade, uf, telefone_cel, telefone_fixo, cpf_cnpj) "
                    + "values(default, "
                    + "'"+ o.getNome() +"',"
                    + "'" + o.getEmail() + "', "
                    + "'" + o.getRua() + "', "
                    + "'" + o.getNumero() + "', "
                    + "'" + o.getComplemento() + "', "
                    + "'" + o.getCep() + "', "
                    + "'" + o.getBairro() + "', "
                    + "'" + o.getCidade() + "', "
                    + "'" + o.getUf() + "', "
                    + "'" + o.getTelefone_cel() + "', "
                    + "'" + o.getTelefone_fixo() + "', "
                    + "'" + o.getCpf_cnpj()+ "')";
            
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
        ArrayList<Cliente> clientes = new ArrayList();
       
       try {
            
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            
            String sql = "select * "
                    + "from clientes "
                    + "order by nome" ;
            
            System.out.println("SQL: " + sql);
            
            ResultSet retorno  = st.executeQuery(sql);
            
            while (retorno.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(retorno.getInt("id_cliente"));
                cliente.setNome(retorno.getString("nome"));
                cliente.setEmail(retorno.getString("email"));
                cliente.setRua(retorno.getString("rua"));
                cliente.setNumero(Integer.parseInt(retorno.getString("numero")));
                cliente.setComplemento(retorno.getString("complemento"));
                cliente.setBairro(retorno.getString("bairro"));
                cliente.setCidade(retorno.getString("cidade"));
                cliente.setUf(retorno.getString("uf"));
                cliente.setCep(retorno.getString("cep"));
                cliente.setCpf_cnpj(retorno.getString("cpf_cnpj"));
                cliente.setTelefone_cel(retorno.getString("telefone_cel"));
                cliente.setTelefone_fixo(retorno.getString("telefone_fixo"));
                
                clientes.add(cliente);
            }
            
        } catch (Exception e) {
            System.err.println("Erro ao consultar cliente: " + e);
        }
        
        return clientes;
        
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
