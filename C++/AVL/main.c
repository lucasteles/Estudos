#include <stdio.h>
#include <stdlib.h>


typedef struct TREE {
  char dado;
  int fatbal;
  struct TREE *esq, *dir;
} AVL;


void LeArv(AVL **eainicio) {
  if (*eainicio == NULL) 
    printf (".");
  else {
    printf ("%i" , (*eainicio)->dado);
    LeArv (&((*eainicio)->esq));
    LeArv (&((*eainicio)->dir));  
  }
}


void Inicializa (AVL **eainicio){
  *eainicio = malloc (sizeof (AVL));
  (*eainicio)->esq = NULL;
  (*eainicio)->dir = NULL;
  }


void Insere (AVL *adesc, char dadonovo) {
	  AVL *paux, *pant, *pP, *pQ, *pantP, *pnovo;
	  int poschave;
	  int achou; 

	//ROTAÇÃO SIMPLES
	void RotacaoSimples (){
	  if (pP->fatbal == 1) {
		pP->dir = pQ->esq;
		pQ->esq = pP;
	  }
	  else {
		pP->esq = pQ->dir;
		pQ->dir = pP;
	  }
	  paux = pQ;
	  pP->fatbal = 0;
	  pQ->fatbal = 0;
	}



	//ROTAÇÃO DUPLA
	void RotacaoDupla (){
	  if (pP->fatbal == 1) {
		paux = pQ->esq;
		pQ->esq = paux->dir;
		paux->dir = pQ;
		pP->dir = paux->esq;
		paux->esq = pP;
	  }
	  else {
		paux = pQ->dir;
		pQ->dir = paux->esq;
		paux->esq = pQ;
		pP->esq = paux->dir;
		paux->dir = pP;
	  }
	  if (paux->fatbal == -poschave){
		pP->fatbal = 0;
		pQ->fatbal = poschave;
	  }
	  else 
		if (paux->fatbal == 0) {
		  pP->fatbal = 0;
		  pQ->fatbal = 0;
		}
		else {
		  pP->fatbal = -poschave;
		  pQ->fatbal = 0;
		}
	  paux->fatbal = 0;
	}
	
	
	

	//FATORES AJUSRTE
	void AjustaFatoresAVL (){
	  if (dadonovo < pP->dado){
		pQ = pP->esq;
		paux = pP->esq;
	  }
	  else {
		pQ = pP->dir;
		paux = pP->dir;
	  }
	  while (paux->dado != dadonovo)
		if (dadonovo < paux->dado) {
		  paux->fatbal = paux->fatbal - 1;
		  paux = paux->esq;
		}
		else {
		  paux->fatbal = paux->fatbal + 1;
		  paux = paux->dir;
		}
	}


	//BALANCEAMENTO
	void BalanceiaAVL (){
	  if (dadonovo < pP->dado)
		poschave = -1;
	  else
		poschave = 1;
	  if (pP->fatbal == 0)
		pP->fatbal = poschave;
	  else 
		if (pP->fatbal == -poschave)
		  pP->fatbal = 0;
		else {
		  if (pQ->fatbal * poschave > 0)
			RotacaoSimples ();
		  else
			RotacaoDupla ();
		  if (pantP->dir == pP)
			pantP->dir = paux;
		  else
			pantP->esq = paux;
		}
	}
	

	// corpo do Insere
	  paux = adesc->dir;
	  pP = paux;
	  pant = adesc;
	  pantP = adesc;
	  achou = 0;
	  while ((!achou) && (paux != NULL)) {
		if (paux->fatbal != 0) {
		  pP = paux;
		  pantP = pant;
		}
		pant = paux;
		if (dadonovo == paux->dado)
		  achou = 1;
		else
		  if (dadonovo < paux->dado)
			paux = paux->esq;
		  else
			paux = paux->dir;
	  }
	  if (achou)
		printf("este dado ja esta presente na arvore\n");
	  else {
		pnovo = malloc (sizeof (AVL));
		pnovo->dado = dadonovo;
		pnovo->esq = NULL;
		pnovo->dir = NULL;
		pnovo->fatbal = 0;
		if (adesc->dir == NULL)
		  adesc->dir = pnovo;
		else {
		  if (dadonovo < pant->dado)
			pant->esq = pnovo;
		  else
			pant->dir = pnovo;
		  AjustaFatoresAVL ();
		  BalanceiaAVL ();
		}
	  }
}





//
// PROGRAMA MAIN
//


main ()
{
  AVL *aini;
  int resp,s=0,Value;
  
  Inicializa (&aini);  
  printf ("Quantos valores quer inserir na arvore? \n");
  scanf ("%i" , &resp);
  printf ("Digite os valores: \n"); 
  
  for( s = 0; s < resp; s++ )
  {
    scanf ("%i" , &Value);  
    Insere (aini, Value);
  }

  printf ("\n Arvore: \n");
  LeArv (&((aini)->dir));

  
  printf("\n\n");
  system("pause");
}



