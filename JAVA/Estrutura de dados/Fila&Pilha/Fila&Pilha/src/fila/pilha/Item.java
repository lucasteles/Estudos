
package fila.pilha;


public class Item {
    Object oDado = null;
    Item oAnt = null;
            
    public Item()
    {
    
    }
    public Item(Item toAnt)
    {
        oAnt = toAnt;
    }
    public Item(Object toDado)
    {
        oDado = toDado;
    }
    public Object GetValue()
    {
        return(oDado);
    }
    public void SetValue(Object toDado)
    {
        oDado = toDado;
    }
}