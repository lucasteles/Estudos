#include <iostream>
#include <string>
#include <sstream>
#include <stdio.h>
#include <time.h>
#include "..\Classes\WinSockClass.h"

int nPort = 90; // porta para se conectar com o servidor
//char cServer[20] = "nakamas.no-ip.biz"; // endereço ou nome do servidor
char cServer[20] = "localhost"; // endereço ou nome do servidor
bool lRun = true;
WinSockClass oWinSock = NULL;//WinSockClass(nPort);;

int main()
{
    // inicia o client
	if(oWinSock.IniciaClient(cServer)==0)
        return 0;

    clock_t tNow = clock();
	// Envia msg para o servidor
	char cBuffer[1000];
    Request *oRequest = (struct Request *)malloc(sizeof(Request));

	int inDataLength = 0;

	while(lRun){

	    // se for -1, o server desconectou
        if(inDataLength>=0)
        {
            memset(cBuffer,0,999);
            std::cout<<"\nMenssagem para o servidor!\r\n";
            scanf ("%s",cBuffer);

            strcpy(oRequest->c1,cBuffer);
            // pega o tempo atual
            tNow = clock();
            // envia msg para o servidor
            oWinSock.Enviar((char *)oRequest,sizeof(struct Request));

            // Display message from server
            memset(cBuffer,0,999);
            oWinSock.Receber(cBuffer,sizeof(cBuffer));
            std::cout<< cBuffer;

            // envia confirmacao de recebimento
            memset(cBuffer,0,999);
            strcpy(cBuffer,"Recebida!");

            oWinSock.Enviar(cBuffer,sizeof(cBuffer));

            // exibe o tempo que estava armazenado e subitrai do tempo atual
            std::cout<<" Tempo: ";
            std::cout << float( clock () - tNow ) /  CLOCKS_PER_SEC;
            std::cout<<" Segs\n\n";
        }
        else
            lRun = false;
	}

	oWinSock.CloseServer();

	system("PAUSE");
	return 0;
}
