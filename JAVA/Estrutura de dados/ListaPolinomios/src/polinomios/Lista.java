
package polinomios;

public class Lista {
    	private Node raiz;
	
	/* 
	 * construtor da Lista
	 */
	public Lista(){
		raiz = new Node();
	}
	
        
    
        /*
	 * m�todo que insere um dado na lista 
	 */
	public void add(double nCoeficiente,double nExpoente){		
		Node auxiliar = raiz;
		
		Node novoNo = new Node();		
		novoNo.setDado(nCoeficiente,nExpoente);
		
                
		while(auxiliar.getProx() != null ){
                        
                        if ( (auxiliar.getProx().getDado(true) > nCoeficiente) 
                            || (auxiliar.getProx().getDado(true) == nCoeficiente && auxiliar.getProx().getDado(false) > nExpoente)
                          ) 
                        {
                            novoNo.setProx(auxiliar.getProx());
                            break;
                        }
                    
			auxiliar = auxiliar.getProx();
		}
		
		auxiliar.setProx(novoNo);		
	}

	
	
	/*
	 * m�todo que verifica se o objeto informado j� est� na lista
	 */
	public boolean contains(double nCoeficiente,double nExpoente){
		Node auxiliar = raiz;		
		while(auxiliar.getProx() != null){
			
			if(auxiliar.getProx().getDado(true)== (nCoeficiente) && auxiliar.getProx().getDado(false) == (nExpoente)){
				return true;
			}			
			auxiliar = auxiliar.getProx();
		}
		
		return false;
	}
	
	/*
	 * m�todo que remove um objeto da lista na posicao informada 
	 */
	public void remove(int posicao){
		
		if(posicao < 0 || posicao > size()){
			return;
		}
		
		Node auxiliar = raiz;
		int contador = 0;
		
		while(contador < posicao && auxiliar.getProx() != null){
			auxiliar = auxiliar.getProx();
			contador++;
		}
		
		Node noAserRemovido = auxiliar.getProx();		
		if(noAserRemovido != null){
			auxiliar.setProx(noAserRemovido.getProx());
			
		}
		else{
			auxiliar.setProx(null);
		}
	}
	
	/*
	 * m�todo que remove da lista o dado informado
	 */
	public boolean remove(double nCoeficiente,double nExpoente){		
		Node auxiliar = raiz;		
		while(auxiliar.getProx() != null){
			
			if(auxiliar.getProx().getDado(true)==(nCoeficiente) && auxiliar.getProx().getDado(false)==(nExpoente)){
				Node posterior = auxiliar.getProx().getProx();
				
				auxiliar.setProx(posterior);
				return true;
			}			
			auxiliar = auxiliar.getProx();
		}
		
		return false;
	}

	/*
	 * m�todo que retorna um dado na posi��o informada
	 */
	public double get(int i,boolean lTipo){
		int contador = -1;
		Node aux = raiz;
		while(contador < i && aux != null){
			aux = aux.getProx();
			contador++;
		}
		if(aux != null)
			return aux.getDado(lTipo);
		else
			return 0;
	}

	/*
	 * m�todo que calcula o tamanho da lista
	 */
	public int size(){
		Node aux = raiz;
		int contador = 0;
		while(aux != null){
			aux = aux.getProx();
			if(aux != null)
				contador++;
		}
		return contador;
	}
	
	/*
	 * m�todo que verifica se a lista est� vazia
	 */
	public boolean isEmpty(){
		if(raiz.getProx() == null)
			return true;
		else
			return false;
	}
	
	/*
	 * m�todo que elimina todos os dados da lista
	 */
	public void clear(){
		raiz.setProx(null);
	}
	
	/*
	 *  m�todo que imprime todos os objetos da lista
	 */
    @Override
	public String toString(){
		String texto = "";
		Node auxiliar = raiz.getProx();
		while(auxiliar != null){
			texto += String.valueOf(auxiliar.getDado(true))+"^"+ String.valueOf(auxiliar.getDado(false))+", ";			
			auxiliar = auxiliar.getProx();
		}
		if(texto.charAt(texto.length()-1) == ' ')
			texto = texto.substring(0, texto.length()-2);
		texto="["+texto+"]";
		return texto;
	}

    
    
}
