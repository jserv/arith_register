# Introduction

A simple program using ELF linker set to construct lists of arithmetic
implementations automatically.

The linker takes collections of definitions, separates them into different
sections (e.g. code and data), and concatenates each section into a
contiguous block of memory. The effect is that although you can interleave
code and data in your C source file, the linker disentangles the little
pieces into one code section and one data section.

You can also define your own sections, if you like, by using gcc declaration
attributes, so the linker will gather the declarations together in your
binary regardless of how spread out they were in the source.

## Build and Test
```shell
$ make
$ make check
```

## Further Reading
* [FizzBuzz with higher-order cpp macros and ELF linker sets](http://fanf.livejournal.com/134900.html)
