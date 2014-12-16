/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ExercicoLista;


public class ExercicoLista {

    public static void main(String[] args) {
        
        Lista L1 = new Lista();
        Lista L2 = new Lista();
        Lista L3 = new Lista();
        
        L1.Add(20);
        L1.Add(10);
        L1.Add(90);
        L1.Sort();
                
        L2.Add(20);
        L2.Add(40);
        L2.Sort();
        
        L3.Add(60);
        L3.Add(10);
        L3.Add(70);
        L3.Sort();
        
        
        new Lista().Concatena(L1,L2,L3).Sort().Print();
        
        System.out.print("\n");
        
        new Lista().Unir(L1,L2,L3).Print();
        
        System.out.print("\n");
        
        new Lista().Intersec(L1,L2,L3).Print();
        
      
        
    }
}
