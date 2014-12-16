
package fila.pilha;

public class Pilha {
    private Item oTop   =  null;
    
    public Pilha()
    {
    }
    public void Push(Object toDado)
    {   
        // cria um novo item com o topo como anterior
        Item oAux = new Item(oTop);
        // altera o valor do novo topo
        oAux.SetValue(toDado);
        // coloca o novo item no topo
        oTop = oAux;
    }
    public Object Pop()
    {
        // pega o valor do item
        Object oRetorno = oTop.GetValue();
        // coloca o anterior no topo
        oTop = oTop.oAnt;
        return(oRetorno);
    }
    public Object Top()
    {
        return oTop.GetValue();
    }
    public int Size()
    {
       int nCont = 0;
       Item oAux = oTop;
       
       while(oAux!=null)
       {
           nCont++;
           oAux = oAux.oAnt;
       }
       return(nCont);
    }
    public Boolean IsEmpty()
    {
       return(oTop==null);
    }
}

