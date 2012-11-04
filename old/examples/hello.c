#include "common.h"

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

int main (void)
{
	DDRB = 0xff;
	PORTB = 0xff;

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

		if((PIND & _BV(6)) == 0)
		{
			PORTB &= ~_BV(6);
			off -= 0x04;
			updateOff(off);
			sleep(500);
			PORTB |= _BV(6);
		}
		else if((PIND & _BV(7)) == 0)
		{
			PORTB &= ~_BV(7);
			off += 0x04;
			updateOff(off);
			sleep(500);
			PORTB |= _BV(7);
		}
	}

    return (0);
}
