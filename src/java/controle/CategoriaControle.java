/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

import dao.CategoriaDAO;
import entidade.Categoria;
import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author renan
 */
public class CategoriaControle {
    
    public String salvar(HttpServletRequest request){
       
        String retorno = new CategoriaDAO().salvar(construirObjeto(request));
        
        return retorno;
    }
    
    public String atualizar(HttpServletRequest request){
              
        String retorno = new CategoriaDAO().atualizar(construirObjeto(request));
        
        return retorno;
    }
    
    private Categoria construirObjeto(HttpServletRequest request){
         int id = Integer.parseInt(request.getParameter("id"));
        String descricao = request.getParameter("descricao");
            
        Categoria categoria = new Categoria();

        categoria.setId(id);
        categoria.setDescricao(descricao);
        
        return categoria;
        
    }
    
}
