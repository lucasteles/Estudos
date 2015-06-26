#if !defined(TIMER_H_)
#define TIMER_H_

/* For struct Timer routines. */
#include <sys/time.h>
#include <time.h>

/* A simple wrapper around the clock() timer */
struct Timer {
  long dsec;
  long dusec;
  long csec;
  long cusec;
};

void initialize_timer (struct Timer* t);
void start_timer (struct Timer* t);
void stop_timer (struct Timer* t);
double timer_duration(const struct Timer t);

#endif
