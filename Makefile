OUT ?= build

EXEC = \
	test-arith
EXEC := $(addprefix $(OUT)/,$(EXEC))

all: $(EXEC)

.PHONY: check clean

CC ?= gcc
CFLAGS = -Wall -std=gnu99 -g -O2 -I.
LDFLAGS =

OBJS := \
	arith_add.o \
	arith_sub.o \
	arith_mul.o \
	arith_div.o

deps := $(OBJS:%.o=%.o.d)
OBJS := $(addprefix $(OUT)/,$(OBJS))
deps := $(addprefix $(OUT)/,$(deps))

$(OUT)/%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ -MMD -MF $@.d $<

$(OUT)/test-%: test-%.c $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJS): | $(OUT)

$(OUT):
	mkdir -p $@

.PRECIOUS: %.o

check: $(EXEC)
	@for test in $^ ; \
	do \
		echo "Execute $$test..." ; $$test && echo "OK!\n" ; \
	done

clean:
	$(RM) $(EXEC) $(OBJS) $(deps)
	@rm -rf $(OUT)

-include $(deps)
