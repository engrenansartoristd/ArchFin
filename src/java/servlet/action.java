/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import apoio.Hashing;
import controle.CategoriaControle;
import controle.ClienteControle;
import controle.ContaReceberControle;
import controle.ProjetoControle;
import dao.CategoriaDAO;
import dao.ClienteDAO;
import dao.ProjetoDAO;
import dao.UsuarioDAO;
import entidade.AuxiliarContaReceber;
import entidade.Categoria;
import entidade.Cliente;
import entidade.Projeto;
import entidade.Usuario;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

/**
 *
 * @author renan
 */
public class action extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet action</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet action at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = request.getParameter("a");

        if (a.equals("logout")) {
            HttpSession sessao = request.getSession();
            sessao.invalidate();

            response.sendRedirect("index.jsp");
        }

        if (a.equals("editarCliente")) {

            int id = Integer.parseInt(request.getParameter("id"));

            Cliente cliente = new ClienteDAO().consultarId(id);

            if (cliente != null) {
                request.setAttribute("cliente", cliente);

                encaminharPagina("cadClientes.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao consultar cliente!");
                encaminharPagina("cadClientes.jsp", request, response);
            }
        }

        if (a.equals("excluirCliente")) {

            int id = Integer.parseInt(request.getParameter("id"));

            String retorno = new ClienteDAO().excluir(id);

            if (retorno == null) {
                request.setAttribute("retorno", "Cliente excluído com sucesso!");
                encaminharPagina("cadClientes.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao excluir cliente!");
                encaminharPagina("cadClientes.jsp", request, response);
            }
        }

        if (a.equals("editarCategoria")) {

            int id = Integer.parseInt(request.getParameter("id"));

            Categoria categoria = new CategoriaDAO().consultarId(id);

            if (categoria != null) {
                request.setAttribute("categoria", categoria);
                encaminharPagina("cadCategorias.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao consultar categoria!");
                encaminharPagina("cadCategorias.jsp", request, response);
            }
        }

        if (a.equals("excluirCategoria")) {

            int id = Integer.parseInt(request.getParameter("id"));

            String retorno = new CategoriaDAO().excluir(id);

            if (retorno == null) {
                request.setAttribute("retorno", "Categoria excluída com sucesso!");
                encaminharPagina("cadCategorias.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao excluir categoria!");
                encaminharPagina("cadCategorias.jsp", request, response);
            }
        }

        if (a.equals("editarProjeto")) {

            int id = Integer.parseInt(request.getParameter("id"));

            Projeto projeto = new ProjetoDAO().consultarId(id);

            if (projeto != null) {
                request.setAttribute("projeto", projeto);
                encaminharPagina("cadProjetos.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao consultar projeto!");
                encaminharPagina("cadProjetos.jsp", request, response);
            }
        }

        if (a.equals("excluirProjeto")) {

            int id = Integer.parseInt(request.getParameter("id"));

            String retorno = new ProjetoDAO().excluir(id);

            if (retorno == null) {
                request.setAttribute("retorno", "Projeto excluído com sucesso!");
                encaminharPagina("cadProjetos.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao excluir projeto!");
                encaminharPagina("cadProjetos.jsp", request, response);
            }
        }

        if (a.equals("pesquisarProjeto")) {

            String cliente = null;
            String categoria = null;
            String data_inicio = null;
            String data_fim = null;

            cliente = request.getParameter("cliente");
            categoria = request.getParameter("categoria");
            data_inicio = request.getParameter("data_inicio");
            data_fim = request.getParameter("data_fim");

            ArrayList<Projeto> projetos = new ProjetoControle().consultar(cliente, categoria, data_inicio, data_fim);

            request.setAttribute("cliente", cliente);
            request.setAttribute("categoria", categoria);
            request.setAttribute("data_inicio", data_inicio);
            request.setAttribute("data_fim", data_fim);

            if (projetos != null) {
                request.setAttribute("projetos", projetos);
                encaminharPagina("listProjetos.jsp", request, response);
            } else {
                encaminharPagina("listProjetos.jsp", request, response);
            }
        }

        if (a.equals("cadContasReceber")) {

            int id = Integer.parseInt(request.getParameter("id"));
            
            request.setAttribute("id", id);

            encaminharPagina("cadContasReceber.jsp", request, response);

        }
        
        
        if (a.equals("pesquisarContas")) {

            String cliente;
            String situacao;
            String dataInicio;
            String dataFim;

            cliente = request.getParameter("cliente");
            situacao = request.getParameter("situacao");
            dataInicio = request.getParameter("data_inicio");
            dataFim = request.getParameter("data_fim");

            ArrayList<AuxiliarContaReceber> contas = new ContaReceberControle().consultar(cliente, situacao, dataInicio, dataFim);

            request.setAttribute("cliente", cliente);
            request.setAttribute("situacao", situacao);
            request.setAttribute("data_inicio", dataInicio);
            request.setAttribute("data_fim", dataFim);

            if (contas != null) {
                request.setAttribute("contas", contas);
                encaminharPagina("listContasReceber.jsp", request, response);
            } else {
                encaminharPagina("listContasReceber.jsp", request, response);
            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        System.out.println("Estou no POST");

        String a = request.getParameter("a");

        if (a.equals("login")) {
            // logica do login
            // pegar user
            // pegar senha
            // autenticar = verificar
            // sucesso = vai pro sistema || erro = login de novo

            String email = request.getParameter("email");
            String senha = null;

            try {
                senha = Hashing.digestSHA256(String.valueOf(request.getParameter("senha")));
            } catch (NoSuchAlgorithmException e) {
                System.out.println("Erro ao fazer hashing da senha");
            }

            Usuario usuario = new UsuarioDAO().autenticar(email, senha);

            if (usuario != null) {
                HttpSession sessao = request.getSession();
                sessao.setAttribute("user", usuario);
                request.removeAttribute("msg");
                encaminharPagina("inicio.jsp", request, response);
            } else {
                request.setAttribute("msg", "Erro ao fazer login!");
                encaminharPagina("index.jsp", request, response);
            }
        }

        if (a.equals("cadastrarCliente")) {
            int id = Integer.parseInt(request.getParameter("id"));

            String retorno;

            if (id == 0) { // insert                
                retorno = new ClienteControle().salvar(request);

            } else {// update                
                retorno = new ClienteControle().atualizar(request);
            }

            if (retorno == null) {
                request.setAttribute("retorno", "Cliente salvo com sucesso!");
                encaminharPagina("cadClientes.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao salvar cliente!");
                encaminharPagina("cadClientes.jsp", request, response);
            }
        }

        if (a.equals("cadastrarProjeto")) {
            int id = Integer.parseInt(request.getParameter("id"));

            String retorno;

            if (id == 0) { // insert                
                retorno = new ProjetoControle().salvar(request);

            } else {// update                
                retorno = new ProjetoControle().atualizar(request);
            }

            if (retorno == null) {
                request.setAttribute("retorno", "Projeto salvo com sucesso!");
                encaminharPagina("cadProjetos.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao salvar projeto!");
                encaminharPagina("cadProjetos.jsp", request, response);
            }
        }

        if (a.equals("cadastrarCategoria")) {
            int id = Integer.parseInt(request.getParameter("id"));

            String retorno;

            if (id == 0) { // insert                
                retorno = new CategoriaControle().salvar(request);

            } else {// update                
                retorno = new CategoriaControle().atualizar(request);
            }

            if (retorno == null) {
                request.setAttribute("retorno", "Categoria salva com sucesso!");
                encaminharPagina("cadCategorias.jsp", request, response);
            } else {
                request.setAttribute("retorno", "Erro ao salvar categoria!");
                encaminharPagina("cadCategorias.jsp", request, response);
            }
        }
        
        if (a.equals("cadastrarFaturas")) {
            
            String id_projeto = request.getParameter("id_projeto");

            String retorno = new ContaReceberControle().criarContasReceber(request);
            if (retorno == null) {
                request.setAttribute("id", id_projeto);
                request.setAttribute("retorno", "Fatura salva com sucesso!");
                encaminharPagina("cadContasReceber.jsp", request, response);
            } else {
                request.setAttribute("id", id_projeto);
                request.setAttribute("retorno", "Erro ao salvar fatura!");
                encaminharPagina("cadContasReceber.jsp", request, response);
            }
        }
        
        
        if (a.equals("cadastrarPagamento")) {
            
            String cliente;
            String situacao;
            String dataInicio;
            String dataFim;

            cliente = request.getParameter("cliente");
            situacao = request.getParameter("situacao");
            dataInicio = request.getParameter("data_inicio");
            dataFim = request.getParameter("data_fim");
            
            
            //String id_projeto = request.getParameter("id_projeto");   
            
            
            request.setAttribute("cliente", cliente);
            request.setAttribute("situacao", situacao);
            request.setAttribute("data_inicio", dataInicio);
            request.setAttribute("data_fim", dataFim);

            String retorno = new ContaReceberControle().cadastarPagamento(request);
            
            if (retorno == null) {
                //request.setAttribute("id", id_projeto);
                request.setAttribute("retorno", "Pagamento salvo com sucesso!");
                encaminharPagina("listContasReceber.jsp", request, response);
            } else {
                //request.setAttribute("id", id_projeto);
                request.setAttribute("retorno", "Erro ao salvar pagamento!");
                encaminharPagina("listContasReceber.jsp", request, response);
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void encaminharPagina(String pagina, HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(pagina);
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("Erro ao encaminhar: " + e);
        }
    }
}
