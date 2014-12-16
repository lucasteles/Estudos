/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cinemafilmes;

import java.sql.Time;

/**
 *
 * @author rmendonca
 */
public class Horario {
    public Time dHora = null;
    
    public Horario(String tcTime)
    {
        SetTime(tcTime);
    }
    public Horario SetTime(String tcTime)
    {
        dHora = Time.valueOf(tcTime);
        return(this);
    }
}
