// Ejercicio 1

#include <stdio.h> 
#include <assert.h>

struct info_t {
    int op_sum;  // Guarda la suma
    int op_mul;  // Guarda la multiplicación
    int op_div;  // Guarda la división entera
    int op_dist; // Guarda el valor absoluto de la resta
};

int valor_absoluto(int x){
    int abs;
    if (x < 0){
        abs = - x;
    }
    else{
        abs = x;
    }
    return abs;
}

struct info_t operar(int x, int y) {
    struct info_t res;

    res.op_sum = x + y;
    res.op_mul = x * y;
    res.op_div = x / y;     
    res.op_dist = valor_absoluto(x - y);

    return res;
}


int main() {
    int a, b;
    printf("Ingrese el valor para el entero a: ");
    scanf("%d", &a);

    printf("Ingrese el valor para el entero b: ");
    scanf("%d", &b);

    // Ambas variables deben tener valores mayores a cero y que a > b
    assert(a > 0 && b > 0 && a > b);

    struct info_t res = operar(a, b);

    printf("===Resultados===\n");
    printf("res.op_sum = %d\n", res.op_sum);
    printf("res.op_mul = %d\n", res.op_mul);
    printf("res.op_div = %d\n", res.op_div);
    printf("res.op_dist = %d\n", res.op_dist);

    return 0;
}