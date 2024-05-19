#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include "fact.h"


int p[2]; 
int o[2];

void run_factorial() {
  size_t m = 0;

  close(p[1]);
  size_t sz =  read(p[0], &m, sizeof(m));
  close(p[0]);
  if (sz!=sizeof(m)) {
    printf("Cannot read all the data\n");
    _exit(1);
  }
  size_t result = factorial(m);
  printf("(Подпроцесс) Факториал %ld это %ld.\n", m, result);
  close(o[0]);
  write(o[1], &result, sizeof(result));
  close(o[1]);
}

size_t x = 8;

int main(){
  size_t cpid;
  pipe(p); 
  pipe(o); 
  if ((cpid = fork()) == 0) {
    run_factorial();
  }
  else { 
    close(p[0]);
    write(p[1], &x, sizeof(x));
    close(p[1]);
    
    size_t rc;
    
    close(o[1]);
    read(o[0], &rc, sizeof(rc)); 
    close(o[0]);
    
    printf("Факториал числа %ld это %ld. (Taken from child process)\n", x, rc);
  }
  
  if (cpid!=0) {
    int rc;
    waitpid(cpid, &rc, 0);
    printf("A Child process killed.\n");
  }
  return 0;
}
