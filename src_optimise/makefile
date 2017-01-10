CC=gcc
RM=rm -f
CFLAGS=-D NDEBUG -O3

default:	all

all:		bigint.o bigintadd.o fib.o
		$(CC) $(OPTS) -o fib bigint.o bigintadd.o fib.o

clean:		
		$(RM) $(OPTS) bigint.o bigintadd.o fib.o
