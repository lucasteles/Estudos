#include<stdio.h>
main(){
float val,porc;
printf("valor: ");
scanf("%f",&val);
printf("porcentagem adiconada: ");
scanf("%f",&porc);
printf("resultado: %f", val+(val*porc)/100);
}



