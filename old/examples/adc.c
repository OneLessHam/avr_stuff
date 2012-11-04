#include "uart.h"

#define LED_ON(x) PORTB |= _BV(x)
#define LED_OFF(x) PORTB &= ~_BV(x)

int main (void)
{
	DDRB = 0xff;
	PORTB = 0x00;

	initUart(9600, 0);

	// REFS1/REFS0 = 0 - use AVCC as reference
	// MUX000 = 0 - read from ADC0 pin
	ADMUX = 0x00;

	// enable ADC, 128 prescaler
	ADCSRA = _BV(ADEN) | 7;

	char buffer[128];
	while(1)
	{
		LED_ON(3);

		// start conversion
		ADCSRA |= _BV(ADSC);
		while(ADCSRA & _BV(ADSC));

		LED_OFF(3);

		uint8_t low = ADCL;
		uint8_t high = ADCH;
		sprintf(buffer, "high: 0x%x  low: 0x%x\n", high, low);
		printf(buffer);

		sleep(1000);
	}
}

#define LED_ON(x) PORTB |= _BV(x)
#define LED_OFF(x) PORTB &= ~_BV(x)
