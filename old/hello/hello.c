#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#define USART_BAUDRATE 9600
#define BAUD_PRESCALE (((F_CPU / (USART_BAUDRATE * 16UL))) - 1)

void delayms(uint16_t millis) {
  while ( millis ) {
    _delay_ms(1);
    millis--;
  }
}

void initUsart()
{
   // Turn on the transmission and reception circuitry
   UCSRB |= (1 << RXEN) | (1 << TXEN); 
   // Use 8-bit character sizes - URSEL bit set to select the UCRSC register 
   UCSRC |= (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1); 

   // Load lower 8-bits of the baud rate value into the low byte of the UBRR register
   UBRRL = BAUD_PRESCALE; 
   // Load upper 8-bits of the baud rate value into the high byte of the UBRR register}
   UBRRH = (BAUD_PRESCALE >> 8); 

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

char buffer[128];

struct LED_INFO
{
	uint16_t off;
	uint16_t next;
	char state;
};

#define SIZE 6

struct LED_INFO info[SIZE];

void updateOff(char offset)
{
	uint16_t temp = offset;
	int c;
	for(c = 0; c < SIZE; c++)
	{
		info[c].off = temp;
		temp += offset;
	}
}

int
main (void)
{
	DDRB = 0xff;
	PORTB = 0xff;
	initUsart();

	int c;
	for(c = 0; c < SIZE; c++)
		info[c].next = info[c].state = 0;

	char on = 0x01;
	char off = 0x20;
	updateOff(off);

	while(1)
	{
		for(c = 0; c < SIZE; c++)
		{
			if(info[c].next-- == 0)
			{
				if(info[c].state)
				{
					info[c].next = info[c].off;
					PORTB |= _BV(c);
				}
				else
				{
					info[c].next = (on * (SIZE - c));
					PORTB &= ~_BV(c);
				}
				info[c].state = !info[c].state;
			}
		}

		char print = 0;
		if((PIND & _BV(6)) == 0)
		{
			PORTB &= ~_BV(6);
//			if(on > 1)
//				on--;
			off -= 0x04;
			updateOff(off);
			delayms(500);
			PORTB |= _BV(6);
			print = 1;
		}
		else if((PIND & _BV(7)) == 0)
		{
			PORTB &= ~_BV(7);
//			if(on < 0xff)
//				on++;
			off += 0x04;
			updateOff(off);
			delayms(500);
			PORTB |= _BV(7);
			print = 1;
		}
		if(print)
		{
			sprintf(buffer, "now: %d/%d", on, off);
			writeLine(buffer);
		}
	}

    return (0);
}
