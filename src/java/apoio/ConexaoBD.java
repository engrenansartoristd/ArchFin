
package apoio;

import java.util.*;
import java.io.*;
import java.sql.*;


public class ConexaoBD {
    
    private static ConexaoBD instancia = null;
    private Connection conexao = null;
    
    
    // Método construtor
    public ConexaoBD() {
        try {
            Properties prop = new Properties();
            prop.load(getClass().getResourceAsStream("db.properties"));
            String dbdriver = prop.getProperty("db.driver");
            String dburl = prop.getProperty("db.url");
            String dbuser = prop.getProperty("db.user");
            String dbpassword = prop.getProperty("db.password");
                     
            //Carrega Driver do Banco de Dados:
            Class.forName(dbdriver);
            
            if (dbuser.length() != 0){
                conexao = DriverManager.getConnection(dburl, dbuser, dbpassword);
            } else {
                conexao = DriverManager.getConnection(dburl);
            }
            
        } catch (Exception e) {
            System.err.println(e);
        }
        
    }
    
    //Método que retorna instância
    public static ConexaoBD getInstance() {
        if (instancia == null) {
            instancia = new ConexaoBD();
        }
        return instancia;
    }
    
    //Método que retorna conexão
    public Connection getConnection() {
        if (conexao == null) {
            throw new RuntimeException("conexao==null");
        }
        return conexao;
    }
    
    //Método que efetua o fechamento da conexão
    public void shotDown() {
        try {
            conexao.close();
            instancia = null;
            conexao = null;
        } catch (Exception e){
            System.err.println(e);
        }
    }
    
}
