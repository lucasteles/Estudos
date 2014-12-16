/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Teste;
import javax.swing.JOptionPane;
import urna.Candidato;
import urna.Apurador;

/**
 *
 * @author rodrigo.paixao
 */
public class Tester {
    public static void  Tester()
    {
        Candidato[] cCandidatos = CadastraCandidato();
        Apurador aApurar = new Apurador(cCandidatos, 10);
        String cExibir = aApurar.Exibir();

        JOptionPane.showMessageDialog(null, cExibir);
    }

    public static Candidato[] CadastraCandidato()
    {
        Candidato[] eRetorno = new Candidato[5];

        eRetorno[0] = new Candidato("Jacques",  23  ,4);
        eRetorno[1] = new Candidato("Lucas",    666 ,3);
        eRetorno[2] = new Candidato("Rafael",   24  ,1);
        eRetorno[3] = new Candidato("Rodrigo",  1002,0);
        eRetorno[4] = new Candidato("Nulo",     0   ,2);

        return(eRetorno);
     }
}
