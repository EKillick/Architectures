CC=gcc
RM=rm -f

default:	all

all:		bigint.o bigintadd.o fib.o
		$(CC) -o fib bigint.o bigintadd.o fib.o

fib.o:		fib.c
		$(CC) -c fib.c

bigint.o:	bigint.c bigint.h bigintprivate.h
		$(CC) -c bigint.c

bigintadd.o:	bigintadd.c bigint.h bigintprivate.h
		$(CC) -c bigintadd.c

clean:		
		$(RM) bigint.o bigintadd.o fib.o
