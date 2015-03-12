#include<stdio.h>
main(){
float n1,n2,med;
printf ("Digite a primeira nota: ");
scanf("%f", &n1);
printf ("Digite a segunda nota: ");
scanf("%f", &n2);
med=(n1+n2)/2;
if(med>4){printf("Aluno aprovado");}
else {printf("Aluno reprovado");}
}
