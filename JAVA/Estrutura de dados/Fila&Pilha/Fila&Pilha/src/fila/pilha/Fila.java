
package fila.pilha;


public class Fila {
    private Item oComeco   =  null;
    
    public Fila()
    {
    }
    public void Enqueue(Object toDado)
    {
        if(oComeco!=null)
        {
            Item oAux = oComeco;
            // só executa o loop caso tenha mais do que 2 itens na lista por não ter necessidade de um loop com dois itens
            for (int i = 2; i <= Size(); i++) {
                oAux = oAux.oAnt;
            }
            oAux.oAnt = new Item(toDado);
        }
        else{
            oComeco = new Item(toDado);
        }
    }
    public Object Dequeue()
    {
        // pega o valor atual
        Object oRetorno = oComeco.GetValue();
        // coloca o anterior como o começo da fila
        oComeco = oComeco.oAnt;
        return(oRetorno);
    }
    public Object Front()
    {
        // pega o valor do comeco da fila
        return oComeco.GetValue();
    }
    public int Size()
    {
       int nCont = 0;
       Item oAux = oComeco;
       // conta até o anterior ser nulo
       while(oAux!=null)
       {
           nCont++;
           oAux = oAux.oAnt;
       }
       return(nCont);
    }
    public Boolean IsEmpty()
    {
       return(oComeco==null);
    }
}
