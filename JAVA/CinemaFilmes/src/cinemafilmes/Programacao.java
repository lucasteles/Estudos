/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cinemafilmes;

/**
 *
 * @author rmendonca
 */
public class Programacao {
    public Horario[] oHora = new Horario[3];
    
    public Programacao()
    {
    }
    
    public void SetHorarios(Horario toHora1,Horario toHora2,Horario toHora3)
    {
        oHora[0] = toHora1;
        oHora[1] = toHora2;
        oHora[2] = toHora3;
    }
    
}
