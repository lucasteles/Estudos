#include <stdio.h>
main() {
int n1=0,n2=0,n3=0,n4=0,n5=0,n6=0,n7=0,l,c=1,g=0;
do{
printf("Escolha o candidato que deseja votar \n");
printf("1-Amauri \n");
printf("2-Acacio \n");
printf("3-Gilberto \n");
printf("4-Tatiana \n");
printf("5-Nulo \n");
printf("6-Branco \n");
printf("0-Conclui a eleiçao \n\n");
printf("Escolha:");
scanf("%i", &l);
printf("\n");
if(l<>0 | l<>1 | l<>2 | l<>3 | l<>4 | l<>5 | l<>6){printf("SEU BURO NAO TEM ESSA OPCAO \n");}
if(l==1){n1=n1+1;}
if(l==2){n2=n2+1;}
if(l==3){n3=n3+1;}
if(l==4){n4=n4+1;}
if(l==5){n5=n5+1;}
if(l==6){n6=n6+1;}
if(l==0){
printf("\n");
printf("1-Amauri votos:%i", n1  );
printf("\n");
printf("2-Acacio votos:%i", n2  );
printf("\n");
printf("3-Gilberto votos:%i", n3  );
printf("\n");
printf("4-Tatiana votos:%i", n4  );
printf("\n");
printf("5-Nulo votos:%i", n5  );
printf("\n");
printf("6-Branco votos:%i\n", n6  );
printf("\n\n");
printf("Total de eleitores:%i", n1+n2+n3+n4+n5+n6);
printf("\n\n");
c=2;
if(n1>n2 && n1>n3 && n1>n4){printf("1-Amauri vencedor:%i", n1 );}
if(n2>n1 && n2>n3 && n2>n4){printf("2-Acacio vencedor:%i", n2  );}
if(n3>n1 && n3>n2 && n3>n4){printf("3-Gilberto vencedor:%i", n3 );}
if(n4>n1 && n4>n2 && n4>n3){printf("4-Tatiana vencedor:%i", n4 );}else{g=1;}
if(g==1){
if(n1==n2 && n1 > 0 | n1==n3 && n1 > 0 | n1==n4 && n1 > 0 ){printf("1-Amauri impate:%i", n1);}
printf("\n");
if(n2==n1 && n2 > 0 | n2==n3 && n2 > 0 | n2==n4 && n2 > 0){printf("2-Acacio impate:%i", n2);}
printf("\n");
if(n3==n1 && n3 > 0 | n3==n2 && n3 > 0 | n3==n4 && n3 > 0){printf("3-Gilberto impate:%i", n3);}
printf("\n");
if(n4==n1 && n4 > 0 | n4==n2 && n4 > 0 | n4==n3 && n4 > 0){printf("4-Tatiana impate:%i", n4);}
printf("\n");

}}
}while(c==1);
}


