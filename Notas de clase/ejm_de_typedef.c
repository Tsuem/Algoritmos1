#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

typedef struct {
    int cociente;
    int resto;
} div_t;

div_t division(int x, int y) {
    div_t res;
    res.cociente = x / y;
    res.resto = x % y;
    return res;
}

void imprime_res (div_t res) {
    printf ("El cociente es: %d\n", res.cociente);
    printf("El resto es: %d\n",res.resto);
}

int main (void) {
    int x, y;
    printf("Ingresa un numero\n");
    scanf("%d", &x);
    printf("Ingrese otro numero\n");
    scanf("%d", &y);
    assert(x >= 0 && y > 0);

    div_t res = division(x,y);
    imprime_res(res);

    return 0;
}