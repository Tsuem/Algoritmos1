#include <stdio.h>
#define N 5

int main(void){
    int i;
    int a[N];

    i=0;
    while (i<N){
	printf("Ingrese un numero para el indice %d del arreglo:\n",i);
	scanf("%d",&a[i]);
	i=i+1;
    }


    i=0;
    printf("\n\nEl arreglo ingresado es el siguiente:\n");
    while (i<N){
    printf("El elemento %d del arreglo es %d\n",i,a[i]);
    i=i+1;
    }

    return 0;
}