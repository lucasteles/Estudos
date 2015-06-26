#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>
#include <time.h>
#include <errno.h>
#include <unistd.h>
#include <omp.h>

#include "timer.h"
#include "knap_defaults.h"
#include "OpenMp.h"

int solveparallel(const int n_books, const int bag_cap,const int* weight, const int* profit,int* total)
{
    int book_i;
    int cap_j;
    int* prev_book_total;
    int* book_total;

    #pragma omp parallel shared(weight,total,profit) private(cap_j)
	{
	    #pragma omp for schedule(dynamic)
        /* Base case for using only book 1. */
        for (cap_j = 0; cap_j <= bag_cap; ++cap_j) {
            if (weight[0] > cap_j)
            /* Doesn't fit. */
            total[cap_j] = 0;
            else
            total[cap_j] = profit[0];
        }
	}
    prev_book_total = &total[0];
    book_total = &total[bag_cap+1];

    #pragma omp parallel shared(weight,book_total,prev_book_total,profit) private(cap_j,book_i)
	{
	    #pragma omp for schedule(dynamic)
        for (book_i = 1; book_i < n_books; ++book_i) {
            const int wi = weight[book_i];

            for (cap_j = 0; cap_j <= bag_cap; ++cap_j) {
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
	}
    return prev_book_total[bag_cap];
}

void backtrackparallel(const int n_books, const int bag_cap,const int* weight,const int* total,int* use_book)
{
    int book_i;
    const int* cur_total;

    memset (use_book, 0, n_books * sizeof(int));
    cur_total = &total[n_books * (bag_cap+1) - 1];

    #pragma omp parallel shared(weight,use_book,cur_total) private(book_i)
	{
	    #pragma omp for schedule(dynamic)
        for (book_i = n_books-1; book_i > 0; --book_i) {
            cur_total -= (bag_cap+1);
            if (*cur_total != *(cur_total - (bag_cap+1))) {
                use_book[book_i] = 1;
                cur_total -= weight[book_i];
            }
        }
	}
    use_book[0] = (*cur_total > 0);
}
