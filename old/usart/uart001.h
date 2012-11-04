// changed 3 Nov 2005

#include "uart001.inc"

//	Prototypes
void USART_Init( uint16_t baudrate,uint8_t setup);
uint8_t USART_Receive( void );
void USART_Transmit(uint8_t data );
uint8_t USART_DataRx( void );
void uart_puts_p(const char *progmem_s );
void uart_putsl_p(const char *progmem_s );
uint8_t USART_Receive_uc( void );
uint8_t USART_Receive_lc( void );
