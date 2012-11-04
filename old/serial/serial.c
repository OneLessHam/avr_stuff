#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>

#define F_CPU 3686400

char buffer[128];

void delayms(uint16_t millis) {
	uint16_t loop;
	while ( millis )
	{
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

char read()
{
	while ((UCSRA & (1 << RXC)) == 0) {}; 

	// temp
	PORTB &= ~_BV(0);
	delayms(100);
	PORTB |= _BV(0);
}

//set desired baud rate

#define BAUDRATE 19200

//calculate UBRR value

#define UBRRVAL ((F_CPU/(BAUDRATE*16UL))-1)

void USART_Init()

{
	//Set baud rate

	UBRRL=UBRRVAL; //low byte

	UBRRH=(UBRRVAL>>8); //high byte

	//Set data frame format: asynchronous mode,no parity, 1 stop bit, 8 bit size

	UCSRC=(1<<URSEL)|(0<<UMSEL)|(0<<UPM1)|(0<<UPM0)|

		(0<<USBS)|(0<<UCSZ2)|(1<<UCSZ1)|(1<<UCSZ0);

	//Enable Transmitter and Receiver

	UCSRB=(1<<RXEN)|(1<<TXEN);
}

void USART_bounce()

{
	//define temp value for storing received byte
	uint8_t Temp;

	/*
	//wait until data is received

	PORTB &= ~_BV(0);
	while(!(UCSRA&(1<<RXC)))
	{
		delayms(50);
		PORTB |= _BV(0);
		delayms(500);
	}
	PORTB |= _BV(0);
	*/


	//store received data to temp

	Temp = read();

	/*
	//wait for empty transmit buffer

	PORTB &= ~_BV(1);
	while (!(UCSRA&(1<<UDRE)))
	{
	delayms(50);
	PORTB |= _BV(1);
	delayms(500);
	}

	//send received data back

	UDR=Temp;
	*/

	sprintf(buffer, "0x%x - %d", Temp, Temp);
	writeLine(buffer);
}

int main(void) 
{
	DDRB = 0xff;
	PORTB = 0xff;

	USART_Init();

	char c = 45;
	char count = 10;
	while(count--)
	{
		PORTB &= ~_BV(2);
		UDR = c++;
		delayms(250);
		PORTB |= _BV(2);
		delayms(250);
	}

	while(1)
		USART_bounce();

	/*
		char bit = 0;
		while(1) {
		PORTB &= ~_BV(bit);
		delayms(100);
		PORTB |= _BV(bit);
		delayms(900);
		bit = (bit + 1) % 8;
		}
		*/

	return 0;
}
