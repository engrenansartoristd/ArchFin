package controle;

import apoio.Formatacao;
import dao.ContaReceberDAO;
import jakarta.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import negocio.Parcelamento;

/**
 *
 * @author renan
 */
public class ContaReceberControle {

    public String criarContasReceber(HttpServletRequest request) {

        String retorno = null;

        int id = Integer.parseInt(request.getParameter("id_projeto"));
        String dataVencimento = request.getParameter("data_vencimento");
        
        String valorFaturaString = request.getParameter("valor_total");
        double valorTotal = Formatacao.removerFormatacaoMoeda(valorFaturaString);
        
        int qtdeParcelas = Integer.parseInt(request.getParameter("qtde_parcelas"));

        //Calcular parcelas 
        BigDecimal[] parcelas = Parcelamento.calcularParcelas(new BigDecimal(valorTotal), qtdeParcelas);

        
        //Calular datas de vencimento
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.forLanguageTag("pt-BR"));
        LocalDate dataInicial = LocalDate.parse(dataVencimento, formatter);
        List<LocalDate> datasVencimento = Parcelamento.calcularDatasVencimento(dataInicial, qtdeParcelas);
        
        retorno = new ContaReceberDAO().cadastrarContas(parcelas, datasVencimento, id);
        
        return retorno;

    }

}
