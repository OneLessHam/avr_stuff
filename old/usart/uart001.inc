// Last modified: 10 APR 2005
// added double speed baud support;
//====================================================
//	UART Buffer Defines
//====================================================
//	Val		Buffer Size
//
//	0		2
//	1		4
//	2		8
//	3		16
//	4		32
//	5		64
//	6		128
//	7		256
//
#define USART_RX_BUFFER_BITS 4     /* 2,4,8,16,32,64,128 or 256 bytes */
#define USART_TX_BUFFER_BITS 4     /* 2,4,8,16,32,64,128 or 256 bytes */
//====================================================


//====================================================
// do not change !!!	do not change	!!!do not change

// the software expects the buffer size to be a multiple of 2
#define USART_RX_BUFS (1 << (7 & (1+USART_RX_BUFFER_BITS)))
#define USART_TX_BUFS (1 << (7 & (1+USART_RX_BUFFER_BITS)))
#define USART_RX_BUFFER_MASK ( USART_RX_BUFS - 1 )
#define USART_TX_BUFFER_MASK ( USART_TX_BUFS - 1 )

#define UART_BAUD_SELECT(baudRate,xtalCpu) ((xtalCpu/baudRate/8)-1)

#define	USART_SET_8_1_N	0x006
#define	USART_SET_7_1_N	0x004
#define	USART_SET_6_1_N	0x002
#define	USART_SET_5_1_N	0x000

#define	USART_SET_8_1_E	0x026
#define	USART_SET_7_1_E	0x024
#define	USART_SET_6_1_E	0x022
#define	USART_SET_5_1_E	0x020

#define	USART_SET_8_1_O	0x036
#define	USART_SET_7_1_O	0x034
#define	USART_SET_6_1_O	0x032
#define	USART_SET_5_1_O	0x030

#define	USART_SET_8_2_N	0x00e
#define	USART_SET_7_2_N	0x00c
#define	USART_SET_6_2_N	0x00a
#define	USART_SET_5_2_N	0x008

#define	USART_SET_8_2_E	0x02e
#define	USART_SET_7_2_E	0x02c
#define	USART_SET_6_2_E	0x02a
#define	USART_SET_5_2_E	0x028

#define	USART_SET_8_2_O	0x03e
#define	USART_SET_7_2_O	0x03c
#define	USART_SET_6_2_O	0x03a
#define	USART_SET_5_2_O	0x038


// do not change upto here!!!	do not change upto here!!!
//====================================================


