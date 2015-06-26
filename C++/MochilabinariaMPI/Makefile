CC=mpicc
LDFLAGS= -lm 
 
all: lib 
	
lib: LMPI.c timer.o knap.c
	$(CC) -o MochilabinariaMPI knap.c LMPI.c timer.o $(LDFLAGS) 
