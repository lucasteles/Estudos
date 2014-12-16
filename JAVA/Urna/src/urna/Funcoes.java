/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package urna;


public class Funcoes {
        
    public static String PadL(String tcTexto,int tnTamanho,char tcCarac)
    {
        String cRetorno = "";
        
        if (tcTexto.length() >= tnTamanho)
        {
            return(tcTexto);
        }
              
        for (int i = tcTexto.length() + 1; i <= tnTamanho; i++) 
        {
            cRetorno+=tcCarac;
        }
        
        return(cRetorno + tcTexto);
    }
}
