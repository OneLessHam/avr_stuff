#include <stdio.h>
#include <avr/io.h>
#include <avr/pgmspace.h>

#include "common.h"

#ifndef __AVR_UART_H__
#define __AVR_UART_H__

int uartWrite(char c, FILE* stream)
{
	loop_until_bit_is_set(UCSRA, UDRE);
   UDR = c;

	return 0;
}

int uartRead(FILE* stream)
{
	loop_until_bit_is_set(UCSRA, RXC);
	return UDR;
}

FILE uartStdout = FDEV_SETUP_STREAM(uartWrite, uartRead, _FDEV_SETUP_RW);

void initUart(uint16_t baudrate, char enableInterrupts)
{
	// Turn on the transmission and reception circuitry
   UCSRB |= (1 << RXEN) | (1 << TXEN);
	// Use 8-bit character sizes
   UCSRC |= (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1);

	// Load lower and upper bytes of the baud rate value into the UBRR register
	uint16_t prescale = ((F_CPU / (baudrate * 16UL)) - 1);
   UBRRL = (uint8_t)prescale;
   UBRRH = (uint8_t)(prescale >> 8);

	// redirect standard output and input
	stdout = stdin = &uartStdout;

	if(enableInterrupts)
	{
		// Enable the USART Recieve Complete interrupt (USART_RXC)
		UCSRB |= (1 << RXCIE);
		// Enable the Global Interrupt Enable flag so interrupts are processed
		sei();
	}
}

#endif // __AVR_UART_H__

