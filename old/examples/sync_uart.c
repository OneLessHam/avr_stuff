#include "uart.h"

int main (void)
{
	DDRB = 0xff;
	PORTB = 0x00;

	initUart(9600, 0);

	printf("Synchronous serial test:\n");
	printf("Type something and I'll cough it back...\n");

	uint16_t count = 0;
	char buffer[128];
	while(1)
	{
		char c = getchar();
		PORTB |= _BV(0);

		sprintf(buffer, "%d: got %c (0x%x)\n", count++, c, c);
		printf(buffer);

		PORTB &= ~_BV(0);
	}
}

