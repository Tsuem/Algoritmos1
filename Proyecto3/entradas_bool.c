#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

bool pedir_booleano(char name) {
    bool res;
    int aux_res;
    printf("Ingrese un booleano para la variable: %c (0=false, 1=true)\n", name);
    scanf("%d", &aux_res);
    assert(aux_res == 1 || aux_res == 0);
    res = aux_res;
    return res;
}

void imprimir_booleano(char name, bool x) {
    if(x == 1){
        printf("El valor de %c es Verdadero\n",name);
    } else {
        printf("El valor de %c es Falso\n",name);
    }    
}

int main(void){
    bool n = pedir_booleano('n'); //tambien puede ser int pero le agrega claridad el bool
    imprimir_booleano('n',n);
    return 0;
}


    /* 
    EJEM 1
    (x→0)
    Ingrese un booleano para la variable: n (0=false, 1=true)
    0
    El valor de n es Falso


    EJEM 2
    (x→1)
    Ingrese un booleano para la variable: n (0=false, 1=true)
    1
    El valor de n es Verdadero 
    */