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


int es_x_menor (int x, int y) {
    int m;
    if (x < y) {
        m = x;
    } else {
        m = y;
    }
    return m;
}

int es_m_menor (int m, int z) {
    if (m > z) {
        m = z;
    }
    return m;
}

int main(void) {
    int x = pedir_entero('x');
    imprimir_entero('x', x);
    int y = pedir_entero('y');
    imprimir_entero('y', y);
    int z = pedir_entero('z');
    imprimir_entero('z', z);
    int m = pedir_entero('m');
    imprimir_entero('m', m);
    int l = es_x_menor(x,y); //l=4
    imprimir_entero('m',l);
    m = l;
    int p = es_m_menor(m,z);
    imprimir_entero('m',p);

    return 0;
}

/* 
EJECUCION 1
(x→1, y→2, z→3, m→4)
Ingrese un valor para la variable x:
1
El valor de la variable x es 1
Ingrese un valor para la variable y:
2
El valor de la variable y es 2
Ingrese un valor para la variable z:
3
El valor de la variable z es 3
Ingrese un valor para la variable m:
4
El valor de la variable m es 4
El valor de la variable m es 1
El valor de la variable m es 1


EJECUCION 2
(x→4, y→3, z→2, m→1)
Ingrese un valor para la variable x:
4
El valor de la variable x es 4
Ingrese un valor para la variable y:
3
El valor de la variable y es 3
Ingrese un valor para la variable z:
2
El valor de la variable z es 2
Ingrese un valor para la variable m:
1
El valor de la variable m es 1
El valor de la variable m es 3
El valor de la variable m es 2


EJECUCION 3
(x→10, y→9, z→4, m→3)
Ingrese un valor para la variable x:
10
El valor de la variable x es 10
Ingrese un valor para la variable y:
9
El valor de la variable y es 9
Ingrese un valor para la variable z:
4
El valor de la variable z es 4
Ingrese un valor para la variable m:
3
El valor de la variable m es 3
El valor de la variable m es 9
El valor de la variable m es 4
*/