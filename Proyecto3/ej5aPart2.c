#include <stdio.h>

int main(void) {
    int i;
    printf("Ingrese valor para i:\n");
    scanf("%d", &i);

    while (i != 0) {
        i = 0;
    }

    printf("Valor actual de i: %d", i);
    return 0;
}

    /* 
    (i→400)
    Ingrese valor para i:
    400
    Resultado de i: 0

    (i→4)
    Ingrese valor para i:
    4
    Resultado de i: 0

    (i→-4)
    Ingrese valor para i:
    -4
    Resultado de i: 0
    */