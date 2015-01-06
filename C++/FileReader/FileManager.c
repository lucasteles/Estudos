
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "FileManager.h"


///abre arquivo
FILE* gdp_files_open(char* FileName)
{
	FILE* fRet =  fopen(FileName,"r");

	if( fRet == NULL ) {
        return NULL;
    }

	return fRet;
}

///fecha arquivo
void gdp_files_close(FILE* FilePointer)
{

	if (FilePointer!=NULL)
		fclose(FilePointer);
}

// retorna string
char* gdp_files_getstring(FILE *fFile, char* cParameter)
{

    char *line = NULL,*Var = NULL,*cValue = NULL, *cReturn = NULL;
    size_t nLen = GDP_READ_LINE_SIZE;
    FILE *fp = fFile;
	int tpLeitura = 0;
	int nC=0;
	
	if( fp == NULL ) {
        return NULL;
    }

    //alocando spaçosss
    line=(char*)malloc(nLen);
    Var=(char*)malloc(nLen);
    cValue=(char*)malloc(nLen);

    //limpando espaço alocado
    memset(line,'\0',nLen);

    while( fgets(line,nLen,fp) ) 
	{

        memset(cValue,'\0',nLen);
        memset(Var,'\0',nLen);
        tpLeitura = 0;
		
        for(nC=0; nC < nLen; nC++)
        {
            if (line[nC]==';' || line[nC]=='#' )
               break;

            if(line[nC]!='=' && tpLeitura==0)
                Var[nC]=line[nC];
            else {
                if (tpLeitura==0)
                    tpLeitura=nC+1;
            }


            if (tpLeitura!=0 && line[nC]!='=')
                 cValue[nC-tpLeitura] = line[nC];
        }

		if ( strcmp(Var,cParameter) == 0)	{
               cReturn=cValue;
			   break;
		}
	
    }

    free(line);
    //free(cValue);
    free(Var);
    return cReturn;

}

/// retorna inteiro
int gdp_files_getint(FILE* fFile, char* cParameter)
{
	char* charToInt = NULL;
	int nRet=0;


	charToInt = gdp_files_getstring(fFile, cParameter);
	nRet = atoi(charToInt);
	free(charToInt);
	return nRet;

}

///retorna double
double gdp_files_getfloat(FILE* fFile, char* cParameter)
{
	char* charToInt = NULL;
	float nRet=0;


	charToInt = gdp_files_getstring(fFile, cParameter);
	nRet = atof(charToInt);
	free(charToInt);
	return nRet;

}

//retornos rapidos 
char* gdp_files_quick_getstring(char* FileName, char* cParameter)
{
	FILE *fAux = gdp_files_open(FileName);
	char *ret = gdp_files_getstring(fAux, cParameter);
	gdp_files_close(fAux);
	return ret;

}

int gdp_files_quick_getint(char* FileName, char* cParameter)
{
	FILE *fAux = gdp_files_open(FileName);
	int ret = gdp_files_getint(fAux, cParameter);
	gdp_files_close(fAux);
	return ret;	
}


double gdp_files_quick_getfloat(char* FileName, char* cParameter)
{
	FILE *fAux = gdp_files_open(FileName);
	double ret = gdp_files_getfloat(fAux, cParameter);
	gdp_files_close(fAux);
	return ret;	
}