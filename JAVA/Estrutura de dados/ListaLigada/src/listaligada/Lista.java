
package listaligada;

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
	public void add(Object objeto){		
		Node auxiliar = raiz;
		
		Node novoNo = new Node();		
		novoNo.setDado(objeto);
		
		while(auxiliar.getProx() != null){
			auxiliar = auxiliar.getProx();
		}
		
		auxiliar.setProx(novoNo);		
	}

	/*
	 * m�todo que insere um dado na lista na posi��o informada
	 */
	public void add(int posicao, Object objeto){
		if(posicao < 0 || posicao > size()){
			System.out.println("Posicao inv�lida!");
			return;
		}		
		Node auxiliar = raiz;
		
		Node novoNo = new Node();
		novoNo.setDado(objeto);
		
		int contador = 0;
		while(auxiliar.getProx() != null && contador < posicao){
			auxiliar = auxiliar.getProx();
			contador++;
		}		
		
		novoNo.setProx(auxiliar.getProx());
		auxiliar.setProx(novoNo);
	}
	
	/*
	 * m�todo que verifica se o objeto informado j� est� na lista
	 */
	public boolean contains(Object objeto){
		Node auxiliar = raiz;		
		while(auxiliar.getProx() != null){
			
			if(auxiliar.getProx().getDado().equals(objeto)){
				return true;
			}			
			auxiliar = auxiliar.getProx();
		}
		
		return false;
	}
	
	/*
	 * m�todo que remove um objeto da lista na posicao informada e retorna este objeto
	 */
	public Object remove(int posicao){
		
		if(posicao < 0 || posicao > size()){
			return null;
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
			return noAserRemovido.getDado();
		}
		else{
			auxiliar.setProx(null);
			return null;
		}
	}
	
	/*
	 * m�todo que remove da lista o dado informado
	 */
	public boolean remove(Object objeto){		
		Node auxiliar = raiz;		
		while(auxiliar.getProx() != null){
			
			if(auxiliar.getProx().getDado().equals(objeto)){
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
	public Object get(int i){
		int contador = -1;
		Node aux = raiz;
		while(contador < i && aux != null){
			aux = aux.getProx();
			contador++;
		}
		if(aux != null)
			return aux.getDado();
		else
			return null;
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
	public String toString(){
		String texto = "[";
		Node auxiliar = raiz.getProx();
		while(auxiliar != null){
			texto += auxiliar.getDado().toString()+", ";			
			auxiliar = auxiliar.getProx();
		}
		if(texto.charAt(texto.length()-1) == ' ')
			texto = texto.substring(0, texto.length()-2);
		texto+="]";
		return texto;
	}

    
    
}
