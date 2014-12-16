

package urna;


public class Apurador {
    public Candidato[] cCandidatos  = null;
    public int nTotVotos            = 0;
    public boolean lSegTurn         = false;
    public Rank[] rRank             = null;
    public int nNulos               = 0;
    public boolean lInvalida        = false;

    public Apurador(Candidato[] tcCandidatos,int tnVotos)
    {
        cCandidatos = tcCandidatos;
        nTotVotos   = tnVotos;
        rRank = new Rank[cCandidatos.length - 1];
        
        VerificaResultados();
    }
    
    public String Exibir()
    {
        if(lInvalida){
            return "Eleição invalida, 50% ou mais de votos nulos!";
        }
        
        String cTabela = "";

        for (int i = 0; i < rRank.length; i++) 
        {
            cTabela+= Integer.toString(rRank[i].nPosicao) + "º " 
                    + Funcoes.PadL(Integer.toString(cCandidatos[i].nPartido), 4, '0') + " - " + rRank[i].cCandidato.cNome 
                    + " - " + Double.toString(rRank[i].nPercent) + "%\n";
        }
        
        cTabela+="\nVotos nulos: " + Integer.toString(nNulos) + "% \n";
                
        if (lSegTurn) {cTabela+= "\nIndo para o segundo turno.";}

        return(cTabela);
    }
    
    private void VerificaResultados()
    {
        Candidato cAux = new Candidato(0);
        Candidato cNulo = new Candidato(0);
        
        //ORDENAÇÃO BUBBLE SORT E TRATA PARA QUE O NULO FIQUE EM ULTIMO
        for (int i = 0; i < cCandidatos.length; i++) 
        {
            for (int j = i + 1; j < cCandidatos.length; j++) 
            {
                if (cCandidatos[i].nVotos < cCandidatos[j].nVotos) 
                {
      
                        cAux = cCandidatos[i];
                        cCandidatos[i] = cCandidatos[j];
                        cCandidatos[j] = cAux;
                    
                }
            }
        }

        //VERIFICA SE VAI TER SEGUNDO TURNO
        if ((cCandidatos[0].nVotos * 100) / nTotVotos < 50)
        {
            lSegTurn = true;
            int n=2;
            if(cCandidatos[0].VerifNulo()||cCandidatos[1].VerifNulo()){n++;}
         
            for (int i = n; i < cCandidatos.length; i++) {
                if (!cCandidatos[i].VerifNulo()) {
                    cCandidatos[i].lInativo = true;
                }
            }
        }
        else
        {
            //VERICANDO SE O NULO GANHOU
            if (cCandidatos[0].VerifNulo()) {
                lInvalida = true;
            }
        }
        
        //MOVE NULO PRA O FINAL
        for (int i = 0; i < cCandidatos.length; i++) {
            if (cCandidatos[i].VerifNulo()&&i<cCandidatos.length-1) {
                cAux = cCandidatos[i+1];
                cCandidatos[i+1]=cCandidatos[i];
                cCandidatos[i]=cAux;
            }
        }
        
        
        //MONTANDO RANK
        int nAux = 0, j = 0;
        for (int i = 0; i < cCandidatos.length; i++)
        {
            if (cCandidatos[i].VerifNulo()) {
                nNulos = (cCandidatos[i].nVotos * 100) / nTotVotos; 
                nAux+=1;
            }
            else
            {
                rRank[j] = new Rank();
                rRank[j].cCandidato = cCandidatos[i];

                if (i > 0) {
                    if (cCandidatos[i].nVotos==cCandidatos[i-1].nVotos) {
                        nAux++;
                    }
                }

                rRank[j].nPosicao = (i + 1) - nAux;
                rRank[j].nPercent = (cCandidatos[i].nVotos * 100) / nTotVotos;
                j++;
            }
        }
    }
}