
package negocio;

/**
 *
 * @author renan
 */
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Parcelamento {
    public static BigDecimal[] calcularParcelas(BigDecimal valor, int numeroParcelas) {
        BigDecimal[] parcelas = new BigDecimal[numeroParcelas];
        BigDecimal valorParcela = valor.divide(BigDecimal.valueOf(numeroParcelas), 2, RoundingMode.HALF_UP);

        for (int i = 0; i < numeroParcelas; i++) {
            parcelas[i] = valorParcela;
        }

        // Ajuste para a última parcela
        BigDecimal somaParcelas = valorParcela.multiply(BigDecimal.valueOf(numeroParcelas));
        BigDecimal diferenca = valor.subtract(somaParcelas);
        parcelas[numeroParcelas - 1] = parcelas[numeroParcelas - 1].add(diferenca);

        return parcelas;
    }
    
    public static List<LocalDate> calcularDatasVencimento(LocalDate dataInicial, int numeroParcelas) {
        List<LocalDate> datasVencimento = new ArrayList<>();

        LocalDate dataVencimento = dataInicial;
        for (int i = 0; i < numeroParcelas; i++) {
            
            datasVencimento.add(dataVencimento);

            // Avança para o próximo mês
            dataVencimento = dataVencimento.plusMonths(1);
        }

        return datasVencimento;
    }

}

