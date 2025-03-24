/* #include <stdio.h>
#include <assert.h> */
#include <stdbool.h>

// ********* *FUNCION QUE PIDE BOOLEANO Y HACE USO DEL ASSERT **********
// SE ASEGURA QUE ENTRE UN 0 O 1 PARA QUE FUNCIONE LA FUNCION
bool pedirBooleano (void){
    int temp = 2;

    while (!(temp == 1 || temp == 0)) {
        printf("Ingrese un bool: 0 para false | 1 para true");
        scanf("%i", &temp);
    }
    assert (temp == 1 || temp == 0);

    return temp;
}


// ********* FUNCION QUE IMPRIME BOOLEANO Y HACE USO DEL ASSERT *********
void imprimeBooleano(bool x){
    assert (x==1 || x == 0);

    if (x == 1) {
        printf ("verdadero\n");
    } else if (x ==0) {
        printf("falso\n");
    }
}