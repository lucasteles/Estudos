CC=gcc
LDFLAGS=-fopenmp -lm 
 
all: lib 
	
lib: OpenMp.c timer.o knap.c
	$(CC) -o MochilabinariaOpenMP knap.c OpenMp.c timer.o $(LDFLAGS) 
