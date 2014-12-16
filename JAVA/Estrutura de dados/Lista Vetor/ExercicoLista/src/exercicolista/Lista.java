/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ExercicoLista;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

public class Lista {

    public int nIndice;
    public int[] nVetor = null;


    public Lista(){
    	nVetor = new int[1];
    	nIndice = 0;
    }

    public Lista(int nTaman)
    {
        this.nVetor = new int[ nTaman ];
    }

    public int Get(int nValue)
    {

        if (! ValidarTamanho(nValue) )
        {
            return -1;
        }

        return this.nVetor[nValue];
    }


    public void Add(int nValue)// podia ser void mesmo.
    {
        if(nIndice >= this.nVetor.length){
    	   int[] aux = new int[nIndice+1];
           System.arraycopy(nVetor, 0, aux, 0, nIndice);
    	   aux[nIndice] = nValue;
    	   nVetor = aux;
       }
       else{
    	   this.nVetor[this.nIndice]=nValue;
       }
       this.nIndice++;


    }

    public boolean Remove(int nValue)
    {

       if (! ValidarTamanho(nValue) )
       {
           return false;
       }

       nIndice--;

        for (int i = nValue; i < this.nIndice; i++) {
            this.nVetor[i]=this.nVetor[i+1];
        }

       return true;

    }

    public boolean Contains(int nValue)
    {
        for (int i = 0; i < this.nIndice; i++) {

            if (this.nVetor[i] == nValue) {
                    return true;
            }

        }

         return false;
    }

    private boolean ValidarTamanho(int nValue)
    {
    	if (nValue >= this.nIndice || nValue < 0)
       {
           return false;
       }
       return true;
    }

    public void Print()
    {
        for (int i = 0; i < this.nVetor.length; i++) {
            System.out.print(this.nVetor[i]);
            System.out.print(" ");
        }

    }

    public int Size(){
        return this.nIndice;
    }

    public void Clean()
    {
        this.nIndice = 0;
    }

    public boolean IsEmpty()
    {
        return (this.nIndice == 0);
        
    }
	
	
	public Lista Unir(Lista... MyLists)
	{	
		
		Lista Retorno = new Lista();
		
		for(Lista MainList: MyLists )
		{
                    for(int i=0;i < MainList.Size(); i++)
                    {
                       if (!Retorno.Contains(MainList.Get(i)) )
                             Retorno.Add( MainList.Get(i) );
                       
                       
                    }

		}
		return Retorno;
	}        
      
           public Lista Concatena(Lista... MyLists)
	{	
		
		Lista Retorno = new Lista();
		
		for(Lista MainList: MyLists )
		{
                    for(int i=0;i < MainList.Size(); i++)
                    {
                       Retorno.Add( MainList.Get(i) );
                    }

		}
		return Retorno;
	}
           
        public Lista Intersec(Lista... MyLists)
	{	
            
            Lista Retorno = new Lista();
            int nControle = 0;
            
            for(Lista MainList: MyLists )
            {
                for(int i=0;i < MainList.Size(); i++)
                {
                    for (Lista Aux: MyLists) {
                         if(Aux.Contains(MainList.Get(i))){nControle++;}
                    }
                 
                    if (nControle > 1 && !Retorno.Contains(MainList.Get(i)))
                    {
                        Retorno.Add(MainList.Get(i));
                    }
                    nControle = 0; 
                }
             }
            
            return Retorno;
	}   
           
     
}
