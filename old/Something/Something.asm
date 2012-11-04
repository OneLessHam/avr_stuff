.include "8515def.inc"

.def Temp	=r16
.def Delay	=r17
.def Delay2	=r18

RESET:
ser	Temp
out	DDRB,Temp

LOOP:
out	PORTB,temp
sbis PIND,0x00
inc	Temp
sbis PINB,0x01
dec Temp
sbis PINB,0x02
ror Temp
sbis PIND,0x03
rol Temp
sbis PIND,0x04
com Temp
sbis PIND,0x05
neg Temp
sbis PIND,0x06
swap Temp

DLY:
dec Delay
brne DLY
dec Delay2
brne DLY

rjmp LOOP
