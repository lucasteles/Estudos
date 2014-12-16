/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fila.pilha;


public class FilaPilha {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Fila oFila = new Fila();
        oFila.Enqueue("Fila1");
        oFila.Enqueue("Fila2");
        oFila.Enqueue("Fila3");
        oFila.Enqueue("Fila4");
        oFila.Dequeue();
        
        System.out.println(oFila.Front());
        
        Pilha oPilha = new Pilha();
        oPilha.Push("Pilha1");
        oPilha.Push("Pilha2");
        oPilha.Push("Pilha3");
        oPilha.Push("Pilha4");
        
        oPilha.Pop();
        
        System.out.println(oPilha.Top());
    }
}
