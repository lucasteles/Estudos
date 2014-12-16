import java.awt.Color;

public class DesenhaProcesso{
    int pVetor[];
    int pDis, pTop, pLeft, pRight, pBott, pProporcao, pMaxVal;
    
    public DesenhaProcesso(int[] arr){
        pVetor = arr;
        pDis = 3;
        pTop = 30;
        pLeft = 30;
        pRight = pLeft + (pVetor.length) * pDis ;
        pBott  = 400;
        pProporcao = pBott - pTop;
        pMaxVal = 0;
    }
   
    public void inicializar(Canvas oScreen,int[] nVetor){
           
        //Desenha o vetor desordenado (inicio do processo)
        oScreen.drawLine(pLeft, pTop, pRight, pTop);// Desenha linha superior
        oScreen.drawLine(pLeft, pBott, pRight, pBott);//Desenha linha inferior
        oScreen.drawLine(pLeft, pTop, pLeft, pBott);// Desenha lateral esquerda
        oScreen.drawLine(pRight, pTop, pRight, pBott);// Desenha lateral direita
        
        //Calcula proporção achando o maior valor do vetor
        for (int i = 1; i <= nVetor.length-1; i++){
            if(nVetor[i] > pMaxVal){
                pMaxVal = nVetor[i];
            }
        }
        
        // desenha vetor no espaço
        oScreen.wait(10);
        int nPos = pLeft;
        for (int i = 0; i <= pVetor.length-1; i++){
            int nTam = pProporcao * pVetor[i] / pMaxVal;
            oScreen.drawLine(nPos + pDis, pBott, nPos + pDis, pBott - nTam);
            nPos = nPos + pDis;
        }
    
    }
        
    public void printaGrafico(Canvas oScreen, int nIn, int nOut, int nValIn, int nValOut){
        oScreen.wait(1);
        
        int nPosIn = pLeft + (pDis * nIn);
        int nPosOut = pLeft + (pDis * nOut);
        Color cVermelho = new Color(255,0,0);
        Color cPreto = new Color(0,0,0);
        Color cAzul = new Color(0,0,255);        
        Color cFundo = new Color(255,255,255);
        
        // PISCA LINHA VERMELHA
        oScreen.setForegroundColour(cVermelho);
        oScreen.drawLine(nPosIn, pBott, nPosIn, pTop);
        oScreen.wait(5);
        oScreen.setForegroundColour(cFundo);
        oScreen.drawLine(nPosIn, pBott, nPosIn, pTop);

        // PISCA LINHA AZUL
        oScreen.setForegroundColour(cAzul);
        oScreen.drawLine(nPosOut, pBott, nPosOut, pTop);
        oScreen.wait(5);
        oScreen.setForegroundColour(cFundo);
        oScreen.drawLine(nPosOut, pBott, nPosOut, pTop);
        
        oScreen.setForegroundColour(cFundo);
        
        // apaga linha de entrada
        oScreen.drawLine(nPosIn, pBott , nPosIn, pTop);
        // apaga linha de saida 
        oScreen.drawLine(nPosOut, pBott , nPosOut, pTop);
        
        oScreen.setForegroundColour(cPreto);
        
        // escrevre linha de entrada
        oScreen.drawLine(nPosIn, pBott , nPosIn, pBott - (pProporcao * nValIn / pMaxVal));
        // escrevre linha de saida
        oScreen.drawLine(nPosOut, pBott , nPosOut, pBott - (pProporcao * nValOut / pMaxVal));

        //Desenha linhas
        oScreen.drawLine(pLeft, pTop, pRight, pTop);//superior
        oScreen.drawLine(pLeft, pBott, pRight, pBott);//inferior
        oScreen.drawLine(pLeft, pTop, pLeft, pBott);//esquerda
        oScreen.drawLine(pRight, pTop, pRight, pBott);//direita
        
    }
    
}
