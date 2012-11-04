# Example Makefile for demo project
# Copied from http://www.enteract.com/~rneswold/avr/x421.html
# with "clean" added.

CC=avr-gcc
OBJCOPY=avr-objcopy
#CHIP=atmega8515
CHIP=atmega16

CFLAGS=-g -mmcu=$(CHIP) -O0

all: hello.hex sync_uart.hex simple_pwm.hex sample_pwm.hex ocr_pwm.hex adc.hex

#hello: hello.hex

hello.hex : hello.out
	$(OBJCOPY) -j .text -O ihex hello.out hello.hex

hello.out : hello.o
	$(CC) $(CFLAGS) -o hello.out -Wl,-Map,hello.map hello.o

hello.o : hello.c common.h
	$(CC) $(CFLAGS) -Os -c hello.c


#sync_uart: sync_uart.hex

sync_uart.hex : sync_uart.out
	$(OBJCOPY) -j .text -j .data -O ihex sync_uart.out sync_uart.hex

sync_uart.out : sync_uart.o
	$(CC) $(CFLAGS) -o sync_uart.out -Wl,-Map,sync_uart.map sync_uart.o

sync_uart.o : sync_uart.c common.h uart.h
	$(CC) $(CFLAGS) -Os -c sync_uart.c

#simple_pwm: simple_pwm.hex

simple_pwm.hex : simple_pwm.out
	$(OBJCOPY) -j .text -j .data -O ihex simple_pwm.out simple_pwm.hex

simple_pwm.out : simple_pwm.o
	$(CC) $(CFLAGS) -o simple_pwm.out -Wl,-Map,simple_pwm.map simple_pwm.o

simple_pwm.o : simple_pwm.c common.h uart.h
	$(CC) $(CFLAGS) -Os -c simple_pwm.c

#sample_pwm: sample_pwm.hex

sample_pwm.hex : sample_pwm.out
	$(OBJCOPY) -j .text -j .data -O ihex sample_pwm.out sample_pwm.hex

sample_pwm.out : sample_pwm.o
	$(CC) $(CFLAGS) -o sample_pwm.out -Wl,-Map,sample_pwm.map sample_pwm.o

sample_pwm.o : sample_pwm.c 
	$(CC) $(CFLAGS) -Os -c sample_pwm.c

#ocr_pwm: ocr_pwm.hex

ocr_pwm.hex : ocr_pwm.out
	$(OBJCOPY) -j .text -j .data -O ihex ocr_pwm.out ocr_pwm.hex

ocr_pwm.out : ocr_pwm.o
	$(CC) $(CFLAGS) -o ocr_pwm.out -Wl,-Map,ocr_pwm.map ocr_pwm.o

ocr_pwm.o : ocr_pwm.c common.h uart.h
	$(CC) $(CFLAGS) -Os -c ocr_pwm.c

#adc: adc.hex

adc.hex : adc.out
	$(OBJCOPY) -j .text -j .data -O ihex adc.out adc.hex

adc.out : adc.o
	$(CC) $(CFLAGS) -o adc.out -Wl,-Map,adc.map adc.o

adc.o : adc.c common.h uart.h
	$(CC) $(CFLAGS) -Os -c adc.c

clean:
	rm -f *.o *.out *.map *.hex

