#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int Test(char*[10], int qtParam);

char c = '\0';
char *Comm[10];

int main(int argc, char *argv[], char *envp[])
{
    int i,j,lLoop;
    for (i=0; i<10; i++){
        Comm[i]=malloc(255);
        memset(Comm[i],'\0',255);
    }


    i=0;j=0;lLoop=0;
	printf("read->");
	while(lLoop==0) {
		c = getchar();

		switch(c)
		{
            case '\n':

                if ( strcmp(Comm[0],"quit")==0)
                    lLoop = -1;

                if(Test(Comm,i)==0)
                    printf("=Command not recognized!\n\n");

                 for (i=0; i<10; i++)
                    memset(Comm[i],'\0',255);

                j=0;
                i=0;
                printf("read->");
                break;
            case ' ':
                i++;
                j=0;
                break;
            default:
                Comm[i][j]=c;
                j++;
                break;
		}


	}
	printf("\n");

    int x=0;
    for (x=0; x<i-1; x++)
        printf("\n-%s", Comm[x]);

	for (i=0; i<10; i++)
       free(Comm[i]);

	return 0;
}


int Test(char* Command[10], int qtParam)
{
    int nRet = 0;
    char *line = NULL,*Var = NULL,*cValue = NULL;
    size_t nLen = 255;
    FILE *fp = fopen("Shell.txt","r");

    //alocando spaço
    line=(char*)malloc(nLen);
    Var=(char*)malloc(nLen);
    cValue=(char*)malloc(nLen);

    //limpando espaço alocado
    memset(line,'\0',nLen);

    if( fp == NULL ) {
        return 0;
    }

    int tpLeitura = 0;
    while( fgets(line,nLen,fp) ) {

        memset(cValue,'\0',nLen);
        memset(Var,'\0',nLen);
        tpLeitura = 0;

        int nC;
        for(nC=0; nC < nLen; nC++)
        {
            if (line[nC]==';' || line[nC]=='#' )
               break;

            if(line[nC]!='=' && tpLeitura==0)
                Var[nC]=line[nC];
            else
            {
                if (tpLeitura==0)
                    tpLeitura=nC+1;
            }


            if (tpLeitura!=0 && line[nC]!='=')
                 cValue[nC-tpLeitura] = line[nC];

           }

            if ( strcmp(Command[0],Var)==0 ){
                nRet=1;
                printf("=%s",cValue);

                int np=0;
                if (qtParam>0)
                {
                    printf("\n ");
                    for (np=1;np<=qtParam;np++)
                        printf("Param%i=%s ",np,Command[np]);
                }


                printf("\n\n");
            }
    }

    free(line);
    free(cValue);
    free(Var);
    return nRet;

}
