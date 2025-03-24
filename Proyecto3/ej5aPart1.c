#include <stdio.h>

int main(void) {
    int i;
    printf("Ingrese valor para i:\n");
    scanf("%d", &i);

    while (i != 0) {
        i = i - 1;
    }

    printf("Valor actual de i: %d", i);
    return 0;
}

    /*
    (i→4)
    Ingrese valor para i:
    4
    Resultado de i: 0


    (i→5)
    Ingrese valor para i:
    5
    Valor actual de i: 0


    (i→10)
    Ingrese valor para i:
    10
    Valor actual de i: 0
    */