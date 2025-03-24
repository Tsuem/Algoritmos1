/* ejercicio 6a */
#include <stdio.h>

int pedir_entero(char name) {
    int m;
    printf("Ingrese un valor para la variable %c:\n", name);
    scanf("%d", &m);
    return m;
}

void imprimir_entero(char name, int x){
    printf("El valor de la variable %c es %d\n", name, x);
}

int main(void) {
    int m;
    m = pedir_entero('p');
    imprimir_entero('m', m);
    return 0;
}

/* 
EJEM 1
(x→1)
Ingrese un valor para la variable p:
1
El valor de la variable m es 1


EJEM 2
(x→85)
Ingrese un valor para la variable p:
85
El valor de la variable m es 85


EJEM 3
(x→-5)
Ingrese un valor para la variable p:
-5
El valor de la variable m es -5
 */