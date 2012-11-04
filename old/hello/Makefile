# Example Makefile for demo project
# Copied from http://www.enteract.com/~rneswold/avr/x421.html
# with "clean" added.

CC=avr-gcc
OBJCOPY=avr-objcopy

CFLAGS=-g -mmcu=atmega8515

rom.hex : hello.out
	$(OBJCOPY) -j .text -O ihex hello.out rom.hex

hello.out : hello.o
	$(CC) $(CFLAGS) -o hello.out -Wl,-Map,hello.map hello.o

hello.o : hello.c
	$(CC) $(CFLAGS) -Os -c hello.c

clean:
	rm -f *.o *.out *.map *.hex
