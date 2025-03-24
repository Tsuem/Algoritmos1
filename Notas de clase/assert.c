#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

// FUNCION QUE PIDE BOOLEANO
bool pedirBooleano (void){
    int temp = 2;

    while (!(temp == 1 || temp == 0)) {
        printf("Ingrese un bool: 0 para false | 1 para true");
        scanf("%i", &temp);
    }
    assert (temp == 1 || temp == 0);

    return temp;
}


// FUNCION QUE IMPRIME BOOLEANO
void imprimeBooleano(bool x){
    assert (x==1 || x == 0);

    if (x == 1) {
        printf ("verdadero\n");
    } else if (x ==0) {
        printf("falso\n");
    }
}