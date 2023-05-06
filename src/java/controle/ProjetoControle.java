
package controle;

import apoio.Formatacao;
import dao.ProjetoDAO;
import entidade.Projeto;
import jakarta.servlet.http.HttpServletRequest;

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
        
    
}
