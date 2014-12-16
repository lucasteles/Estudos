
package listaligada;

import java.util.ArrayList;


public class ListaLigada {

    public static void main(String[] args) {
        
          Lista lista = new Lista();		
				
          lista.add(1);
          lista.add(2);
          lista.add(90);
          lista.add(4);
          lista.add("\\o/");
          
          System.out.println("Lista:");
          System.out.println(lista.toString());
          
          
          System.out.println("Invertida Exercicio 1:");
          lista = Invert(lista);                    
          System.out.println(lista.toString());
          
          System.out.println("o valor do ponto medio é:");
          System.out.println( Middle(lista) );
          
          
          System.out.println("Vetor bidimensional em lista:");
          lista = Matriz2Lista(new Object[][]{ {1,10},{2,20},{3,30}  });
          
          for (int i = 0; i < lista.size(); i++) {
                           
             Lista aux = (Lista) lista.get(i);
             System.out.print(aux.get(0));
             System.out.print(",");
             System.out.println(aux.get(1));
             
          }
          
          System.out.println("Polinomio:");
          
          
          
	}
    
    
        
         /*
         * 
         * Metodo que inverte a lista
         */
        public static Lista Invert(Lista lista)
        {
            ArrayList<Object> oNodes = new ArrayList<Object>();
            
            
            for (int i = 0; i < lista.size(); i++) {
                oNodes.add(lista.get(i));
            }
                
                lista.clear();
                
                int nLen = oNodes.toArray().length;
                
                for (int nXI = nLen; nXI > 0; nXI--)
                {
                    lista.add(oNodes.get(nXI-1));
                }
                
                return lista;
		
	}
          
       
         /*
         * 
         * Metodo que retorna o ponto medio
         */
         public static Object Middle(Lista lista)
         {
             Object oRetorno;
             
             int nMid = (int) lista.size()/2;
             oRetorno = lista.get(nMid);               
             
             return oRetorno;
             
        }
        
         
         /*
         * 
         * Metodo que retorna uma lista multidimensional
         */
         public static Lista Matriz2Lista(Object[][] Matriz)
         {
             Lista Retorno = new Lista();
             
             for (int i = 0; i < Matriz.length; i++) {
                 
                 Lista aux = new Lista();
                 
                 for (int j = 0; j < Matriz[i].length ; j++) {  
                   aux.add(Matriz[i][j]);
                }
                 
                 
                Retorno.add( aux );  
             }
              return Retorno;         
             
         }
        
}
