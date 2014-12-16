
package arvorebinaria;
import javax.swing.JOptionPane;

public class ArvoreBinaria {
    public static int nValorNulo = -1; // SETA O VALOR QUE VAI REPRESENTAR A AUSENCIA DE VALOR
    public static int nTamArvores = 50;
    
    public static void main(String[] args) {
        

        //cria arvore a partir de um vetor
        int[] nVetor1 = {10,19,74,45,1,36,71,2};
        int[] nArvore1 = Criar(nVetor1);
                
        //exibe arvore
        JOptionPane.showMessageDialog(null, DesenhaArvore(nArvore1,0));
        
        //cria segunda arvore a partir de um vetor
        int[] nVetor2 = {5,35,74,4,78,0,3,9,74};
        int[] nArvore2 = Criar(nVetor2);
        
        //exibe arvore
        JOptionPane.showMessageDialog(null, DesenhaArvore(nArvore2,0));
        
        //Funde as duas arvores
        int[] nComun = Fusao(nArvore1,nArvore2);
        
        //exibe arvore fundida
        JOptionPane.showMessageDialog(null, DesenhaArvore(nComun,0));
        
        
        //traz indice do vetor de um numero procurado
        int nBuscado = Integer.parseInt(JOptionPane.showInputDialog("Qual valor esta a rocurar?: ")); 
        JOptionPane.showMessageDialog(null, Buscar(nBuscado,nComun,0));
        
        
    }
    public static int[] Criar(int[] tnVetor)
    {
        // cria a arvore com os valores "nulos"
        int[] nArvore = ValorNulo(new int[nTamArvores]);
        // ordena o valores do vetor para incluir na arvore
        tnVetor = OrdenaVetor(tnVetor);
        // pega o meio do vetor
        int nMeio = (CountVetor(tnVetor) / 2) + 1;
        // começa a incluir na arvore apartir do meio do vetor
        for (int i = nMeio; i < tnVetor.length; i++) {
            nArvore = Incluir(tnVetor[i],nArvore,0);
        }
        // inclui o começo até o meio do vetor
        for (int i = 0; i < nMeio; i++) {nArvore = Incluir(tnVetor[i],nArvore,0);}
        return(nArvore);
    }
    public static int[] Incluir(int tnValor,int[] tnArvore,int tnIndex)
    {
        // se estourar o tamanho do vetor para
        if(tnArvore.length < tnIndex){return(tnArvore);}
        // se estiver numero, adiciona o valor
        if(tnArvore[tnIndex] == nValorNulo){tnArvore[tnIndex] = tnValor;}
        else
        {
            if(tnArvore[tnIndex] > tnValor){Incluir(tnValor,tnArvore,(tnIndex*2) + 1);}
            else{Incluir(tnValor,tnArvore,(tnIndex*2) + 2);}
        }
        return(tnArvore);
    }
    public static int Buscar(int tnValor,int[] tnArvore,int tnIndex)
    {
        if(tnArvore.length < tnIndex){return(nValorNulo);}
        if(tnArvore[tnIndex] != tnValor && tnArvore[tnIndex] != nValorNulo)
        {
            if(tnValor < tnArvore[tnIndex]){return(Buscar(tnValor,tnArvore,(2 * tnIndex) + 1)) ;}
            else{return(Buscar(tnValor,tnArvore,(2 * tnIndex) + 2)) ;}
        }
	else
        {
            if(tnArvore[tnIndex] == tnValor){return(tnIndex);}
            else{return(nValorNulo);}
        }
    }
    public static int[] Comparar(int[] tnArvore1,int[] tnArvore2)
    {
        // PEGA O TAMANHO DO MENOR VETOR PARA RETORNO
        int nTam = 0,nInx = 0;
        if (tnArvore1.length > tnArvore2.length) {nTam = tnArvore2.length;}
        else{nTam = tnArvore1.length;}
        int[] nComuns = ValorNulo(new int[nTam]);
        
        // CONSULTANDO CADA ELEMENTO DA ARVORE 1 BUSCA NA ARVORE 2
        for (int i = 0; i < tnArvore1.length; i++) {
            if (Buscar(tnArvore1[i],tnArvore2,0) != nValorNulo) {
                nComuns[nInx] = tnArvore1[i];
                nInx++;
            }
        }
        return(nComuns);
    }
    public static int[] Fusao(int[] tnArvore1,int[] tnArvore2)
    {
        tnArvore1  = LimpaIguais(tnArvore1,tnArvore1,tnArvore1.length);
        tnArvore2  = LimpaIguais(tnArvore2,tnArvore2,tnArvore2.length);
        int[] nFusao = LimpaIguais(tnArvore1,tnArvore2,tnArvore1.length + tnArvore2.length);
        nFusao = Criar(nFusao);
        
        return(nFusao);
    }
    public static int[] ValorNulo(int[] tnArvore)
    {
        // adiciona para todos os campos o valor nulo
        for (int i = 0; i < tnArvore.length; i++) {tnArvore[i] = nValorNulo;}
        
        return(tnArvore);
    }
    
    public static int[] OrdenaVetor(int[] tnVetor)
    {
        int nAux = 0;
        for (int i = 0; i < tnVetor.length; i++) {
            if(tnVetor[i] != nValorNulo)
            {
                for (int j = i + 1; j < tnVetor.length; j++) {
                    if (tnVetor[i] > tnVetor[j] && tnVetor[j] != nValorNulo) {
                        nAux = tnVetor[i];
                        tnVetor[i] = tnVetor[j];
                        tnVetor[j] = nAux;
                    }
                }
            }
        }
        return(tnVetor);
    }
    public static int[] LimpaIguais(int[] tnVetor1,int[] tnVetor2,int nTam)
    {
        int[] nLimpo = ValorNulo(new int[nTam]);

        nLimpo = IncluiVetor(tnVetor1,nLimpo);
        nLimpo = IncluiVetor(tnVetor2,nLimpo);
        
        return(nLimpo);
    }
    public static int[] IncluiVetor(int[] tnVetor,int[] tnSaida )
    {
        boolean lExiste = false;
        int nInx = CountVetor(tnSaida);
        
        for (int i = 0; i < tnVetor.length; i++) {
            if (tnVetor[i] != nValorNulo) {
                for (int j = 0; j < tnSaida.length; j++) {
                    if (tnVetor[i] == tnSaida[j]) {
                        lExiste = true;
                    }
                }
                if(!lExiste){
                    tnSaida[nInx] = tnVetor[i];
                    nInx++;
                }
            }
            lExiste = false;
        }
        return(tnSaida);
    }
    public static int CountVetor(int[] tnVetor)
    {
        int nCount = 0;
        for (int i = 0; i < tnVetor.length; i++) {
            if (tnVetor[i] == nValorNulo) {
                i = tnVetor.length;
            }
            else{nCount++;}
        }
        return(nCount);
    }
    
    
    public static String DesenhaArvore(int[] tnArvore,int nNO)
    {
       
        String cTexto="",cAux="";
        int nEsq = nNO*2+1;
        int nDir = nNO*2+2;
        int nVolta = 0;
        
        if (nEsq <  tnArvore.length)
        {
           if(tnArvore[nEsq] != nValorNulo)
           {
                cTexto += "["+String.valueOf(tnArvore[nNO])+"] ";
                cTexto += String.valueOf(tnArvore[nEsq])+" - a esquerda \n";
                cTexto += DesenhaArvore(tnArvore,nEsq);
                 nVolta = 0;
           }
           else
           {
               nVolta = 1;
           }
        }
        else
        {
           nVolta=1;
        }
        
        if (nDir <  tnArvore.length)
        {
           if(tnArvore[nDir] != nValorNulo)
           {
                cTexto += "["+String.valueOf(tnArvore[nNO])+"] ";
                cTexto += String.valueOf(tnArvore[nDir])+" - a direita \n"; 
                cTexto += DesenhaArvore(tnArvore,nDir);
                 nVolta = 0;
           }   
         else
           {
               nVolta=1;
           }
        }
        else
        {
           nVolta=1;
        }
        
        if (nVolta==1)
        {
            return cTexto;
        }
               
        return cTexto;
    }
    
    
}