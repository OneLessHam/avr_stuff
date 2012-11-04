//#include <avr/io.h>
//#include <avr/interrupt.h>

/* Prototypes */
void InitUART (unsigned char baudrate);
unsigned char ReceiveByte (void);
void TransmitByte (unsigned char data);


/* --------------------------------------------------------------
 Main - program that recieves a character then transmits back the next character.  
An example would be if you send in an A, the chip will return a B
---------------------------------------------------------------- */
int
main (void)
{
  unsigned char i;
  InitUART (95);     /* Set the baudrate to
2400 bps using a 3.6846MHz crystal */
  while (1)
    {
      TransmitByte (ReceiveByte () + 1);       
/* Echo the received character + 1.  Example send in A then send out B */
      for (i = 0; i < 200; i++);
    }
}

/* Initialize UART */
void
InitUART (unsigned char baudrate)
{
  /* Set the baud rate */
  UBRRL = baudrate;

  /* Enable UART receiver and transmitter */
  UCSRB = (1 << RXEN) | (1 << TXEN);

  /* set to 8 data bits, 1 stop bit */
  UCSRC = (1 << UCSZ1) | (1 << UCSZ0);

}

/* Read and write functions */
unsigned char
ReceiveByte (void)
{
  /* Wait for incomming data */
  while (!(UCSRA & (1 << RXC)));

  /* Return the data */
  return UDR;
}

void
TransmitByte (unsigned char data)
{
  /* Wait for empty transmit buffer */
  while (!(UCSRA & (1 << UDRE)));

  /* Start transmittion */
  UDR = data;
}
