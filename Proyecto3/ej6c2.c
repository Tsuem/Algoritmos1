#include <stdio.h>

int pedir_entero(char name) {
    int num;
    printf("Ingrese un valor para la variable %c:\n", name);
    scanf("%d", &num);
    return num;
}

void imprimir_entero(char name, int x){
    printf("El valor de la variable %c es %d\n", name, x);
}

int es_x_mayorigual (int x, int y) {
    if (x >= y) {
        x = 0;
    } else {
        x = 2;
    }
    return x;
}

int main(void) {
    int x = pedir_entero('x');
    imprimir_entero('x', x);
    int y = pedir_entero('y');
    imprimir_entero('y', y);
    x = es_x_mayorigual(x,y);
    
    printf("Los valores actuales de x y y son: %d y %d\n", x, y);
    return 0;
}

/* 
Ingrese un valor para la variable x:
3
El valor de la variable x es 3
Ingrese un valor para la variable y:
2
El valor de la variable y es 2
Los valores actuales de x y y son: 0 y 2
 */