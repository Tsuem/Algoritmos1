#include <stdio.h>

int main(void) {
    int x, y;
    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("Ingrese un valor para y:\n");
    scanf("%d", &y);
    y= y + y;
    printf("El valor actual de y es: %d\n", y);
    x= x + y;
    printf("El valor actual de x es: %d\n", x);
    return 0;
}

/*
EJECUCIÓN 1 (x→2, y→5)
Ingrese un valor para x:
2
Ingrese un valor para y:
5
El valor actual de y es: 10
El valor actual de x es: 12 


EJECUCIÓN 2 (x→20, y→20)
Ingrese un valor para x:
20
Ingrese un valor para y:
20
El valor actual de y es: 40
El valor actual de x es: 60


EJECUCIÓN 3 (x→10, y→77)
Ingrese un valor para x:
10
Ingrese un valor para y:
77
El valor actual de y es: 154
El valor actual de x es: 164
*/