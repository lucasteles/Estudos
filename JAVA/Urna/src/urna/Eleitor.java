/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package urna;


public class Eleitor {
    public String cNome   = "";
    public String cTitulo = "";
    public boolean lVotou = false;

    public Eleitor()
    {

    }

    public Eleitor(String tcNome,String tcTitulo)
    {
        cNome   = tcNome;
        cTitulo = tcTitulo;
    }
}
