#include<stdio.h>
	main (){
	float n1,n2,m1,n3,n4,m2,n5,n6,m3,n7,n8,m4,ma;

	printf("Digite a primeira nota do primeiro bimestre: ");
	scanf("%f", &n1);
	printf("Digite a segunda nota do primeiro bimestre: ");
	scanf("%f", &n2);
	printf ("\n Media do primeiro bimestre: ");
	printf("\n %f",(n1+n2)/2);
	m1=((n1+n2)/2);
	printf("\n\n");
	printf("Digite a primeira nota do segundo bimestre: ");
	scanf("%f", &n3);
	printf("Digite a segunda nota do segundo bimestre: ");
	scanf("%f", &n4);
	printf("\n Media do segundo bimestre: ");
	printf("\n %f",(n3+n4)/2);
	m2=((n3+n4)/2);
	printf("\n\n");
	printf("Digite a primeira nota do terceiro bimestre: ");
	scanf("%f", &n5);
	printf("Digite a segunda nota do terceiro bimestre: ");
	scanf("%f", &n6);
	printf("\n Media do terceiro bimestre: ");
	printf("\n %f",(n5+n6)/2);
	m3=((n5+n6)/2);
	printf("\n\n");
	printf("Digite a primeira nota do quarto bimestre: ");
	scanf("%f", &n7);
	printf("Digite a segunda nota do quarto bimestre: ");
	scanf("%f", &n8);
	printf("\n Media do quarto bimestre: ");
	printf("\n %f",(n7+n8)/2);
	m4=((n7+n8)/2);
	printf("\n\n");
	printf("Media Anual \n%f",(m1+m2+m3+m4)/4);
	printf("\n\n");
	ma=((m1+m2+m3+m4)/4);
	if(ma>=5){printf("Aluno aprovado");}
	else {printf("Aluno reprovado");}
	}







