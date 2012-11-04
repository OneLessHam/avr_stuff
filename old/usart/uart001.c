// Based on ap note AVR306 by ATMEL
// Routines for interrupt controlled USART

// Last modified: 26 October 2006
// Changed to work with WinAVR 20060421

// Changed : 6 December 2005
// adderd uppercase and lowercase receive routines

// Changed : 3 Nov 2005
// changed rx buffer access, added checks for non-atomic interrupt pointer modification
// changed function name DataInReceiveBuffer to USART_DataRx

// modified: 10 APR 2005
// added double speed baud support;
// Modified by: Murray Horn

// this file includes the tx and rx routines for a single uart mega avr.
// seperate tx and rx ques are available and can be sized in the .inc file
// a string tx feature from rom has been added (uart_puts_p).

//	Includes
#include <inttypes.h>
#include <avr/interrupt.h>

#include <avr/pgmspace.h>	// used for the string printing feature

#include "uart001.h"		// Prototypes 

// Static Variables
static uint8_t USART_RxBuf[USART_RX_BUFS];
static volatile uint8_t USART_RxHead;
static volatile uint8_t USART_RxTail;
static uint8_t USART_TxBuf[USART_TX_BUFS];
static volatile uint8_t USART_TxHead;
static volatile uint8_t USART_TxTail;


//-----------------------------------------------------
// Initialize USART
void USART_Init( uint16_t baudrate,uint8_t setup)
{
//------------------------------
// the doublespeed selector
	if (baudrate > 0x7ff)
	{
		baudrate += 1;
		baudrate = baudrate >> 1;
		baudrate -= 1;
		UCSRA = 0;
	}
	else
		UCSRA = (1<<U2X);
//------------------------------

//		Set the baud rate
    UBRRH = (uint8_t)(0x0f &(baudrate >> 8));
	UBRRL = (uint8_t) baudrate;
	

//		Enable UART receiver and transmmitter and receive int
    UCSRB = (1<<RXEN)|(1<<TXEN)|(1<<RXCIE);

//		Set frame format: data bits, stop bits,parity etc
	UCSRC = (1<<URSEL)| setup ; // set the uart bits,baudrate,stop bits
	
//		Flush buffers
	USART_RxTail = 0;
	USART_RxHead = 0;
	USART_TxTail = 0;
	USART_TxHead = 0;

}
//-----------------------------------------------------


//-----------------------------------------------------
//	RX Interrupt handler
SIGNAL(SIG_UART_RECV)
{
	uint8_t data;
	uint8_t tmphead;
	uint8_t nxthead;

//	Read the received data
	data = UDR;                 
//	Calculate buffer index
	tmphead = USART_RxHead;
	nxthead = ( tmphead + 1 ) & USART_RX_BUFFER_MASK;

	if ( nxthead == USART_RxTail )
	{
// ERROR! Receive buffer overflow
	}
	else
	{
		USART_RxBuf[tmphead] = data; // Store received data in buffer
		USART_RxHead = nxthead;      // Store new index 
	}	
}
//-----------------------------------------------------


//-----------------------------------------------------
//	TX Interrupt handler
SIGNAL(SIG_UART_DATA)
{
	uint8_t tmptail;

//	Check if all data is transmitted
	if ( USART_TxHead != USART_TxTail )
	{
//	Calculate buffer index
		tmptail = ( USART_TxTail + 1 ) & USART_TX_BUFFER_MASK;
		USART_TxTail = tmptail;			// Store new index
	
		UDR = USART_TxBuf[tmptail];	// Start transmition
	}
	else
	{
		UCSRB &= ~(1<<UDRIE);			// Disable UDRE interrupt
	}
}
//-----------------------------------------------------


//-----------------------------------------------------
//	RX function
uint8_t USART_Receive( void )
{
	uint8_t tmptail,tmphead;
	uint8_t b;
	
	do
		{
		tmptail = USART_RxTail;						// 
// double get the head to ensure no interrupt based corruption of the pointer
		do
			tmphead = USART_RxHead;
		while (tmphead != USART_RxHead);		// Wait for incomming data
		}	
	while ( USART_RxHead == tmptail );		// Wait for incomming data
		
		
	b = USART_RxBuf[tmptail];

	tmptail = ( tmptail + 1 ) & USART_RX_BUFFER_MASK; // Calculate buffer index
	
	USART_RxTail = tmptail;						// Store new index
	
	return b;				// Return data
}
//-----------------------------------------------------

//-----------------------------------------------------
// get the received byte in lower case
uint8_t USART_Receive_lc( void )
{
	uint8_t	ch;
	ch = USART_Receive();
	if (('A' <= ch) && ('Z' >= ch))
	  ch = ch - ('A'-'a');
	return ch;
}
//-----------------------------------------------------

//-----------------------------------------------------
// get the received byte in upper case
uint8_t USART_Receive_uc( void )
{
	uint8_t	ch;
	ch = USART_Receive();
	if (('a' <= ch) && ('z' >= ch))
	  ch = ch + ('A'-'a');
	return ch;
}
//-----------------------------------------------------


//-----------------------------------------------------
//	TX function
void USART_Transmit( uint8_t data )
{
	uint8_t tmphead;
//	Calculate buffer index
	tmphead = ( USART_TxHead + 1 ) & USART_TX_BUFFER_MASK;	// Wait for free space in buffer
	while ( tmphead == USART_TxTail );

	USART_TxBuf[tmphead] = data;			// Store data in buffer
	USART_TxHead = tmphead;					// Store new index

	UCSRB |= (1<<UDRIE);					//	Enable UDRE interrupt
}
//-----------------------------------------------------


//-----------------------------------------------------
uint8_t USART_DataRx( void )
{
	uint8_t	again;
	uint8_t tmptail,tmphead;

	do	{
		again = 0;
		tmphead = USART_RxHead;
		tmptail = USART_RxTail;
		if (tmphead != USART_RxHead) again = 1;
		if (tmptail != USART_RxTail) again = 1;
		}
	while (again);		// Wait for incomming data

	if ( tmphead == tmptail )
		return(0);
	else
		return(1);
}
//-----------------------------------------------------


//-----------------------------------------------------
// write a string to the usart from the program memory
void uart_puts_p(const char *progmem_s )
{
register char c;
	while ( (c = pgm_read_byte(progmem_s++)) ) 
		USART_Transmit(c);
}
//-----------------------------------------------------

//-----------------------------------------------------
// write a string to the usart from the program memory and add char 13 and 10
void uart_putsl_p(const char *progmem_s )
{
register char c;
	while ( (c = pgm_read_byte(progmem_s++)) ) 
		USART_Transmit(c);
 // new line
	USART_Transmit(0x0d);
	USART_Transmit(0x0a);
}
//-----------------------------------------------------
