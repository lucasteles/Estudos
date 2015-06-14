#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stddef.h>

// Como compilar?
// mpirun -np 5 ./Prova [NumerodoExercicio] [Menssagem]

#define min(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a < _b ? _a : _b; })

#define max(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a > _b ? _a : _b; })

char *VectorList(int *);
int valida_distribuido(int *);

void Lamport(char*);
void LamportVetor(char *);
void Centralizado();
void Distribuido();
void Anel();
void Bully();
void AnelLider();
void GeneraisBizantinos();

MPI_Status stat;
int rank,Mpisize,repet = 2;

typedef struct _Ptc
{
	char msg[30];
	int rank;
	int timestamp;
	int timestamplist[10];
	int maxrank;
	int id;
} PTC;

MPI_Datatype mpi_ptc_type;

int main (int argc, char *argv[])
{
	// primeiro parametro eh a escolha do exercicio
	// o segundo parametro eh a msg que sera transmitida

	int escolha = atoi(argv[1]);

	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&Mpisize);

	const int nitems=6;
    int blocklengths[nitems] = {10,1,1,10,1,1};
    MPI_Datatype types[nitems] = {MPI_CHARACTER,MPI_INT,MPI_INT,MPI_INT,MPI_INT,MPI_INT};
    MPI_Aint     offsets[nitems];
    offsets[0] = offsetof(PTC, msg);
    offsets[1] = offsetof(PTC, rank);
    offsets[2] = offsetof(PTC, timestamp);
    offsets[3] = offsetof(PTC, timestamplist);
    offsets[4] = offsetof(PTC, maxrank);
    offsets[5] = offsetof(PTC, id);

    MPI_Type_create_struct(nitems, blocklengths, offsets, types, &mpi_ptc_type);
    MPI_Type_commit(&mpi_ptc_type);

	switch(escolha){
		case 1:
			// Exercicio 1
			Lamport(argv[2]);
			break;
		case 2:
			LamportVetor(argv[2]);
			break;
		case 3:
			Centralizado();
			break;
		case 4:
			Distribuido();
			break;
		case 5:
			Anel();
			break;
		case 6:
			Bully();
			break;
		case 7:
			AnelLider();
			break;
		case 8:
			GeneraisBizantinos();
			break;
		case 9:
			return 0;
	}
	
	MPI_Finalize();
}


int RandI(int Seed){
	srand(time(NULL));
	int r = rand() % Mpisize;

	while(Seed == r)
		r = rand() % Mpisize;
	return r;
}

void Send(PTC *Prot,int Dest){
	MPI_Send(Prot,1,mpi_ptc_type,Dest,0,MPI_COMM_WORLD);
}

PTC Recv(){
	PTC recvptc;
	MPI_Recv(&recvptc,1,mpi_ptc_type,MPI_ANY_SOURCE,0,MPI_COMM_WORLD,&stat);
	recvptc.rank = stat.MPI_SOURCE;

	return recvptc;
}

PTC RecvTimeOut(int Time,int source){
	MPI_Request request;
	PTC recvptc;
	recvptc.rank = -1;
	strcpy(recvptc.msg, "");

	if(source == -1)
		source = MPI_ANY_SOURCE;

	MPI_Irecv(&recvptc,1,mpi_ptc_type,source,0,MPI_COMM_WORLD,&request);
    time_t now = time(NULL);
    while(time(NULL) < now + Time){
        int flag = 0;

        MPI_Test(&request, &flag, &stat);
        if(flag){
            recvptc.rank = stat.MPI_SOURCE;
            break;
        }
    }

	return recvptc;
}
/*
Passa de um processo para o outro, gravando cada envio no tempo e enviando para o proximo
*/
void Lamport(char *tmsg){
	PTC ptc,recvptc;

	strcpy(ptc.msg, tmsg);

	ptc.timestamp = 0;
	int dest = rank+1;;
	char *msg;
	
	if(rank == 0){
		// so o primeiro faz o primeiro envio
		Send(&ptc,dest);
		printf("Time:%3d Msg: %s Fr:%d To:%d\n",ptc.timestamp,ptc.msg,rank,dest);
	}

	int i;
	for(i = 0;i<repet;i++){
		// aguarda receber de algum outro processo
		recvptc = Recv();
		ptc.timestamp = max(ptc.timestamp,recvptc.timestamp) +1;
		dest=rank + 1;
		//printf("Time:%3d Msg: %s Rank:%d\n",recvptc.timestamp,recvptc.msg,rank);

		// se estiver no ultimo envia para o primeiro
		if(dest	== Mpisize)
			dest = 0;

		// envia para o proximo processo
		Send(&ptc,dest);
		printf("Time:%3d Msg: %s Fr:%d To:%d\n",ptc.timestamp,ptc.msg,rank,dest);
	}
}

/*
Grava no vetor o tempo de cada processo separado
*/

void LamportVetor(char *tmsg){
	int i,j;
	PTC ptc,recvptc;

	strcpy(ptc.msg, tmsg);

	for(i=0;i<Mpisize;i++)
		ptc.timestamplist[i] = 0;

	int dest = rank+1;;
	char *msg;
	
	if(rank == 0){
		// so o primeiro faz o primeiro envio
		Send(&ptc,dest);
		//printf("Time:%3d Msg: %s Fr:%d To:%d\n",ptc.timestamp,ptc.msg,rank,dest);
	}

	for(i = 0;i<repet;i++){
		// aguarda receber de algum outro processo
		recvptc = Recv();
		for(j=0;j<Mpisize;j++){
			if(j!=rank)
				ptc.timestamplist[j] = max(ptc.timestamplist[j],recvptc.timestamplist[j]) ;
		}
		ptc.timestamplist[rank]++;

		dest=rank + 1;
		printf("Time:%s Msg: %s Rank:%d\n",VectorList(ptc.timestamplist),recvptc.msg,rank);

		// se estiver no ultimo envia para o primeiro
		if(dest	== Mpisize)
			dest = 0;

		// envia para o proximo processo
		Send(&ptc,dest);
		//printf("Time:%s Msg: %s Fr:%d To:%d\n",VectorList(ptc.timestamplist),ptc.msg,rank,dest);
	}
}

char *VectorList(int *List){
	int tam = Mpisize;
	char *retorno = (char*)malloc((tam*2) + 1);

	strcpy(retorno, "(");
	char buffer [20];
	int i;
	for(i=0;i<tam;i++){
		if(i > 0)
			strcat(retorno,",");

		sprintf(buffer,"%d",List[i]);
		strcat(retorno,buffer);
	}
	strcat(retorno, ")");
	return retorno;
}

/*
Pede acesso ao lider que eh o processo zero, cada processo so pede uma vez e o lider da permissao n= numeros de processos -1
*/

void Centralizado(){

	int area = 0,i = 0;
	int parar = 0;
	PTC ptc,recvptc;

	while(!parar){
		if(rank == 0){
			printf("%d - %s\n",rank,"Esperando Pedido");
			recvptc = Recv();
			//printf("%s%s\n","Recebeu - ",recvptc.msg);

			if(strcmp(recvptc.msg, "Acesso") == 0){
				//printf("%s - %d\n","Pedido",recvptc.rank);
				if(area	== 0){
					strcpy(ptc.msg, "Pode");

					printf("%d -> %s -> %d\n",rank,"Pode",recvptc.rank);
					Send(&ptc,recvptc.rank);
					area = recvptc.rank;
					i++;
				}
				else{
					strcpy(ptc.msg, "Nao");
					printf("%d -> %s -> %d\n",rank,"Nao",recvptc.rank);
					Send(&ptc,recvptc.rank);
				}
			}

			if(strcmp(recvptc.msg, "Liberar") == 0){
				area = 0;
				printf("%d -> %s -> %d\n",recvptc.rank,"Liberar",rank);
			}

			if(i == Mpisize-1)
				parar = 1;
		}

		if(rank > 0){
			strcpy(ptc.msg, "Acesso");
			printf("%d - %s\n",rank,"Pedido");
			Send(&ptc,0);

			recvptc = Recv();

			if(strcmp(recvptc.msg, "Pode") == 0)
				area = 1;


			if(area == 1){
				printf("%d - %s\n",rank,"Area Critica");
				strcpy(ptc.msg, "Liberar");
				
				Send(&ptc,0);
				parar = 1;
			}
		}
	}
}

void Distribuido(){

	int area = 0, i = 0;
	int parar = 0;
	PTC ptc,recvptc;
	int pode_acessar[Mpisize];
	
	for (i = 0; i < Mpisize; i++)
		if (i==rank)
			pode_acessar[i] = 1;
		else
			pode_acessar[i] = 0;


	ptc.rank = rank;
	ptc.timestamp = rank ; // por conveniencia sera usado o proprio rank como timestamp
	strcpy(ptc.msg,"Pode");

	PTC resp;
	resp.rank = rank;
	
	for (i = 0; i < Mpisize; i++)
			if (i != rank)
				Send(&ptc, i);

	while(!valida_distribuido(pode_acessar)){
	
		for (i = 0; i < Mpisize; i++)
			if (i != rank)
			{
				recvptc = RecvTimeOut(5, i);
				if (recvptc.rank != -1){
					printf("%i recebeu '%s' de %i\n", rank, recvptc.msg, i);
					if (strcmp(recvptc.msg,"Pode\n"))
					{	
						 if (recvptc.timestamp <= ptc.timestamp)
						 {

						 	strcpy(resp.msg,"Sim");

						 	PTC aux;
						 	Send(&resp, recvptc.rank);
						 	while(1){
								aux = RecvTimeOut(1, recvptc.rank );
								if (aux.rank == recvptc.rank && strcmp(aux.msg,"Ok"))
								{
									break;
								}
							}
							printf("%d -> liberou acesso para  ->  %d\n",recvptc.rank, rank );
							pode_acessar[recvptc.rank] = 1;
						  	Send(&resp, recvptc.rank);
						  }
						  else
						  { 
						 	strcpy(resp.msg,"Nao");
							Send(&resp, recvptc.rank);
						  }
						
					}	
					else 
					{
						if (strcmp(recvptc.msg,"Sim\n")  || strcmp(recvptc.msg,"Ok\n") )
						{
							printf("%d -> liberou acesso para  ->  %d\n",recvptc.rank, rank );
							pode_acessar[recvptc.rank] = 1;
						}
					}
				}
					
			}

	}

	//***** AREA CRITICA ***********//
	printf("%d - %s\n",rank,"Area Critica");
	/// KABOOOOOM //


	strcpy(ptc.msg, "Ok");
	for (i = 0; i < Mpisize; i++)
	{
		if (i != rank)
			Send(&resp, recvptc.rank);
	}
}

int valida_distribuido(int *access_vetor)
{
	for (int i = 0; i < Mpisize; i++)
		if (access_vetor[i]==0)
			return 0;

	return	1;
}

/*
Faz "repet" giros, quando o processo eh dono do token ele acessa a area critica
*/
void Anel(){
	int token = 0,i = 0,dest;
	int parar = 0;
	PTC ptc,recvptc;

	if(rank == 0)
		token = 1;

	for (i = 0; i < repet; ++i)
	{
		while(!parar){
			if(token){
				printf("%d - Posso Acessar\n",rank);

				strcpy(ptc.msg, "Passar");
				dest = rank + 1;

				if(dest == Mpisize)
					dest = 0;

				printf("%d -> %d\n",rank,dest);
				Send(&ptc,dest);
				token = 0;

				parar = 1;
			}

			if(!parar){
				recvptc = Recv();
				token = 1;
			}
		}
		parar = 0;
	}
}
/*
O maior processo comeco como lider e libera a area critica n=numero total de processos -1
Depois que terminar o lider cai, obrigando os outros a fazer a votacao, onde o maior sera o ganhador, entao o processo repete a primeira parte
*/
void Bully(){
	int lider = Mpisize - 1;
	int area = -1,i = 0;
	int parar = 0;
	PTC ptc,recvptc;

	while(!parar){
		if(rank == lider){
			printf("%d - %s\n",rank,"Lider");
			recvptc = Recv();
			//printf("%s%s\n","Recebeu - ",recvptc.msg);

			if(strcmp(recvptc.msg, "Acesso") == 0){
				//printf("%s - %d\n","Pedido",recvptc.rank);
				if(area	== -1){
					strcpy(ptc.msg, "Pode");

					printf("%d -> %s -> %d\n",rank,"Pode",recvptc.rank);
					Send(&ptc,recvptc.rank);
					area = recvptc.rank;
					i++;
				}
				else{
					strcpy(ptc.msg, "Nao");
					printf("%d -> %s -> %d\n",rank,"Nao",recvptc.rank);
					Send(&ptc,recvptc.rank);
				}
			}

			if(strcmp(recvptc.msg, "Liberar") == 0){
				area = -1;
				printf("%d -> %s -> %d\n",recvptc.rank,"Liberar",rank);
			}

			if(i == Mpisize-1){
				parar = 1;
			}
		}

		if(rank != lider){
			strcpy(ptc.msg, "Acesso");
			printf("%d - %s\n",rank,"Pedido");
			Send(&ptc,lider);

			recvptc = RecvTimeOut(5,lider);
			
			if(recvptc.rank == -1){
				int desistir = 0;
				printf("%d - Lider %d %s\n",rank,lider,"Time Out!");
				lider = -1;
				
				for (int i = rank+1; i < Mpisize; i++)
				{
					strcpy(ptc.msg, "Votacao");
					Send(&ptc,i);
				}

				while(!desistir){
					recvptc = RecvTimeOut(5,-1);
					
					if(recvptc.rank == -1){
						printf("%d - %s\n",rank,"Parou de esperar resposta de votacao");
						lider = rank;
						strcpy(ptc.msg, "Lider");
						for (int i = 0; i < Mpisize; i++)
						{
							Send(&ptc,i);
						}
						desistir = 1;
					}

					if(strcmp(recvptc.msg, "Aqui") == 0){
						if(recvptc.rank > rank)
							desistir = 1;
					}

					if(strcmp(recvptc.msg, "Votacao") == 0){
						printf("%d - Iniciar Votacao\n",rank);

						strcpy(ptc.msg, "Aqui");
						Send(&ptc,recvptc.rank);
					}
				}
			}

			while(lider == -1){
				printf("%s - %d\n","Esperando lider",rank);
				recvptc = Recv();
				if(strcmp(recvptc.msg, "Lider") == 0){
					lider = recvptc.rank;
					printf("%d - %s - %d\n",rank,"Novo Lider",lider);
				}
			}

			if(strcmp(recvptc.msg, "Pode") == 0)
				area = rank;

			if(area == rank){
				printf("%d - %s\n",rank,"Area Critica");
				strcpy(ptc.msg, "Liberar");
				area = -1;
				Send(&ptc,lider);
			}
		}

		if(lider == 0){
			parar = 1;
			printf("%s\n","So existe um processo!\nConcluido!");
		}
	}
}

void AnelLider(){
	int lider = Mpisize - 1;
	int area = -1,i = 0;
	int parar = 0;
	PTC ptc,recvptc;
	ptc.maxrank = 0;

	while(!parar){
		if(rank == lider){
			printf("%d - %s\n",rank,"Lider");
			recvptc = Recv();
			//printf("%s%s\n","Recebeu - ",recvptc.msg);

			if(strcmp(recvptc.msg, "Acesso") == 0){
				//printf("%s - %d\n","Pedido",recvptc.rank);
				if(area	== -1){
					strcpy(ptc.msg, "Pode");

					printf("%d -> %s -> %d\n",rank,"Pode",recvptc.rank);
					Send(&ptc,recvptc.rank);
					area = recvptc.rank;
					i++;
				}
				else{
					strcpy(ptc.msg, "Nao");
					printf("%d -> %s -> %d\n",rank,"Nao",recvptc.rank);
					Send(&ptc,recvptc.rank);
				}
			}

			if(strcmp(recvptc.msg, "Liberar") == 0){
				area = -1;
				printf("%d -> %s -> %d\n",recvptc.rank,"Liberar",rank);
			}

			if(i == Mpisize-1){
				parar = 1;
			}
		}

		if(rank != lider){
			strcpy(ptc.msg, "Acesso");
			printf("%d - %s\n",rank,"Pedido");
			Send(&ptc,lider);

			recvptc = RecvTimeOut(5,lider);
			
			if(recvptc.rank == -1){
				int desistir = 0;
				int dest = rank + 1;
				printf("%d - Lider %d %s\n",rank,lider,"Time Out!");
				lider = -1;
				
				while(!desistir){
					if(dest == Mpisize)
						dest = 0;

					ptc.id = rank;
					ptc.maxrank = max(ptc.maxrank,rank);
					strcpy(ptc.msg, "Votacao");
					Send(&ptc,dest);

					recvptc = RecvTimeOut(5,dest);

					if(recvptc.rank == -1)
						dest++;

					if(recvptc.rank != -1){
						printf("%d - %s - %d\n",rank,"Enviou para ",dest);
						desistir = 1;
					}
					desistir = 1;
				}

				desistir = 0;
				while(!desistir){
					recvptc = Recv();

					if(strcmp(recvptc.msg, "Votacao") == 0){
						printf("%d - Passa Votacao\n",rank);
						ptc.maxrank = max(recvptc.maxrank,rank);

						if(recvptc.id == rank){
							desistir = 1;
							lider = recvptc.maxrank;
						}
						else{
							dest = rank + 1;
							while(!desistir){
								if(dest == Mpisize)
									dest = 0;

								ptc.maxrank = max(ptc.maxrank,rank);
								strcpy(ptc.msg, "Votacao");
								Send(&ptc,dest);

								recvptc = RecvTimeOut(5,dest);

								if(recvptc.rank == -1)
									dest++;

								if(recvptc.rank != -1)
									desistir = 1;

							}
						}
					}
				}
			}

			while(lider == -1){
				printf("%s - %d\n","Esperando lider",rank);
				recvptc = Recv();
				if(strcmp(recvptc.msg, "Lider") == 0){
					lider = recvptc.rank;
					printf("%d - %s - %d\n",rank,"Novo Lider",lider);
				}
			}

			if(strcmp(recvptc.msg, "Pode") == 0)
				area = rank;

			if(area == rank){
				printf("%d - %s\n",rank,"Area Critica");
				strcpy(ptc.msg, "Liberar");
				area = -1;
				Send(&ptc,lider);
			}
		}

		if(lider == 0){
			parar = 1;
			printf("%s\n","So existe um processo!\nConcluido!");
		}
	}
}

void GeneraisBizantinos(){

}
