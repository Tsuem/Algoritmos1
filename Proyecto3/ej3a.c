#include <stdio.h>

int main(void) {
    int x;
    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    x = 5;
    printf("El valor actual de x es: %d\n", x);
    return 0;
}

/* 
EJECUCIÓN 1 (x→1)
Ingrese un valor para x:
1
El valor actual de x es: 5 


EJECUCIÓN 2 (x→6)
Ingrese un valor para x:
6
El valor actual de x es: 5


EJECUCIÓN 3 (x→853)
Ingrese un valor para x:
853
El valor actual de x es: 5
*/