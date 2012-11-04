#define F_CPU 3686400

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#ifndef __AVR_COMMON_H__
#define __AVR_COMMON_H__

void sleep(uint16_t millis) {
  while ( millis ) {
    _delay_ms(1);
    millis--;
  }
}

uint8_t readLine(char* buffer, uint8_t max)
{
	uint8_t pos = 0;
	while(pos < (max - 1))
	{
		buffer[pos + 1] = '\0';
		char c = getchar();

		switch(c)
		{
			case '\r': 
				break; // ignore
			case '\n': 
				return pos;
			default:
				buffer[pos++] = c;
				break;
		}
	}

	return pos;
}

#endif // __AVR_COMMON_H__
