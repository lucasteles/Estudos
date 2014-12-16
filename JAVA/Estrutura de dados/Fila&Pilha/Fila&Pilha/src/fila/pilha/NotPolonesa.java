
package fila.pilha;
import javax.swing.JOptionPane;


public class NotPolonesa {
    public static void main(String[] args) {
        String cExp = JOptionPane.showInputDialog("Digite a expressão polonesa!\n\n(Separe os digitos e operações por espaço.)");
        //String cExp = "9 3 * 4 5 + 4 4 * / /";
        cExp =" " + cExp + " ";
        String cAux = "",cOperadores = "+-/*";
        Pilha oPilha = new Pilha();
        double nResult = 0,nValor1 = 0,nValor2 = 0;
        int nOco = 0;
        
        // armazena na pilha
        for (int i = 2; i <= cExp.length(); i++) {
            cAux = ExtractNum(cExp," "," ",nOco);
            if(!cOperadores.contains(cAux.trim()))
                oPilha.Push(cAux);
            else{
                nValor2 = Double.parseDouble(oPilha.Pop().toString());
                nValor1 = Double.parseDouble(oPilha.Pop().toString());
                nResult = ExecutaOperador(cAux,nValor1,nValor2);
                oPilha.Push(nResult);
            }
            i += cAux.length();
            nOco++;
        }
        JOptionPane.showMessageDialog(null, "Resultado: " + oPilha.Top());
    }
    
    public static double ExecutaOperador(String tcOpe,double tnValor1,double tnValor2)
    {
        double nRetorno = 0;
        char cOpe = tcOpe.trim().charAt(0);
        
        switch(cOpe){
            case '+':
                nRetorno = tnValor1 + tnValor2;
                break;
            case '-':
                nRetorno = tnValor1 - tnValor2;
                break;
            case '*':
                nRetorno = tnValor1 * tnValor2;
                break;
            case '/':
                nRetorno = tnValor1 / tnValor2;
                break;
        }   
        return(nRetorno);
    }
    public static String ExtractNum(String cPrinc,String tcIni,String tcFin,int tnOco)
    {
        String cRetorno = "";
        
        int nOco1 = 0;
        int nOco2 = cPrinc.length();

        if (!"".equals(tcIni)){
            nOco1 = cPrinc.indexOf(tcIni,0);
        }
        if (!"".equals(tcFin)){
            nOco2 = cPrinc.indexOf(tcIni,1);
        }

        for (int i = 1; i <= tnOco; i++){
            nOco1 = nOco2;
            nOco2 = cPrinc.indexOf(tcFin,nOco1 +1);
        }

        cRetorno = cPrinc.substring(nOco1 + 1, nOco2);
        
        return(cRetorno);
    }
}
