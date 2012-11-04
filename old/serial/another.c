#define F_CPU 3686400

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>  
#include <util/delay.h>
#include <stdio.h>

#define USART_BAUDRATE 9600
#define BAUD_PRESCALE (((F_CPU / (USART_BAUDRATE * 16UL))) - 1)

char buffer[128];

void delayms(uint16_t millis) {
  while ( millis ) {
    _delay_ms(1);
    millis--;
  }
}

void write(char c)
{
   while ((UCSRA & (1 << UDRE)) == 0) {}; 
   UDR = c;
}

void writeLine(char* p)
{
   while(*p != 0)

   {
      write(*p);
	  p++;
   }
   write(0x0d);
   write(0x0a);
}


#define INTERRUPT
#ifndef INTERRUPT

int main (void)
{
   DDRB = 0xff;
   PORTB = 0xff;

   // Turn on the transmission and reception circuitry
   UCSRB |= (1 << RXEN) | (1 << TXEN); 
   // Use 8-bit character sizes - URSEL bit set to select the UCRSC register 
   UCSRC |= (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1); 

   // Load lower 8-bits of the baud rate value into the low byte of the UBRR register
   UBRRL = BAUD_PRESCALE; 
   // Load upper 8-bits of the baud rate value into the high byte of the UBRR register}
   UBRRH = (BAUD_PRESCALE >> 8); 

   char ReceivedByte;
   for (;;) // Loop forever
   {
      // Do nothing until data have been recieved and is ready to be read from UDR
      while ((UCSRA & (1 << RXC)) == 0) {}; 

	  PORTB &= ~_BV(0);
	  delayms(100);
	  PORTB |= _BV(0);

	  // Fetch the recieved byte value into the variable "ByteReceived"
      ReceivedByte = UDR; 

      // Do nothing until UDR is ready for more data to be written to it
      while ((UCSRA & (1 << UDRE)) == 0) {}; 
	  // Echo back the received byte back to the computer
      UDR = ReceivedByte + 1; 
   }   
}

#else

int main (void)
{
   DDRB = 0xff;
   PORTB = 0xff;

   DDRC = 0x00;
//   PORTC = 0xff;

	// Turn on the transmission and reception circuitry
   UCSRB |= (1 << RXEN) | (1 << TXEN);
	// Use 8-bit character sizes
   UCSRC |= (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1);

	// Load lower and upper bytes of the baud rate value into the UBRR register
   UBRRL = BAUD_PRESCALE;
   UBRRH = (BAUD_PRESCALE >> 8);

	// Enable the USART Recieve Complete interrupt (USART_RXC)
   UCSRB |= (1 << RXCIE);
	// Enable the Global Interrupt Enable flag so interrupts are processed
   sei();

   for (;;) // Loop forever
   {
     char temp = PINA;
	  if(temp != 0xff)
	  {
		  sprintf(buffer, "a: 0x%x", temp);
		  writeLine(buffer);
		  PORTB = temp;
		  delayms(100);
		  PORTB - 0xff;
		  delayms(500);
	  }

//      PORTB = PORTC;
//	  delayms(100);
/*	   PORTB &= ~_BV(0);
	   delayms(1000);
	   PORTB |= _BV(0);
	   delayms(1000); */
   }   
}

ISR(SIG_UART_RECV)
{
   char ReceivedByte;

   PORTB &= ~_BV(1);
   delayms(100);
   PORTB |= _BV(1);

   ReceivedByte = UDR; // Fetch the recieved byte value into the variable "ByteReceived"
   sprintf(buffer, "0x%x - %d", ReceivedByte, ReceivedByte);
   writeLine(buffer);

   delayms(1000);
}


#endif


