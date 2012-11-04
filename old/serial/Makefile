# Example Makefile for demo project
# Copied from http://www.enteract.com/~rneswold/avr/x421.html
# with "clean" added.

CC=avr-gcc
OBJCOPY=avr-objcopy

CFLAGS=-g -mmcu=atmega8515

serial.hex : serial.out
	$(OBJCOPY) -j .text -O ihex serial.out serial.hex

serial.out : serial.o
	$(CC) $(CFLAGS) -o serial.out -Wl,-Map,serial.map serial.o

serial.o : serial.c
	$(CC) $(CFLAGS) -Os -c serial.c

another.hex : another.out
	$(OBJCOPY) -j .text -O ihex another.out another.hex

another.out : another.o
	$(CC) $(CFLAGS) -o another.out -Wl,-Map,another.map another.o

another.o : another.c
	$(CC) $(CFLAGS) -Os -c another.c

clean:
	rm -f *.o *.out *.map *.hex
