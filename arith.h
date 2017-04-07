#ifndef ARITH_H_
#define ARITH_H_

/* Arithmetic metadata */
typedef struct {
    float (*impl)(float, float);
    const char *name;
} arith;

#define REGISTER_ARITH(nameX, OP) \
    static float impl(float a, float b) { return (a) OP (b); } \
    arith arith_##nameX __attribute__((section("arith"))) = { \
        .impl = impl, .name = #OP "," #nameX, \
    };

extern arith __start_arith[], __stop_arith[];
     
#define ARITH_IMPL_BEGIN __start_arith
#define ARITH_IMPL_END __stop_arith

#endif
