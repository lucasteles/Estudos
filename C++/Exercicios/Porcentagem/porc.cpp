#include<stdio.h>
main () {

float ped,porc,tot;
int esc;

printf("escolha que operaçao de porcentagem deseja fazer:\n\n 1-pedaco \n 2-Porcentagem \n 3-Total \n\n Escolha:");
scanf("%i",&esc);
printf("\n\n");

if(esc==1){
printf("Gigite o valor total:");
scanf("%f",&tot);
printf("\n");
printf("Digite a porcentagem desejada:");
scanf("%f",&porc);
printf("\n");
printf("%f",(porc/100)*tot);
}

if(esc==2){
printf("Gigite o valor total:");
scanf("%f",&tot);
printf("\n");
printf("Digite o valor do pedaco para obter a porcentagem:");
scanf("%f",&ped);
printf("\n");
printf("%f",(ped/tot)*100);
}

if(esc==3){
printf("Digite o valor do pedaco equivalente a porcentagem:");
scanf("%f",&ped);
printf("\n");
printf("Digite a porcentagem para obter o total:");
scanf("%f",&porc);
printf("\n");
printf("%f",(100/porc)*ped);
}
if(esc > 3){printf("OPERACAO INVALIDA!!!\nSEU BURRO E SO ATE O 3");
}
}



