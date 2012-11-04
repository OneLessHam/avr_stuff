#include "uart.h"
#include "iocompat.h"

#define MAX_COMMAND_SIZE	32
char command[MAX_COMMAND_SIZE];

#ifdef DEBUG
char debug[128];

void printHelp(char*);
#endif

void processCommand();

enum LED_STATE
{
	OFF			= 0,
	ON				= 1,
	DIMMED		= 2,
	PULSE_UP		= 3,
	PULSE_DOWN	= 4,
};

struct LED_INFO
{
	enum LED_STATE state;
	uint8_t flags[2];
	uint8_t step;
};

struct LED_INFO info[8];

uint8_t force;
uint8_t process;

ISR (TIMER1_OVF_vect)
{
	uint8_t index;
	struct LED_INFO* p;

	process = force = 0;
	for(index = 0; index < 8; index++)
	{
		p = &info[index];
		p->step = 0;
	}
	/*
	PORTB = process | force;
	if(process == 0)
		return;

	for(index = 0; index < 8; index++)
		info[index].step = 0;
	*/

	uint8_t test = process;
	uint8_t delta;
	while(test != 0)
	{
		for(index = 0; index < 8; index++)
		{
			if((test & _BV(index)) == 0)
				continue;

			p = &info[index];

			if(p->step++ >= p->flags[0])
			{
				PORTB &= ~_BV(index);
				test &= ~_BV(index);

				delta = p->flags[0] / 20;
				if(delta == 0)
					delta = 1;
				switch(p->state)
				{
					case PULSE_UP:
					{
						if(p->flags[0] >= p->flags[1])
							p->state = PULSE_DOWN;
						else
							p->flags[0] += delta;
					}
					break;

					case PULSE_DOWN:
					{
						if(p->flags[0] <= 1)
							p->state = PULSE_UP;
						else
							p->flags[0] -= delta;
					}
					break;
				}
			}
		}
	}
}

void main (void)
{
	DDRB = 0xff;
	PORTB = 0;

	initUart(9600, 0);

#ifdef DEBUG
	printHelp(NULL);
#endif

	// initialize the 16-bit timer
	TCCR1A = _BV(COM1A1);
	TCCR1B |= TIMER1_CLOCKSOURCE;
	TIMSK = _BV (TOIE1);

	memset(info, 0, sizeof(struct LED_INFO) * 8);

	process = force = 0;

	sei ();
	while(1)
	{
		if(UCSRA & (1 << RXC))
			processCommand();
	}
}

#ifdef DEBUG
void printHelp(char* message)
{
	if(message != NULL)
	{
		printf(message);
		printf("\n");
	}
	printf("Get your own help...\n");
	/*
	printf("Commands:\n");
	printf("  h - Print help\n");
	printf("  d:<bits>:<duration> - Set sleep duration for a led\n");
	printf("  o:<bits> - Turn the specified led fully on\n");
	printf("  f:<bits> - Turn the specified led fully off\n");
	*/
}
#endif

void processCommand()
{
	cli();

	uint8_t length = readLine(command, MAX_COMMAND_SIZE);
	command[length] = '\0';

#ifdef DEBUG
	char* help = "Invalid command";
#endif

	uint8_t bits = 0;
	uint8_t pos = 0;
	uint8_t index;
	if(length >= 3)
	{
		if(command[1] != ':')
		{
#ifdef DEBUG
			printHelp(help);
#endif
			return;
		}

		char range = 0;
		char last = 0;
		pos = 2;
		for(pos = 2; ((pos < length) && (command[pos] != ':')); pos++)
		{
			if(command[pos] == '-')
				range = 1;
			else
			{
				char test = command[pos] - 0x30;
				if(test >= 8)
				{
#ifdef DEBUG
					printHelp("Invalid bit (0-7)");
#endif
					return;
				}

				if(range)
				{
					for(index = last + 1; index <= test; index++)
						bits |= 1 << index;
					range = 0;
				}
				else
					bits |= 1 << test;

				last = test;
			}
		}
	}

	switch(command[0])
	{
#ifdef DEBUG
		case 'h':
			printHelp(NULL);
			help = NULL;
			break;
#endif

		case 'd':
		case 'p':
			if((bits != 0) && (pos < (length - 1)))
			{
				uint8_t duration = 0;
				if(sscanf(&command[pos + 1], "%d", &duration) == 1)
				{
#ifdef DEBUG
					sprintf(debug, "setting: %d (%d)\n", duration, bits);
					printf(debug);
#endif

					for(index = 0; index < 8; index++)
					{
						if(bits & _BV(index))
						{
							process |= _BV(index);
							force &= ~_BV(index);
							if(command[0] == 'd')
							{
								info[index].state = ON;
								info[index].flags[0] = duration;
							}
							else
							{
								info[index].state = PULSE_UP;
								info[index].flags[1] = duration;
							}
						}
					}
#ifdef DEBUG
					help = NULL;
				}
				else
					help = "Invalid duration";
#else
				}
#endif
			}
			break;

		case 'o':
		case 'f':
			if(bits != 0)
			{
				for(index = 0; index < 8; index++)
				{
					if(bits & _BV(index))
					{
						if(command[0] == 'o')
						{
							process &= ~_BV(index);
							force |= _BV(index);
						}
						else
						{
							process &= ~_BV(index);
							force &= ~_BV(index);
						}
					}
				}
#ifdef DEBUG
				help = NULL;
#endif
			}
			break;

			/*
		case 'i':
		case 'I':
			sprintf(debug, "Process: 0x%x  Force: 0x%x\n", process, force);
			printf(debug);
			for(index = 0; index < 8; index++)
			{
				sprintf(debug, "%d: State: %d  Duration: %d\n", info[index].state,
						info[index].duration);
				printf(debug);
			}
			help = NULL;
			break;
			*/

#ifdef DEBUG
		default:
			sprintf(debug, "Invalid command: %s", command);
			help = debug;
			break;
#endif
	}

#ifdef DEBUG
	sprintf(debug, "command: %c  b: %d  p: %d  f: %d\n", command[0], bits, 
			process, force);
	printf(debug);

	if(help != NULL)
		printHelp(help);
#endif

	sei();
}

