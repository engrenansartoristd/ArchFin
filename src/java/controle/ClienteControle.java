
package controle;

import dao.ClienteDAO;
import entidade.Cliente;
import jakarta.servlet.http.HttpServletRequest;
import apoio.Validacao;

/**
 *
 * @author renan
 */
public class ClienteControle {
    
    public String salvar(HttpServletRequest request){
        
        Cliente cliente = construirObjeto(request);
        
        String cpf_cnpj = cliente.getCpf_cnpj();
        
        String retorno;
        
        boolean cpfValido = false;
        
        if (cpf_cnpj.length() > 14) {
            cpfValido = Validacao.validarCNPJ(cpf_cnpj.replaceAll("[^\\d]", ""));
        } else {
            cpfValido = Validacao.validarCPF(cpf_cnpj.replaceAll("[^\\d]", ""));
        }
        
        if (!cpfValido) {
            retorno = "Erro ao inserir cliente: CPF ou CNPJ inválido!";
            System.out.println(retorno);
        } else {
            retorno = new ClienteDAO().salvar(construirObjeto(request));
        }

       // String retorno = new ClienteDAO().salvar(construirObjeto(request));
        
        return retorno;
    }
    
    public String atualizar(HttpServletRequest request){
        
         Cliente cliente = construirObjeto(request);
        
        String cpf_cnpj = cliente.getCpf_cnpj();
        
        String retorno;
        
        boolean cpfValido = false;
        
        if (cpf_cnpj.length() > 14) {
            cpfValido = Validacao.validarCNPJ(cpf_cnpj.replaceAll("[^\\d]", ""));
        } else {
            cpfValido = Validacao.validarCPF(cpf_cnpj.replaceAll("[^\\d]", ""));
        }
        
        if (!cpfValido) {
            retorno = "Erro ao inserir cliente: CPF ou CNPJ inválido!";
            System.out.println(retorno);
        } else {
            retorno = new ClienteDAO().atualizar(construirObjeto(request));
        }
        
        //String retorno = new ClienteDAO().atualizar(construirObjeto(request));
        
        return retorno;
    }
    
    private Cliente construirObjeto(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String rua = request.getParameter("rua");
        int numero = Integer.parseInt(request.getParameter("numero").replace(" ", ""));

        String complemento = "";
        if (request.getParameter("complemento") != null) {
            complemento = request.getParameter("complemento");
        }

        String cep = request.getParameter("cep");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");

        String telefone_cel = "";
        if (request.getParameter("telefone_cel") != null) {
            telefone_cel = request.getParameter("telefone_cel");
        }

        String telefone_fixo = "";
        if (request.getParameter("telefone_fixo") != null) {
            telefone_fixo = request.getParameter("telefone_fixo");
        }

        String cpf_cnpj = request.getParameter("cpf_cnpj");

        Cliente cliente = new Cliente();

        cliente.setId(id);
        cliente.setNome(nome);
        cliente.setEmail(email);
        cliente.setRua(rua);
        cliente.setNumero(numero);
        cliente.setComplemento(complemento);
        cliente.setCep(cep);
        cliente.setBairro(bairro);
        cliente.setCidade(cidade);
        cliente.setUf(uf);
        cliente.setTelefone_cel(telefone_cel);
        cliente.setTelefone_fixo(telefone_fixo);
        cliente.setCpf_cnpj(cpf_cnpj);
        
        return cliente;
    }
    
}
