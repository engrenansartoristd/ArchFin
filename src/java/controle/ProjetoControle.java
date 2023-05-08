
package controle;

import apoio.Formatacao;
import dao.ProjetoDAO;
import entidade.Projeto;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 *
 * @author renan
 */
public class ProjetoControle {
    
    public String salvar(HttpServletRequest request){
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        String dataProjeto = request.getParameter("data_projeto");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");

        int idCliente = Integer.parseInt(request.getParameter("cliente"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        
        String valorContratoString = request.getParameter("valor_contrato");
        
        double valorContrato = Formatacao.removerFormatacaoMoeda(valorContratoString);
        double valorPendente = valorContrato;

        Projeto projeto = new Projeto();
        
        projeto.setId(id);
        projeto.setData(dataProjeto);
        projeto.setNomeProjeto(nome);
        projeto.setIdCategoria(idCategoria);
        projeto.setIdCliente(idCliente);
        projeto.setDescricao(descricao);
        
        
        projeto.setValorContrato(valorContrato);
        projeto.setValorPendente(valorPendente);
        
        String retorno = new ProjetoDAO().salvar(projeto);
        
        return retorno;
    }
    
    public String atualizar(HttpServletRequest request){
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        String dataProjeto = request.getParameter("data_projeto");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");

        int idCliente = Integer.parseInt(request.getParameter("cliente"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        
        String valorContratoString = request.getParameter("valor_contrato");
        
        double valorContrato = Formatacao.removerFormatacaoMoeda(valorContratoString);
        double valorPendente = valorContrato;

        Projeto projeto = new Projeto();
        
        projeto.setId(id);
        projeto.setData(dataProjeto);
        projeto.setNomeProjeto(nome);
        projeto.setIdCategoria(idCategoria);
        projeto.setIdCliente(idCliente);
        projeto.setDescricao(descricao);
        
        
        projeto.setValorContrato(valorContrato);
        projeto.setValorPendente(valorPendente);
        
        String retorno = new ProjetoDAO().atualizar(projeto);
        
        return retorno;
    }
    
    public ArrayList<Projeto> consultar(String cliente, String categoria, String dataInicio, String dataFim) {
        
        String criterio = "";
        
        if (!cliente.equals("") ){
            criterio = criterio + " and pr.id_cliente = " + cliente; 
        } 
        
        if (!categoria.equals("") ){
            criterio = criterio + " and pr.id_categoria = " + categoria;  
        } 
        
        if (!dataInicio.equals("") ){
            criterio = criterio + " and pr.data >= to_date('" + dataInicio + "', 'DD/MM/YYYY')";
        } 
        
        if (!dataFim.equals("") ){
            criterio = criterio + " and pr.data <= to_date('" + dataFim + "', 'DD/MM/YYYY')";
        } 

        ArrayList<Projeto>  projetos = new ProjetoDAO().consultar(criterio);
        
        return projetos;
    }
    
}
