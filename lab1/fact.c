// fact.c
#include "fact.h"

size_t factorial(size_t n) {
  if (n<=1) return 1;
  return n*factorial(n-1);
}
