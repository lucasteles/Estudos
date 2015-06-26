#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>
#include <time.h>
#include <errno.h>
#include <unistd.h>
#include <mpi.h>

#include "timer.h"
#include "knap_defaults.h"

int solveparallel(const int n_books, const int bag_cap,const int* weight, const int* profit,int* total, int argc, char** argv);
void backtrackparallel(const int n_books, const int bag_cap,const int* weight,const int* total,int* use_book,int argc, char** argv);
