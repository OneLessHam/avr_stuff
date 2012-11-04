/*****************************************************
Flickering LED candle for the AVR ATtiny13
by Roy M. Silvernail, with help from the net.

This code is released into the public domain with no warranty.  
Use it, abuse it, pass it on.  But if it breaks, you get to keep the
pieces.

Note that the delay_ms function, while theoretically correct, doesn't
seem to line up with actual milliseconds.  Since the absolute timing for
this project isn't critical, I just eyeballed the timing values.

Sept. 2, 2008
*****************************************************/

#include <avr/io.h>
#include <util/delay.h>
static inline void _delay_loop_2(uint16_t __count) __attribute__((always_inline));

#define delay_us(us)   _delay_loop_2((unsigned int)(((float)F_CPU*us)/4000000L))
#define nop()         asm("nop")

//Global variables and definition
#define BRIGHT_MIN 40
#define BRIGHT_RATE 60
#define BRIGHT_HOLD 150
#define INTER_FLASH 128

void delay_ms(uint16_t x)
	{
	while(x--)
		{
		delay_us(1000);
		}
	}
	

/*
 * pseudorandom
 * return the next pseudo-random number (PRN) using a standard maximum
 * length xor-feedback 16-bit shift register.
 * This returns the number from 1 to 65535 in a fixed but apparently
 * random sequence.  No one number repeats.
 */
 
uint16_t randreg = 10;

static uint16_t pseudorandom16 (void)
{
    uint16_t newbit = 0;

    if (randreg == 0) {
        randreg = 1;
    }
    if (randreg & 0x8000) newbit = 1;
    if (randreg & 0x4000) newbit ^= 1;
    if (randreg & 0x1000) newbit ^= 1;
    if (randreg & 0x0008) newbit ^= 1;
    randreg = (randreg << 1) + newbit;
    return randreg;
} 

void pwm_start(void){
        OCR0A = BRIGHT_MIN;   	// Initial pulse width
        DDRB |= 1;            	// Set pin 5 as output
        TCCR0A = 0x81;          //8-bit, Non-Inverted PWM
        TCCR0B = 1;             //Start PWM
}


int main(void)
	{
	int i;
	pwm_start();
	while(1)
		{
		for(i=BRIGHT_MIN;i<256;i++)
			{
			OCR0A = i;
			delay_us(BRIGHT_RATE);
			}
		delay_us(BRIGHT_HOLD);
		for(;i>=BRIGHT_MIN;i--)
			{
			OCR0A = i;
			delay_us(BRIGHT_RATE);
			}
		delay_ms(pseudorandom16() % INTER_FLASH);
		}
    }

