#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#include "iocompat.h"
#include "uart.h"

uint16_t pwmValue;

ISR (TIMER1_OVF_vect)
{
/*	OCR = pwmValue;*/

	if(pwmValue > 0)
	{

		PORTB |= _BV(0);
/*		sleep(pwmValue / 2);*/
		uint16_t temp = pwmValue * 1;
		char dumb = PINB;
		while(temp > 0)
		{
/*			dumb = temp + 2;*/
			dumb = PINB;
/*			PORTB |= _BV(0);*/
			temp--;
		}
		PORTB &= ~_BV(0);
	}
}

void ioinit ()
{
/*    TCCR1A = TIMER1_PWM_INIT;*/
    TCCR1A = _BV(WGM10) | _BV(WGM11) | _BV(WGM12) | _BV(COM1A1);
    TCCR1B |= TIMER1_CLOCKSOURCE;

	 pwmValue = 100;
    OCR = pwmValue;
    DDROC = _BV (OC1);

    TIMSK = _BV (TOIE1);
    sei ();
}

int main (void)
{
	DDRB = 0xff;
	PORTB = 0;

	ioinit();
	initUart(9600, 0);

	char buffer[30];
	uint16_t value;
	while(1)
	{
		if(UCSRA & (1 << RXC))
		{
			readLine(buffer, 30);
			if(sscanf(buffer, "%d", &value) == 1)
			{
				pwmValue = value;
				OCR = pwmValue;
				sprintf(buffer, "set: %d\n", value);
				printf(buffer);
			}
		}
	}

	return 0;
}
