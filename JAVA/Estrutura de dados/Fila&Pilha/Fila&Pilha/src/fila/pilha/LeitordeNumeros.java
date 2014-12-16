/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fila.pilha;
import javax.swing.JOptionPane;


public class LeitordeNumeros {
    public static void main(String[] args) {
        Fila oFila = new Fila();
        int nDig = -1;
        
        while(nDig!=0){
            nDig = Integer.parseInt(JOptionPane.showInputDialog("Digite um Número!\n\n(Digite Zero para exibir os numeros em ordem.)"));
            if(nDig!=0)
                oFila.Enqueue(nDig);
        }
        String cDigitados  = "";
        int nValor;
        while(!oFila.IsEmpty()){
            nValor = Integer.parseInt(oFila.Dequeue().toString());
            nValor = (int)Math.pow(nValor, 2);
            cDigitados += nValor + "\n";
        }
        JOptionPane.showMessageDialog(null, cDigitados);
    }
}
