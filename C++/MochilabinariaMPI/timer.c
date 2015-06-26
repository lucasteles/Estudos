#include <stddef.h>
#include <stdio.h>
#include "timer.h"

void initialize_timer (struct Timer * t)
{
  t->cusec = t->csec = 0;
  t->dusec = t->dsec = 0;
}

void start_timer(struct Timer * t)
{
	struct timeval tmp;
  gettimeofday (&tmp, NULL);
  t->cusec = tmp.tv_usec;
  t->csec = tmp.tv_sec;
}

void stop_timer(struct Timer * t)
{
  struct timeval end_tv;
  gettimeofday (&end_tv, NULL);
  t->dsec += end_tv.tv_sec - t->csec;
  t->dusec += end_tv.tv_usec - t->cusec;
}

double timer_duration(const struct Timer t)
{
  return t.dsec + 1.0e-6 * (double)t.dusec;
}

