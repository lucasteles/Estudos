package urna;
import Teste.Tester;
import javax.swing.JOptionPane;

/**
 *
 * @author Rodrigo e Lucas
 */
public class Main {
    public static Eleitor[] eEleitores     = null;
    public static Candidato[] cCandidatos  = null;
    public static boolean lTeste = false;

    public static void main(String[] args) {

        if (lTeste) {
            Tester.Tester() ;
            return;
        }

        eEleitores    = CadastraEleitor();
        cCandidatos   = CadastraCandidato();

        Votar();
       
        Apurador aApurar = new Apurador(cCandidatos,eEleitores.length);

 

        JOptionPane.showMessageDialog(null, aApurar.Exibir());
        
        if (aApurar.lInvalida) {
            return;
        }
        
        if (aApurar.lSegTurn) {
            
            //REINICIA VOTACAO 
            for (int i = 0; i < eEleitores.length; i++) {
                eEleitores[i].lVotou = false;
            }
                              
            cCandidatos = aApurar.cCandidatos;
            Votar();
            aApurar = new Apurador(cCandidatos,eEleitores.length);
            aApurar.lSegTurn = false;
            JOptionPane.showMessageDialog(null, aApurar.Exibir());
        }        
    }

    public static void Votar()
    {
        String cVoto = "";
        for (int e = 0; e < eEleitores.length; e++)
        {
            int nIndex = ValidaTitulo(),
                nPartido = 0;

            String cTitulo = "Escolhe o candidato: ";
            for (int i = 0; i < cCandidatos.length; i++)
            {
                if (!cCandidatos[i].lInativo) //SÓ LISTA OS CANDIDATOS QUE ESTÃO ATIVOS NA VOTOÇÃO 
                {
                    cTitulo+= "\n" + Funcoes.PadL(Integer.toString(cCandidatos[i].nPartido), 4, '0') + " - " +
                                cCandidatos[i].cNome;
                }
            }

            cTitulo+= "\n" + "\n" + "Eleitor: " + eEleitores[nIndex].cNome +
                                 "   Nr.Titulo: " + eEleitores[nIndex].cTitulo;

            boolean lErro   = true;
            while (lErro)
            {
                cVoto = JOptionPane.showInputDialog(cTitulo);
                
                if (cVoto == null) {cVoto = "";}
                
                if (!cVoto.trim().isEmpty()) 
                {
                    nPartido = Integer.parseInt(cVoto);
                    // CASO VOTO CORRETO SAI DO LOOP
                    if (VotaCandidato(nPartido)) {lErro = false;}
                    else{JOptionPane.showMessageDialog(null, "Candidato Inválido,tente novamente.");}
                }
            }

            eEleitores[nIndex].lVotou = true; //MARCA O ELEITOR PARA ELE NÃO VOTAR NOVAMENTE
        }
     }
    
    public static int ValidaTitulo()
    {
        boolean lOk = false;
        int nIndex  = 0;
        
        while(!lOk)
        {
            String cTitulo = JOptionPane.showInputDialog("Digite seu titulo de eleitor: ");
            
            for (int i = 0; i < eEleitores.length; i++)
            {
                if(eEleitores[i].cTitulo.trim().equals(cTitulo) && !eEleitores[i].lVotou)
                {
                    lOk = true;
                    nIndex = i;
                    break;
                }
            }
            
            if(!lOk)
            {
                JOptionPane.showMessageDialog(null, "Eleitor Inválido ou já votou.");
            }
        }

        return(nIndex);
    }

    public static boolean VotaCandidato(int tnPartido)
    {
        boolean lOk = false;
        
        for (int i = 0; i < cCandidatos.length; i++)
        {
            if(tnPartido == cCandidatos[i].nPartido && !cCandidatos[i].lInativo)
            {
                cCandidatos[i].Vota();
                lOk = true;
                break;
            }
        }
        
        return(lOk);
    }

    public static Candidato[] CadastraCandidato()
    {
        Candidato[] eRetorno = new Candidato[5];
        
        eRetorno[0] = new Candidato("Jacques", 23);
        eRetorno[1] = new Candidato("Lucas", 666);
        eRetorno[2] = new Candidato("Rafael", 24);
        eRetorno[3] = new Candidato("Rodrigo", 1002);
        eRetorno[4] = new Candidato("Nulo", 0);
        
        return(eRetorno);
     }

     public static Eleitor[] CadastraEleitor()
    {
        Eleitor[] eRetorno = new Eleitor[10];
        
        eRetorno[0] = new Eleitor("Joyce"      , "0010");
        eRetorno[1] = new Eleitor("Dani"       , "0020");
        eRetorno[2] = new Eleitor("Heredia"    , "0030");
        eRetorno[3] = new Eleitor("Thiago"     , "0040");
        eRetorno[4] = new Eleitor("Ricardo"    , "0050");
        eRetorno[5] = new Eleitor("Marengone"  , "0060");
        eRetorno[6] = new Eleitor("Renato"     , "0070");
        eRetorno[7] = new Eleitor("Cecilia"    , "0080");
        eRetorno[8] = new Eleitor("Cristian"   , "0090");
        eRetorno[9] = new Eleitor("Ronaldo"    , "0099");

        return(eRetorno);
    }
}
