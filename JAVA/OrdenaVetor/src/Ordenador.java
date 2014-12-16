import java.lang.Math;
/*
 Classe responsável pelos algorítimos de ordenação
 */
public class Ordenador {
    
    Canvas oScreen;
    DesenhaProcesso oPrinter;
    int[] pVetor;
    boolean pAnimacao;
    
    public Ordenador(int[] nArray, Canvas oCanv, String sComAnimacao){
        pVetor = nArray;
        oPrinter = new DesenhaProcesso(pVetor);
        oScreen = oCanv;
        
        if(sComAnimacao.equalsIgnoreCase("s"))
            pAnimacao = true;
        else
            pAnimacao = false;
    }
    
    public int[] bubbleSort(){
        int nAux;
        
        //Inicia gráfico
        if(pAnimacao)
            oPrinter.inicializar(oScreen,pVetor);
        
        for (int i = pVetor.length; i > 1 ; i--) {
            for (int j = 0; j < (i-1); j++) {
                if (pVetor[j] > pVetor[j+1]) {
                    nAux = pVetor[j];
                    pVetor[j] = pVetor[j+1];
                    pVetor[j+1] = nAux;
                    
                    //Reproduz gráfico
                    if(pAnimacao)
                        oPrinter.printaGrafico(oScreen, j, j+1, pVetor[j], pVetor[j+1]);
                }
            }
        }
        
        return pVetor;
    }//end bubbleSort

    public int[] insertionSort(){
        int nAux;
                
        //Inicia gráfico
        if(pAnimacao)
            oPrinter.inicializar(oScreen,pVetor);
        
        for (int i = 1; i < pVetor.length; i++) {
            nAux = pVetor[i];
            
            for (int j = i - 1; j >= 0 && pVetor[j] > nAux; j--) {
                pVetor[j + 1] = pVetor[j];
                pVetor[j] = nAux;
                
                //Reproduz gráfico
                if(pAnimacao)
                    oPrinter.printaGrafico(oScreen, j, j+1, pVetor[j], pVetor[j+1]);
            }
        }
        
        return pVetor;
    }//end insertionSort

    public int[] quickSort(){
        
        //Inicia gráfico
        if(pAnimacao)
            oPrinter.inicializar(oScreen,pVetor);
        
        int nTamanho = pVetor.length;
        divisao(0, nTamanho - 1);
        
        return pVetor;
    }
    //<editor-fold desc="Métodos auxiliares de quickSort">
    private void divisao(int nLimiteInf, int nLimiteSup){
        
        int i = nLimiteInf;
        int j = nLimiteSup;
        int nAux;
        
        int nPivo = pVetor[(nLimiteInf + (nLimiteSup - nLimiteInf)/2)];
        
        while (i < j) {
            while (pVetor[i] < nPivo) {
                i++;
            }
            
            while (pVetor[j] > nPivo) {
                j--;
            }
            
            if (i <= j) { // faz a troca
                nAux = pVetor[i];
                pVetor[i] = pVetor[j];
                pVetor[j] = nAux;
                
                //Reproduz gráfico
                if(pAnimacao)
                    oPrinter.printaGrafico(oScreen, i, j, pVetor[i], pVetor[j]);
                
                i++;
                j--;
            }
            
            if (nLimiteInf < j)
                divisao(nLimiteInf, j);
            
            if (i < nLimiteSup)
                divisao(i, nLimiteSup);
        }
    }
    //</editor-fold>
    
    public int[] heapSort(){
        
         //Inicia gráfico
        if(pAnimacao)
            oPrinter.inicializar(oScreen,pVetor);
        
        buildMaxHeap(pVetor);
        int nN = pVetor.length;
        
        for (int i = pVetor.length-1; i > 0; i--) {
            trocarElementos(pVetor, i, 0);
            maxHeapify(pVetor, 0, --nN);
        }
        return pVetor;
    }//end heapSort
    //<editor-fold desc="Métodos auxiliares de heapSort">
    private void buildMaxHeap(int[] nVetor){ 
          for (int i = nVetor.length/2 - 1; i >= 0; i--){
             maxHeapify(nVetor, i , nVetor.length );
          }
    }//end buildMaxHeap
    
    private void maxHeapify(int[] nVetor, int nPosicao, int nN){ 
          int nMaxi; 
          int nL = 2 * nPosicao + 1;
          int nDireita = 2 * nPosicao + 2;
          
          if ((nL < nN) && (nVetor[nL] > nVetor[nPosicao]))
             nMaxi = nL;
          else
             nMaxi = nPosicao;
          
          if (nDireita < nN && nVetor[nDireita] > nVetor[nMaxi]) 
             nMaxi = nDireita;
          
          if (nMaxi != nPosicao) 
          {
             trocarElementos(nVetor, nPosicao, nMaxi);
             maxHeapify(nVetor, nMaxi, nN);
          }
       }//end maxHeapify
    
    private void trocarElementos ( int[ ] nVetor, int nJ, int nAposJ ){
          /*Troca elementos do vetor de posição*/
        
          int nAux = nVetor[ nJ ];
          nVetor[nJ] = nVetor[ nAposJ ];
          nVetor [ nAposJ ] = nAux;
          
          //Reproduz gráfico
          if(pAnimacao)
            oPrinter.printaGrafico(oScreen, nJ, nAposJ, pVetor[nJ], pVetor[nAposJ]);      
          
       }// end swap
    //</editor-fold> 
    
    public int[] radixSort(){
        
        //Inicia gráfico
        if(pAnimacao)
            oPrinter.inicializar(oScreen,pVetor);
        
        Fila[] oFilas = new Fila[10]; 
        int nQtDigitos, nMaiorNum;
        
        // cria filas dentro da fila já existente
        for (int i = 0; i < oFilas.length ; i++) {
            oFilas[i] = new Fila(pVetor.length);
        }
        
        // descobre o maior número que consta no vetor
        nMaiorNum = maiorNum(pVetor);
        
        // descobre quantidade de caracteres do maioir número
        nQtDigitos = qtDigitos(nMaiorNum);

        
        for (int i = 0; i < nQtDigitos; i++) {
            //Define em qual fila o número será inserido
            for (int j = 0; j < pVetor.length; j++) {
                oFilas[(int) (pVetor[j] / Math.pow(10,(i)) % 10)].inserir(pVetor[j]);
            }    
            
            //Devolve o número ao vetor, removendo-o da fila
            int nN = 0;
            for (int j = 0; j < 10; j++) {
                int nTotElementos = oFilas[j].pQtElementos;
                
                for (int k = 0; k <= nTotElementos; k++) {
                    if (!oFilas[j].filaVazia()) {
                        //oFilas[j].pFila[oFilas[j].pFinal] ;
                        pVetor[nN] = oFilas[j].pFila[k] ;
                        oFilas[j].remover();
                        
                        //Reproduz gráfico
                        if(pAnimacao)
                            // já que não existe efetivamente uma troca de posições, passa como parâmetro a mesma posição do vetor
                            oPrinter.printaGrafico(oScreen, nN, nN, pVetor[nN], pVetor[nN]);          
                        
                        nN++;
                        
                    }
                    
                }
                
            }
            
        }
        

        
        return pVetor;
    }//end radixSort
    //<editor-fold desc="Métodos auxiliares de radixSort">
    private int qtDigitos(int nN){
        int nQtDigitos = 0;
        
        while (nN > 1) {
            nN = nN / 10;
            
            nQtDigitos++;
        }
        
        return nQtDigitos;
    }
    
    private int maiorNum(int[] nVetor){
        int nMax = 0;
        
        for (int i = 0; i < pVetor.length; i++) {
            if (pVetor[i] > nMax) {
                nMax = pVetor[i];
            }
        }
        
        return nMax;
    }
    //</editor-fold>
}
