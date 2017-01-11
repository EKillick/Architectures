CC=gcc
RM=rm -f
CFLAGS=-D NDEBUG -O3

default:	all

all:		bigint.o bigintadd.o fib.o
		$(CC) $(CFLAGS) -o fib bigint.o bigintadd.o fib.o

clean:		
		$(RM) bigint.o bigintadd.o fib.o
