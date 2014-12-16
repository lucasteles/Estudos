#include "WinSockClass.h"
#include <winsock2.h>
#include <iostream>

WinSockClass::WinSockClass(int tnPort)
{
    nPort = tnPort;
}

int WinSockClass::IniciaServer()
{
    // Cria o WSA
    if(IniciaWSA()==0)
        return 0;
    // Cria o Socket
    if(InciaSocket()==0)
        return 0;
    // configura o servidor
    if(ConfigServer()==0)
        return 0;

    listen(oSocket,1);
    return 1;
}

int WinSockClass::IniciaWSA()
{
    if(WSAStartup(MAKEWORD(2,2),&oWsaDat)!=0)
    {
        WSACleanup();
        system("PAUSE");
        return 0;
    }
    return 1;
}

int WinSockClass::InciaSocket()
{
    oSocket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
    if(oSocket==INVALID_SOCKET)
    {
        WSACleanup();
        system("PAUSE");
        return 0;
    }
    return 1;
}

int WinSockClass::ConfigServer()
{
    oServerInf.sin_family=AF_INET;
    oServerInf.sin_addr.s_addr=INADDR_ANY;
    oServerInf.sin_port=htons(nPort);

    if(bind(oSocket,(SOCKADDR*)(&oServerInf),sizeof(oServerInf))==SOCKET_ERROR)
    {
        WSACleanup();
        system("PAUSE");
        return 0;
    }
    return 1;
}

void WinSockClass::CloseServer()
{
    // Shutdown our socket
    shutdown(oSocket,SD_SEND);

    // Close our socket entirely
    closesocket(oSocket);

    // Cleanup Winsock
    WSACleanup();
}

void WinSockClass::AguardandoClient()
{
    oTempSock=SOCKET_ERROR;
	std::cout<<"Esperando conexao...\r\n";
	// aguarda uma conexao
    oTempSock=accept(oSocket,NULL,NULL);
    oSocket = oTempSock;
    std::cout<<"Cliente Conectado!\r\n\r\n";
}

int WinSockClass::Enviar(char *tcMessage,int tnTam){
    int nRetorno = send(oSocket,tcMessage,tnTam,0);
    return nRetorno;
}

int WinSockClass::Receber(char *tcMessage,int tnTam){
    int nRetorno = recv(oSocket,tcMessage,tnTam,0);
    return nRetorno;
}

int WinSockClass::IniciaClient(char *tcServer)
{
    // Cria o WSA
    if(IniciaWSA()==0)
        return 0;

	// Cria o Socket
    if(InciaSocket()==0)
        return 0;

	// confere se é um host valido
	if((oHost=gethostbyname(tcServer))==NULL)
	{
		std::cout<<"Failed to resolve hostname.\r\n";
		WSACleanup();
		system("PAUSE");
		return 0;
	}

	// Setup our socket address structure
	oServerInf.sin_port=htons(nPort);
	oServerInf.sin_family=AF_INET;
	oServerInf.sin_addr.s_addr=*((unsigned long*)oHost->h_addr);

	// Attempt to connect to server
	if(connect(oSocket,(SOCKADDR*)(&oServerInf),sizeof(oServerInf))!=0)
	{
		std::cout<<"Failed to establish connection with server\r\n";
		WSACleanup();
		system("PAUSE");
		return 0;
	}

	return 1;
}
