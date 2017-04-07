#include <stdbool.h>
#include <stdio.h>
#include "arith.h"

int main(void)
{
   float A = 0.1, B = 0.2;

    /* if we found a valid implementation, print its name */
    for (arith *p = ARITH_IMPL_BEGIN; p < ARITH_IMPL_END; p++) {
        if (!p->name) return -1;
        printf("[ %14s ]  ", p->name + 2);
        printf("%f %c %f = %f\n", A, p->name[0], B, p->impl(A, B));
    }

    return 0;
}
