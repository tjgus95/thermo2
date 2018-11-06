CC=gcc
CFLAGS=-lWarn -pedantic

libmyifttt.a:	ifttt.o
	ar -rcs libmyifttt.a ifttt.o

ifttt.o: 	ifttt.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

all:	main

main.o: main.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi -lwiringPi $<

main: main.o libmyifttt.a
	cc main.o -L. -lmyifttt -lcurl -lwiringPi -o main

clean:
	rm main *.o
