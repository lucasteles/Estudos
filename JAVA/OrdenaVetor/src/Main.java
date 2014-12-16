import javax.swing.*;

public class Main {

    public static void main(String[] args) {
        int [] nVetorArq;
        int [] nVetorOrdenado;
        int nEscolha;
        Canvas oScreen = new Canvas("Ordenador de vetor", 800,600);
        Ordenador oOrder;
        SimpleInput oInput = new SimpleInput();
        String sComGrafico;

        LeitorArquivoInt oFileReader = new LeitorArquivoInt();
        
        //Define tamanho do vetor de acordo com o primeiro número do arquivo
        nVetorArq = new int[oFileReader.obterProximo()];

        //Preencher vetor com os números do arquivo
        for (int i = 0; i < nVetorArq.length; i++) {
            nVetorArq[i] = oFileReader.obterProximo();
        }
        
        //Verifica o uso do gráfico
        nEscolha = oInput.getInt("Escolha qual o tipo de algoritmo de ordenação gostaria de executar: \n\n"
                                + "1 - Bubble \n"
                                + "2 - Insertion \n"
                                + "3 - Quick \n"
                                + "4 - Heap \n"
                                + "5 - Radix \n\n"
                                + "0 - Sair do Programa");
        // Sai do programa
        if (nEscolha == 0) {
            System.exit(0);            
        }
        
        // Define a utilização do gráfico
        sComGrafico = oInput.getString("Deseja que seja exibido um gráfico do processo ?\n\n"
                                    + "S = Sim \n"
                                    + "N = Não \n"
                                    + "*Possível apenas para arquivos com menos de 500 números");
        
        if (nVetorArq.length > 500) {
            sComGrafico = "N";
            
        }
        
        oOrder = new Ordenador(nVetorArq, oScreen, sComGrafico);


        //----------------Tempo inicial de execução--------------
        long tempoInicial = System.currentTimeMillis();
        //-------------------------------------------------------


        switch (nEscolha) {
            case 1: // bubbleSort
                nVetorOrdenado = oOrder.bubbleSort();
                break;
                
            case 2: // insertionSort
                nVetorOrdenado = oOrder.insertionSort();
                break;
                
            case 3: // quickSort
                nVetorOrdenado = oOrder.quickSort();
                break;
                
            case 4: // heapSort
                nVetorOrdenado = oOrder.insertionSort();                
                break;
                
            case 5: // radixSort
                nVetorOrdenado = oOrder.radixSort();                                
                break;
                
            default:
                throw new AssertionError();
        }

        //------------- Calculo do tempo final e impressão------------------
        long tempoFinal = System.currentTimeMillis();
        System.out.printf("Tempo de execução = " + "%.3f segundos%n", (tempoFinal - tempoInicial) / 1000d);
        //------------------------------------------------------------------
        
        EscritorArquivo oFileWriter = new EscritorArquivo();
        //Grava arquivo de saída
        oFileWriter.println(nVetorOrdenado.length);
        
        for (int i = 0; i < nVetorOrdenado.length; i++) {
            oFileWriter.println(nVetorOrdenado[i]);
        }
        oFileWriter.fechar();
        System.exit(0);
        
        
        

        
        //<editor-fold desc="Área de testes">
        /*//Printa os números do vetor de entrada
        System.out.println("Vetor de entrada");
        for (int i = 0; i < nVetorArq.length; i++) {
            System.out.print(nVetorArq[i] + " | ");
        }

        //Ordena o vetor
        oOrder = new Ordenador(nVetorArq, oScreen, "G");
        nVetorOrdenado = oOrder.quickSort();

        //Printa os números do vetor de saída
        System.out.println();
        System.out.println("Vetor de saída");
        for (int i = 0; i < nVetorOrdenado.length; i++) {
            System.out.print(nVetorOrdenado[i] + " | ");
        }*/
        //</editor-fold>
    }
}
