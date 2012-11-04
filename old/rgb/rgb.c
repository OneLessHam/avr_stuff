#include "uart.h"
#include "iocompat.h"

// shortcuts for turning things on/off
#define LED_ON(x) PORTB |= _BV(x)
#define LED_OFF(x) PORTB &= ~_BV(x)
#define ALL_OFF() PORTB = 0;
#define ALL_ON() PORTB = -1;

/**
 * Basic command syntax is:
 * <leds>:<command>[:<options>]
 * <leds> can be:
 * 	a list of led  indexes ('4', '135')
 * 	a range ('1-3')
 * <commands> can be:
 *    l:<level> set led level [0-255]
 *    p:<level> pulse up to level [0-255]
 */
#define MAX_COMMAND_SIZE	32
char input[MAX_COMMAND_SIZE];
void processCommand();
void setLevel(uint8_t led, uint8_t level);
char buffer[128];

#define LED_COUNT		6
#define MAX_OPTIONS	2

#define LED_MODE_SOLID	0
#define LED_MODE_PULSE	1

struct LED_INFO
{
	uint8_t mode;
	uint8_t state;
	uint8_t level;
	uint8_t options[MAX_OPTIONS];
};
struct LED_INFO ledInfo[LED_COUNT];

#define SLICE_COUNT	8
uint8_t slices[SLICE_COUNT];
uint8_t skip = 0;
uint8_t step = 0;
ISR (TIMER1_COMPA_vect)
{
	if(skip == 0)
	{
		PORTB = slices[step];

		if(step == 7)
		{
			skip = 0;
			step = 0;
		}
		else
		{
			step++;
			skip = _BV(step);
		}
	}
	else
		skip--;
}

uint16_t updatePeriod;

int main (void)
{
	DDRB = 0xff;
	PORTB = 0;

	initUart(9600, 0);

	// initialize the 16-bit timer
	TCCR1A = _BV(COM1A1);
	TCCR1B |= TIMER1_CLOCKSOURCE | _BV(WGM12);
	TIMSK = _BV (OCIE1A); 
	OCR1A = 1024;

	memset(ledInfo, 0, sizeof(struct LED_INFO) * LED_COUNT);
	memset(slices, 0, SLICE_COUNT);
	updatePeriod = 0x00ff;

	sei ();
	uint16_t update = 0;
	while(1)
	{
		if(UCSRA & _BV(RXC))
			processCommand();

		if(update++ >= updatePeriod)
		{
			update = 0;

			uint8_t index;
			for(index = 0; index < LED_COUNT; index++)
			{
				struct LED_INFO* p = &ledInfo[index];

				switch(p->mode)
				{
					case LED_MODE_PULSE:
						if(p->state == 0) // pulse up
						{
							if(p->level < p->options[0])
								setLevel(index, p->level + 1);
							else
								p->state = 1;
						}
						else
						{
							if(p->level > 0)
								setLevel(index, p->level - 1);
							else
								p->state = 0;
						}

						/*
						sprintf(buffer, "%d: %d %d %d\n", index, p->level, p->state,
								p->options[0]);
						printf(buffer);
						*/
						break;
				}
			}
		}
	}
	
	return 0;
}

void processCommand()
{
	cli();
	ALL_OFF();


	uint8_t length = readLine(input, MAX_COMMAND_SIZE);
	if(length == 0)
		return;
	input[length] = '\0';

	uint8_t pos = 0;
	while(pos < length)
	{
		// first figure out which LEDs to affect
		uint8_t index;
		uint8_t leds = 0;
		uint8_t last = 0;
		uint8_t range = 0;
		for( ; ((pos < length) && (input[pos] != ':')); pos++ )
		{
			if(input[pos] == '-')
				range = 1;
			else
			{
				uint8_t test = input[pos] - 0x30;
				if(test >= LED_COUNT)
					return;

				if(range)
				{
					for(index = last + 1; index <= test; index++)
						leds |= 1 << index;
					range = 0;
				}
				else
					leds |= 1 << test;

				last = test;
			}
		}

		// bail if no leds specified or no command follows
		if((leds == 0) || (++pos >= length))
			return;

		// next character is the command
		char command = input[pos++]; 

		// read the options
		uint8_t options[MAX_OPTIONS];
		uint16_t longOptions;
		memset(options, 0, MAX_OPTIONS);
		last = 0;
		for( ; ((pos < length) && (input[pos] != ';')); pos++ )
		{
			uint8_t test = input[pos];
			switch(input[pos])
			{
				case ':':
				case ',':
					if(pos < (length - 1))
					{
						sscanf(&input[pos + 1], "%d", &options[last++]);
						sscanf(&input[pos + 1], "%d", &longOptions);
					}
					break;
			}
		}
		pos++;

		if(command == 'u')
			updatePeriod = longOptions;
		else if(command == 't')
			OCR1A = longOptions;
		else
		{
			// now apply the command to the specified leds
			for(index = 0; index < LED_COUNT; index++)
			{
				struct LED_INFO* p = &ledInfo[index];

				if(leds & _BV(index))
				{
					switch(command)
					{
						case 'l':
							p->mode = LED_MODE_SOLID;
							setLevel(index, options[0]);
							break;

						case 'p':
							p->options[0] = options[0];
							p->mode = LED_MODE_PULSE;
							p->state = 0;
							setLevel(index, 0);
							break;
					}
				}
			}
		}
	}

	ALL_OFF();

	sei();
}

void setLevel(uint8_t led, uint8_t level)
{
	ledInfo[led].level = level;

	uint8_t index;
	uint8_t temp = _BV(led);
	for(index = 0; index < SLICE_COUNT; index++)
	{
		if(level & _BV(index))
			slices[index] |= temp;
		else
			slices[index] &= ~temp;
	}
}

