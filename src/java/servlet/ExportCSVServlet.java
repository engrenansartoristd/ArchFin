package servlet;

import controle.ContaReceberControle;
import entidade.AuxiliarContaReceber;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author re_sa
 */
public class ExportCSVServlet extends HttpServlet {

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
            out.println("<title>Servlet ExportCSVServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportCSVServlet at " + request.getContextPath() + "</h1>");
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

        if (a.equals("exportContasReceber")) {

            String cliente;
            String situacao;
            String dataInicio;
            String dataFim;

            cliente = request.getParameter("cliente");
            situacao = request.getParameter("situacao");
            dataInicio = request.getParameter("data_inicio");
            dataFim = request.getParameter("data_fim");

            System.out.println(cliente);
            System.out.println(situacao);
            System.out.println(dataInicio);
            System.out.println(dataFim);
            ArrayList<AuxiliarContaReceber> contas = new ContaReceberControle().consultar(cliente, situacao, dataInicio, dataFim);

            String fileName = "dados.csv";

            // Cria um arquivo temporário
            Path tempFilePath = Files.createTempFile("temp_", "_" + fileName);

            // Escreve os dados da tabela no arquivo CSV
            try (PrintWriter writer = new PrintWriter(Files.newBufferedWriter(tempFilePath, StandardOpenOption.WRITE))) {

                writer.append("Id,Cliente,Projeto,Categoria,Valor da Fatura,Data de Vencimento,Data do Pagamento,Valor Pago,Situacao,Editar,Pagamento\n");

                for (AuxiliarContaReceber conta : contas) {
                    writer.print(conta.getId());
                    writer.append(",");
                    writer.print(conta.getNomeCliente());
                    writer.append(",");
                    writer.print(conta.getNomeProjeto());
                    writer.append(",");
                    writer.print(conta.getCategoria());
                    writer.append(",");
                    writer.print(conta.getValorFatura());
                    writer.append(",");
                    writer.print(conta.getDataVencimento());
                    writer.append(",");
                    writer.print(conta.getDataPagamento());
                    writer.append(",");
                    writer.print(conta.getValorPago());
                    writer.append(",");
                    if (conta.isFaturaFechada()) {
                        writer.print("Fechada");
                    } else {
                        writer.print("Aberta");
                    }
                    writer.println();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Configurar o cabeçalho da resposta para fazer o download do arquivo
            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

            try {
                Files.copy(tempFilePath, response.getOutputStream());
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.getOutputStream().close();

            // Exclua o arquivo temporário após enviá-lo para o navegador
            Files.delete(tempFilePath);

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
        processRequest(request, response);
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

}
