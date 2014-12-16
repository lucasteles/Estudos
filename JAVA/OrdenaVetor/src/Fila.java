/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author William Rodrigues
 */
public class Fila {
    
    int[] pFila;
    int pInicio;
    int pFinal;
    int pQtElementos;
    
    public Fila(int nTamanho){
        
        pFila = new int[nTamanho];
        pInicio = 0; // indica a posição onde se encontra o elemento do início da fila, quando houver elemento na fila
        pFinal = -1; // indica a posição onde se encontra o elemento do final da fila, quando houver elemento na fila
        pQtElementos = 0;

    }
    
    public boolean filaCheia(){
        
        if (pQtElementos == pFila.length) 
            return true;
        else{
            return false;
        }
        
    }
    
    public boolean filaVazia(){
        
        if (pQtElementos == 0)
            return true; //fila vazia
        else{
            return false; // fila possui pelo menos um elemento
        }
        
    }
    
    public boolean inserir(int nElemento){
        
        if (filaCheia())
            return false; // fila está cheia
        else{
            // insere elemento na fila
            pFinal = ((pFinal + 1) % pFila.length);
            pFila[pFinal] = nElemento;
            pQtElementos++;
        }
        
        return true;
        
    }
    
    public int remover(){
        
        int nValor;
        
        if (filaVazia())
            return -1; //retorna código de erro
        else{
            nValor = pFila[pInicio];
            pInicio = ((pInicio + 1) % pFila.length);
            pQtElementos--;
            pFinal--;
            
            return nValor;
        }

    }
    
    public int exibirInicio(){
        
        if (filaVazia()) 
            return -1; // retorna código de erro
        else
            return pFila[pInicio];
        
    }
    
    public void exibirElementos(){
        
        int nIni, nQt;
        
        nIni = pInicio;
        nQt = pQtElementos;
        
        if (filaVazia()) 
            System.out.println("Fila vazia !");
        else
            while (nQt > 0) {
                nIni = ((nIni + 1) % pFila.length);
                System.out.print(pFila[nIni] + " | ");
            }
    }
    
    
}
