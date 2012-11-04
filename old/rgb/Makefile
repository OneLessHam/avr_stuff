# Example Makefile for demo project
# Copied from http://www.enteract.com/~rneswold/avr/x421.html
# with "clean" added.

CC=avr-gcc
OBJCOPY=avr-objcopy
CHIP=atmega16

CFLAGS=-g -mmcu=$(CHIP) -O0 -I../examples/

all: rgb.hex

#rgb: rgb.hex

rgb.hex : rgb.out
	$(OBJCOPY) -j .text -j .data -O ihex rgb.out rgb.hex

rgb.out : rgb.o
	$(CC) $(CFLAGS) -o rgb.out -Wl,-Map,rgb.map rgb.o

rgb.o : rgb.c 
	$(CC) $(CFLAGS) -Os -c rgb.c

clean:
	rm -f *.o *.out *.map *.hex
