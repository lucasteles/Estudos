#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>
#include <time.h>
#include <errno.h>
#include <unistd.h>

#include "timer.h"
#include "knap_defaults.h"
#include "LMPI.h"

int solveparallel(const int n_books, const int bag_cap,const int* weight, const int* profit,int* total, int argc, char** argv)
{
   int book_i;
    int cap_j;
    int* prev_book_total;
    int* book_total;

    int mystart,myend;
    int myid,numproc;
    /* Initialize */
   
 
   /* get myid and # of processors */
   MPI_Comm_size(MPI_COMM_WORLD,&numproc);
   MPI_Comm_rank(MPI_COMM_WORLD,&myid);

   /* divide loop */
   int n = bag_cap;
   mystart = (n / numproc) * myid;
   if (n % numproc > myid){
     mystart += myid;
     myend = mystart + (n / numproc) + 1;
   } else {
     mystart += n % numproc;
     myend = mystart + (n / numproc);
   }

  printf(
    "------------------------------------------"
    "\n(parallel division - solve) NODE%d %d ~ %d\n"
    "------------------------------------------\n",myid,mystart,myend);
  /* Base case for using only book 1. */
    for (cap_j = mystart; cap_j <= myend; ++cap_j) {
        if (weight[0] > cap_j)
            /* Doesn't fit. */
            total[cap_j] = 0;
        else
            total[cap_j] = profit[0];
    }

    MPI_Barrier( MPI_COMM_WORLD ) ;

    prev_book_total = &total[0];
    book_total = &total[bag_cap+1];


    for (book_i = 1; book_i < n_books; ++book_i) {
        const int wi = weight[book_i];

  
        for (cap_j = mystart; cap_j <= myend; ++cap_j) {
            int new_profit;

            if (cap_j < weight[book_i]) {
            /* Doesn't fit. */
            book_total[cap_j] = prev_book_total[cap_j];
            continue;
        }

        new_profit = profit[book_i] + prev_book_total[cap_j - wi];
        book_total[cap_j] = (prev_book_total[cap_j] >= new_profit?prev_book_total[cap_j] : new_profit);
        }

        prev_book_total = book_total;
        book_total += (bag_cap+1);
    }

    MPI_Barrier( MPI_COMM_WORLD ) ;
    
    return prev_book_total[bag_cap];
}

void backtrackparallel(const int n_books, const int bag_cap,const int* weight,const int* total,int* use_book,int argc, char** argv)
{
    int book_i;
    const int* cur_total;

    memset (use_book, 0, n_books * sizeof(int));
    cur_total = &total[n_books * (bag_cap+1) - 1];


    int mystart,myend;
    int myid,numproc;
    /* Initialize */
   
   int done_already;


 
   /* get myid and # of processors */
   MPI_Comm_size(MPI_COMM_WORLD,&numproc);
   MPI_Comm_rank(MPI_COMM_WORLD,&myid);

 /* divide loop */
   int n = n_books;
   mystart = (n / numproc) * myid;
   if (n % numproc > myid){
     mystart += myid;
     myend = mystart + (n / numproc) + 1;
   } else {
     mystart += n % numproc;
     myend = mystart + (n / numproc);
   }

printf(
    "------------------------------------------"
    "\n(parallel division - backtrack) NODE%d %d ~ %d\n"
    "------------------------------------------\n",myid,mystart,myend);

    myend  =(n_books==myend)?myend-1:myend;

    for (book_i = myend; book_i > mystart; --book_i, cur_total -= (bag_cap+1)) {
        if (*cur_total != *(cur_total - (bag_cap+1))) {
            use_book[book_i] = 1;
            cur_total -= weight[book_i];
        }
    }
    use_book[0] = (*cur_total > 0);

    MPI_Barrier( MPI_COMM_WORLD ) ;
    
}
