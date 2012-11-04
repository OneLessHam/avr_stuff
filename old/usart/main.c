// Serial Port test app. for the ATMega8
// dowloaded from http://www.opend.co.za/
// Written by: Murray Horn

// Last modified: 26 October 2006
// Changed to work with WinAVR 20060421

// modified: 25 Nov 2005
// changed to use new interfaces with the new uart0001.c
// modified: 21 April 2005
// Compiled on WinAVR 20040404

// Includes
#include <inttypes.h>
#include <avr/interrupt.h>

#include <avr/io.h>			// included to enable the writing of strings from rom
#include <avr/pgmspace.h>	// included to enable the writing of strings from rom
#include <util/delay.h>

#include "uart001.inc"

// constants

#define FCPU         3686400      /* CPU speed */

void delayms(uint16_t millis) {
  uint16_t loop;
  while ( millis ) {
    _delay_ms(1);
    millis--;
  }
}

//-----------------------------------------------------
// Main - a simple test program
int main( void )
{
	USART_Init(UART_BAUD_SELECT(9600,FCPU),USART_SET_8_1_N);   //baudrate = 9600 bps 8 data bits 1 stop bit no parity

    sei(); // enable interupts

// into string -----------------------------------------------
	uart_putsl_p(PSTR("....................................."));
	uart_putsl_p(PSTR("Serial port test application"));
	uart_putsl_p(PSTR("by Murray Horn."));
	uart_putsl_p(PSTR("From www.opend.co.za"));
	uart_putsl_p(PSTR("....................................."));
// into string -----------------------------------------------


	DDRB = 0xff;
	PORTB = 0xff;


	while(1)// forever
	{
//	    PORTB &= ~_BV(0);
//	    delayms(100);

		if (USART_DataRx())
		{
//		    PORTB &= ~_BV(1);
//		    delayms(100);

			USART_Transmit(1+ USART_Receive()); // transmit the received character + 1 on the ascii table

//			PORTB |= _BV(1);
//  		delayms(900);
		};

//		PORTB |= _BV(0);
//    	delayms(900);
	}
}
//-----------------------------------------------------
