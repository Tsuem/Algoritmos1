#include <stdio.h>
#include <assert.h>

void hola_hasta (int n) {
    while (n > 0) {
        printf("Hola\n");
        n = n -1;
    }
    
}

int main (void){
    int x;
    printf("Ingrese un valor para x:\n");
    scanf("%d",&x);
    assert(0 < x);
    hola_hasta(x);
    
    return 0;
}

/* 
Ingrese un valor para n:
3
Hola
Hola
Hola


Ingrese un valor para n:
-2
Assertion failed: 0 < n, file ejercicio01.c, line 16
*/