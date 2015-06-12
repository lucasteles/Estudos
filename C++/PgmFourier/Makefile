CC=gcc
LDFLAGS=-fopenmp -lm 
 
all: lib 
	
lib:  INumber.o PGM.o main.c
	$(CC) -o fourier main.c INumber.o PGM.o $(LDFLAGS) 
                                                 
