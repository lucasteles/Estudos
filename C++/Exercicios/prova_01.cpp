#include<stdio.h>
main(){
int CodCli, CodVend, Qtde, CodProd;
float Com, Preco;
printf("Digite aqui o Codigo do Cliente  "), scanf("%i", &CodCli);
printf("Digite aqui o Codigo do Vendedor "), scanf("%i", &CodVend);
printf("Digite aqui o Codigo do Produto  "), scanf("%i", &CodProd);
printf("Digite aqui o Preco do Produto   "), scanf("%f", &Preco);
printf("Digite aqui a quantidade         "), scanf("%i", &Qtde);

Com = ((Preco * Qtde)*2.5)/100;

printf("\n\n\nA Comissao do Vendedor %i, ficou em %.2f", CodVend, Com);
printf("\nO Cliente eh o %i", CodCli);
printf("\nO Produto escolhido foi o %i", CodProd);
}