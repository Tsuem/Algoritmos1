#include <stdio.h>
#include <stdbool.h>

/* Definicion de funciones en C */

/* Todo programa en C debe tener una funcion main, desde esta podemos realizar LLAMADAS A FUNCIONES.
   Una buena practica de programacion es realizar todo el INPUT/OUTPUT (scanf, printf, etc) en la 
   funcion main y en las demas funciones solo hacer calculos.
 */

int sumar(int n, int m) {
    int res;
    res = n + m;

    /* Toda funcion cuyo tipo de retorno es distinto a void, debe tener una instruccion return */
    return res;
}


/* Especificacion de la funcion primo:
   Dado un entero n, retorna true si es primo, false caso contrario. */
bool primo(int n) {
    int i;
    bool res;

    i = 2;
    res = true;

    while (i < n && res) {
        res = res && !(n % i == 0);
        i = i+1;
    }

    return res;
}

/* Cuando declaramos una funcion, esta puede tener PARAMETROS.
en la funcion primo anterior, n es un parametro de tipo int. Este es una variable mas que puede ser 
utilizada en el cuerpo de la funcion y que al momento de ejecutarse la llamada, sera reemplazado 
por el valor de la expresion. */

/*Este es un ejemplo de procedimiento en C, toma un argumento y no devuelve nada */

void imprime_esPrimo(bool n_esprimo){
    if (n_esprimo) {
        printf("El primer numero ingresado es primo.\n");
    }
    else {
        printf("El primer numero ingresado NO es primo.\n");
    }
}


int main(void) {
    int n,m,suma;
    bool n_esprimo;

    printf("Ingrese un numero\n");
    scanf("%d",&n);

    printf("Ingrese otro numero\n");
    scanf("%d",&m);

    suma = sumar(n,m);

    /* como ejercicio hacer una funcion que imprima el resultado*/

    printf("La suma de ambos numeros es %d\n",suma);

    n_esprimo = primo(n);

    imprime_esPrimo (n_esprimo);
    
    return 0;
}