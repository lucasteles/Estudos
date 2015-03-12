#include<stdio.h>
main() {

float a,b,IMC;
printf("veja se voce esta gordo!(Obs: separe os numeros por ponto): \n\n");
printf("Digite sua altura:" );
scanf("%f",&a);
printf("Digite seu peso:" );
scanf("%f",&b);
IMC=b/(a*a);

if(IMC < 20){printf("\n Abaixo do peso, saudavel");
}
if(IMC >= 20 && IMC < 25){printf("\n Peso normal, bem saudavel");
}
if(IMC >= 25 && IMC < 30){printf("\n Ascima do peso, voce esta gordo");
}
if(IMC >= 30 && IMC < 40){printf("\n Obeso, voce esta bem gordo faça um regime urgente");
}
if(IMC > 40){printf("\n voce esta MORBIDO, SE MATA CARA!!!!!!!");
}
}






