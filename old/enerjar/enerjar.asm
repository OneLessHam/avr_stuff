;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.7.0 #4818 (May 31 2007)
; This file generated Fri Feb  8 05:31:42 2008
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.module enerjar
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; config word 
;--------------------------------------------------------
	__config 0x3f33
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__divulong
	extern	__modsint
	extern	__divsint
	extern	__mullong
	extern	__mulint
	extern	_ADCON0_bits
	extern	_ADCON1_bits
	extern	_CCP1CON_bits
	extern	_CCP2CON_bits
	extern	_CMCON_bits
	extern	_CVRCON_bits
	extern	_EECON1_bits
	extern	_INTCON_bits
	extern	_OPTION_REG_bits
	extern	_PCON_bits
	extern	_PIE1_bits
	extern	_PIE2_bits
	extern	_PIR1_bits
	extern	_PIR2_bits
	extern	_PORTA_bits
	extern	_PORTB_bits
	extern	_PORTC_bits
	extern	_PORTD_bits
	extern	_PORTE_bits
	extern	_RCSTA_bits
	extern	_SSPCON_bits
	extern	_SSPCON2_bits
	extern	_SSPSTAT_bits
	extern	_STATUS_bits
	extern	_T1CON_bits
	extern	_T2CON_bits
	extern	_TRISA_bits
	extern	_TRISB_bits
	extern	_TRISC_bits
	extern	_TRISD_bits
	extern	_TRISE_bits
	extern	_TXSTA_bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	__mulchar
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_disp_disp
	global	_disp_dig
	global	_disp_kilo
	global	_disp_set_decimal_places
	global	_disp_set_num_raw
	global	_disp_set_num
	global	_adc_wait
	global	_delay
	global	_adc_on
	global	_adc_off
	global	_adc_set_clock
	global	_adc_set_channel
	global	_adc_start
	global	_adc_set_port_config
	global	_adc_read_int
	global	_init_data
	global	_read_sweep
	global	_read_mode
	global	_get_data
	global	_analysis
	global	_main
	global	_sseg
	global	_dispsize
	global	_dispdig
	global	_dot_after
	global	_kilo
	global	_reference
	global	_current
	global	_current_diff
	global	_current_max
	global	_voltage
	global	_voltage_diff
	global	_voltage_max
	global	_mode1
	global	_mode2
	global	_mode3
	global	_mode4
	global	_mode5
	global	_mode6
	global	_mode7
	global	_mode8
	global	_moving_avg
	global	_moving_avg_total
	global	_moving_avg_i
	global	_total1
	global	_total_cnt
	global	_dig_pins

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_enerjar_0	udata
_dispdig	res	5

UD_enerjar_1	udata
_moving_avg	res	20

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_enerjar_0	udata
r0x1072	res	1
r0x1071	res	1
r0x1070	res	1
r0x106F	res	1
r0x1073	res	1
r0x1074	res	1
r0x1076	res	1
r0x1075	res	1
r0x1077	res	1
r0x1078	res	1
r0x107A	res	1
r0x1079	res	1
r0x107B	res	1
r0x107C	res	1
r0x107D	res	1
r0x1080	res	1
r0x1081	res	1
r0x1082	res	1
r0x1069	res	1
r0x106A	res	1
r0x106B	res	1
r0x106C	res	1
r0x106D	res	1
r0x106E	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_enerjar_0	idata
_sseg
	db	0x3f
	db	0x06
	db	0x5b
	db	0x4f
	db	0x66
	db	0x6d
	db	0x7d
	db	0x07
	db	0x7f
	db	0x6f


ID_enerjar_1	idata
_dispsize
	db	0x00


ID_enerjar_2	idata
_dot_after
	db	0x00


ID_enerjar_3	idata
_kilo
	db	0x00


ID_enerjar_4	idata
_reference
	db	0x01, 0x00


ID_enerjar_5	idata
_current
	db	0x02, 0x00


ID_enerjar_6	idata
_current_diff
	db	0x0c, 0x00


ID_enerjar_7	idata
_current_max
	db	0x00, 0x00, 0x00, 0x00


ID_enerjar_8	idata
_voltage
	db	0x04, 0x00


ID_enerjar_9	idata
_voltage_diff
	db	0x0d, 0x00


ID_enerjar_10	idata
_voltage_max
	db	0x00, 0x00, 0x00, 0x00


ID_enerjar_11	idata
_mode1
	db	0x01, 0x00, 0x00, 0x00


ID_enerjar_12	idata
_mode2
	db	0x02, 0x00, 0x00, 0x00


ID_enerjar_13	idata
_mode3
	db	0x03, 0x00, 0x00, 0x00


ID_enerjar_14	idata
_mode4
	db	0x04, 0x00, 0x00, 0x00


ID_enerjar_15	idata
_mode5
	db	0x05, 0x00, 0x00, 0x00


ID_enerjar_16	idata
_mode6
	db	0x06, 0x00, 0x00, 0x00


ID_enerjar_17	idata
_mode7
	db	0x07, 0x00, 0x00, 0x00


ID_enerjar_18	idata
_mode8
	db	0x08, 0x00, 0x00, 0x00


ID_enerjar_19	idata
_moving_avg_total
	db	0x00, 0x00, 0x00, 0x00


ID_enerjar_20	idata
_moving_avg_i
	db	0x00


ID_enerjar_21	idata
_total1
	db	0x00, 0x00, 0x00, 0x00


ID_enerjar_22	idata
_total_cnt
	db	0x00, 0x00, 0x00, 0x00


ID_enerjar_23	idata
_dig_pins
	db	0x01
	db	0x02
	db	0x08
	db	0x10

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_enerjar	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _adc_set_clock
;   _adc_on
;   _init_data
;   _read_mode
;   _read_sweep
;   _init_data
;   _get_data
;   _get_data
;   _disp_dig
;   _analysis
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_kilo
;   _adc_set_clock
;   _adc_on
;   _init_data
;   _read_mode
;   _read_sweep
;   _init_data
;   _get_data
;   _get_data
;   _disp_dig
;   _analysis
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_set_num
;   _disp_kilo
;9 compiler assigned registers:
;   r0x1069
;   r0x106A
;   r0x106B
;   r0x106C
;   r0x106D
;   r0x106E
;   STK02
;   STK01
;   STK00
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=186previous max_key=9 
_main	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _INTCON, size = 1
;; 	line = 9891 result AOP_DIR=_INTCON, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1327  _INTCON   offset=0 - had to alloc by reg name
	.line	460; "enerjar.c"	INTCON = 0;
	BANKSEL	_INTCON
	CLRF	_INTCON
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _TRISA, size = 1
;; 	line = 9891 result AOP_DIR=_TRISA, size=1, left -=-, size=0, right AOP_LIT=0xff, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	463; "enerjar.c"	TRISA = 255;
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _TRISA   offset=0
	BANKSEL	_TRISA
	MOVWF	_TRISA
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _TRISB, size = 1
;; 	line = 9891 result AOP_DIR=_TRISB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _TRISB   offset=0
	.line	464; "enerjar.c"	TRISB = 0;
	CLRF	_TRISB
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _TRISC, size = 1
;; 	line = 9891 result AOP_DIR=_TRISC, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _TRISC   offset=0
	.line	465; "enerjar.c"	TRISC = 0;
	CLRF	_TRISC
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _TRISD, size = 1
;; 	line = 9891 result AOP_DIR=_TRISD, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _TRISD   offset=0
	.line	466; "enerjar.c"	TRISD = 0;
	CLRF	_TRISD
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	470; "enerjar.c"	adc_set_clock(0x2);
	MOVLW	0x02
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_clock
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	471; "enerjar.c"	adc_on();
	CALL	_adc_on
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=2
;; 	line = 9891 result AOP_REG=r0x1096, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1096 
	.line	474; "enerjar.c"	for(i = 0; i < MOVING_AVG_SIZE; ++i) {
	BANKSEL	r0x1069
	CLRF	r0x1069
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1097 
	CLRF	r0x106A
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=2
;; 	line = 9891 result AOP_REG=r0x1098, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1098 
	CLRF	r0x106B
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1099 
	CLRF	r0x106C
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;signed compare: left < lit(0x5=5), size=2, mask=ffff
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1097 
_00322_DS_
	BANKSEL	r0x106A
	MOVF	r0x106A,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3958:genCmp
	ADDLW	0x80
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3959:genCmp
	ADDLW	0x80
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=45, label offset 199
	GOTO	_00344_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x05
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1096 
	SUBWF	r0x1069,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00344_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=21, label offset 199
	GOTO	_00320_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	813
;;	aopForRemat 598
;;	619: rname _moving_avg, val 0, const = 0
;;	908 register type nRegs=2
;;	908 register type nRegs=2
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_moving_avg
;; 	line = 766 result AOP_REG=r0x109A, size=2, left AOP_PCODE=_moving_avg, size=2, right AOP_REG=r0x1098, size=2
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_moving_avg
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1435 rIdx = r0x1098 
	.line	475; "enerjar.c"	moving_avg[i] = 0;
	BANKSEL	r0x106B
	MOVF	r0x106B,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:937:genPlus
	ADDLW	(_moving_avg + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x109A 
	MOVWF	r0x106D
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:975:genPlus
	MOVLW	high (_moving_avg + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:976:genPlus
;;	1435 rIdx = r0x109B 
	MOVWF	r0x106E
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1435 rIdx = r0x1099 
	MOVF	r0x106C,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1435 rIdx = r0x1099 
	INCFSZ	r0x106C,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1435 rIdx = r0x109B 
	ADDWF	r0x106E,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9637:genPointerSet *{*
;; ***	genPointerSet  9638
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9333:genNearPointerSet *{*
;; ***	genNearPointerSet  9334
;;	908 register type nRegs=2
;; ***	genNearPointerSet  9351
;; 	line = 9353 result AOP_REG=r0x109A, size=2, left -=-, size=0, right AOP_LIT=0x00, size=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x109A 
	MOVF	r0x106D,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x106E,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  9377
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9384:genNearPointerSet
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9394:genNearPointerSet
	INCF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9384:genNearPointerSet
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9394:genNearPointerSet
	INCF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9384:genNearPointerSet
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9394:genNearPointerSet
	INCF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9384:genNearPointerSet
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  9399
;; ***	genNearPointerSet  9410
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9417:genNearPointerSet
	DECF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9417:genNearPointerSet
	DECF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9417:genNearPointerSet
	DECF	FSR,F
;; ***	genNearPointerSet  9421
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	908 register type nRegs=2
;;	778
;; 	line = 766 result AOP_REG=r0x1098, size=2, left AOP_REG=r0x1098, size=2, right AOP_LIT=0x04, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  217
;; ***	pic14_getDataSize  1921
;;	adding lit to something. size 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:426:genAddLit *{*
;; ***	genAddLit  427
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; hi = 0	genAddLit  451
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:467:genAddLit
	.line	474; "enerjar.c"	for(i = 0; i < MOVING_AVG_SIZE; ++i) {
	MOVLW	0x04
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:468:genAddLit
;;	1435 rIdx = r0x1098 
	ADDWF	r0x106B,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:469:genAddLit
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:470:genAddLit
;;	1435 rIdx = r0x1099 
	INCF	r0x106C,F
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	908 register type nRegs=2
;;	778
;; 	line = 766 result AOP_REG=r0x1096, size=2, left AOP_REG=r0x1096, size=2, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1435 rIdx = r0x1096 
	INCF	r0x1069,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1435 rIdx = r0x1097 
	INCF	r0x106A,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=23, label offset 199
	GOTO	_00322_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
_00320_DS_
	.line	483; "enerjar.c"	init_data();
	CALL	_init_data
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	484; "enerjar.c"	mode = read_mode();
	CALL	_read_mode
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1096, size=1, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1096 
	BANKSEL	r0x1069
	MOVWF	r0x1069
;; 	2671 left AOP_REG
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	485; "enerjar.c"	sweep = read_sweep();
	CALL	_read_sweep
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x1097, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1097 
	.line	489; "enerjar.c"	neg = 0;
	BANKSEL	r0x106A
	CLRF	r0x106A
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
_00306_DS_
	.line	492; "enerjar.c"	init_data();
	CALL	_init_data
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	493; "enerjar.c"	get_data();
	CALL	_get_data
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;; ***	aopForSym 509
;;	520 sym->rname = _voltage, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1313
;;	1329  _reference   offset=1
	.line	494; "enerjar.c"	if(voltage < reference) {
	BANKSEL	_reference
	MOVF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1313
;;	1329  _voltage   offset=1
	BANKSEL	_voltage
	SUBWF	(_voltage + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=46, label offset 199
	GOTO	_00345_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1313
;;	1329  _reference   offset=0
	BANKSEL	_reference
	MOVF	_reference,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1313
;;	1329  _voltage   offset=0
	BANKSEL	_voltage
	SUBWF	_voltage,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00345_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=4, label offset 199
	GOTO	_00303_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x1097, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	495; "enerjar.c"	neg = 1;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1435 rIdx = r0x1097 
	BANKSEL	r0x106A
	MOVWF	r0x106A
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=7, label offset 199
	GOTO	_00306_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9707:genIfx *{*
;; ***	genIfx  9708
;;	908 register type nRegs=1
;; ***	pic14_toBoolean  1995
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2005:pic14_toBoolean
_00303_DS_
	.line	496; "enerjar.c"	} else if (neg) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2016:pic14_toBoolean
;;	1435 rIdx = r0x1097 
	BANKSEL	r0x106A
	IORWF	r0x106A,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9756:genIfx
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9757:genIfx
;; ***	popGetLabel  key=7, label offset 199
	GOTO	_00306_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=2
;; 	line = 9891 result AOP_REG=r0x1098, size=2, left -=-, size=0, right AOP_LIT=0x01, size=2
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	502; "enerjar.c"	for(i = 1; i < 256; ++i) {
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1435 rIdx = r0x1098 
	MOVWF	r0x106B
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1099 
	CLRF	r0x106C
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;signed compare: left < lit(0x100=256), size=2, mask=ffff
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1099 
_00326_DS_
	BANKSEL	r0x106C
	MOVF	r0x106C,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3958:genCmp
	ADDLW	0x80
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3959:genCmp
	ADDLW	0x7f
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=47, label offset 199
	GOTO	_00346_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1098 
	SUBWF	r0x106B,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00346_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=30, label offset 199
	GOTO	_00329_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	503; "enerjar.c"	get_data();
	CALL	_get_data
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;;	908 register type nRegs=2
;; 	line = 5437 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1098, size=2, right AOP_LIT=0x04, size=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5329:isLiteralBit *{*
;; ***	isLiteralBit  5330
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5506:genAnd
	.line	513; "enerjar.c"	if(i & 4) {
	BANKSEL	r0x106B
	BTFSS	r0x106B,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5507:genAnd
;; ***	popGetLabel  key=29, label offset 199
	GOTO	_00328_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;;	908 register type nRegs=2
;;	908 register type nRegs=1
;; 	line = 10211 result AOP_REG=r0x1097, size=1, left -=-, size=0, right AOP_REG=r0x1098, size=2
;; ***	genCast  10317
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10337:genCast
;;	1435 rIdx = r0x1098 
	.line	514; "enerjar.c"	neg = i;
	MOVF	r0x106B,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10338:genCast
;;	1435 rIdx = r0x1097 
	MOVWF	r0x106A
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8193:genGenericShift *{*
;; ***	genGenericShift  8197
;;	908 register type nRegs=1
;;	778
;shiftRight_Left2ResultLit:6962: shCount=1, size=1, sign=0, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	.line	515; "enerjar.c"	neg >>= 3;
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1097 
	RRF	r0x106A,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=1, sign=0, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1097 
	RRF	r0x106A,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=1, sign=0, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1097 
	RRF	r0x106A,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;;	778
;;	778
;; 	line = 5437 result AOP_REG=r0x1097, size=1, left AOP_REG=r0x1097, size=1, right AOP_LIT=0x03, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5585:genAnd
	.line	516; "enerjar.c"	neg = neg & 0x03;
	MOVLW	0x03
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5587:genAnd
;;	1435 rIdx = r0x1097 
	ANDWF	r0x106A,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	908 register type nRegs=1
;;	778
;; 	line = 766 result AOP_REG=r0x1097, size=1, left AOP_REG=r0x1097, size=1, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1435 rIdx = r0x1097 
	.line	517; "enerjar.c"	neg += 1;
	INCF	r0x106A,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=1
;;	908 register type nRegs=1
;; 	2612 left AOP_REG
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1097 
	.line	518; "enerjar.c"	disp_dig(neg);
	MOVF	r0x106A,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_dig
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	908 register type nRegs=2
;;	778
;; 	line = 766 result AOP_REG=r0x1098, size=2, left AOP_REG=r0x1098, size=2, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1435 rIdx = r0x1098 
_00328_DS_
	.line	502; "enerjar.c"	for(i = 1; i < 256; ++i) {
	BANKSEL	r0x106B
	INCF	r0x106B,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1435 rIdx = r0x1099 
	INCF	r0x106C,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=27, label offset 199
	GOTO	_00326_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
_00329_DS_
	.line	523; "enerjar.c"	analysis();
	CALL	_analysis
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4702:genCmpGt *{*
;; ***	genCmpGt  4703
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x7=7), size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	.line	530; "enerjar.c"	switch (mode) {
	MOVLW	0x07
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x1096 
	BANKSEL	r0x1069
	SUBWF	r0x1069,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=18, label offset 199
	GOTO	_00317_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10022:genJumpTab *{*
;; ***	genJumpTab  10023
;;	908 register type nRegs=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10038:genJumpTab
;; ***	popGetLabel  key=49, label offset 199
	MOVLW	HIGH(_00348_DS_)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10039:genJumpTab
	MOVWF	PCLATH
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10040:genJumpTab
;; ***	popGetLabel  key=49, label offset 199
	MOVLW	_00348_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10041:genJumpTab
;;	1435 rIdx = r0x1096 
	ADDWF	r0x1069,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10042:genJumpTab
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10043:genJumpTab
	INCF	PCLATH,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10044:genJumpTab
	BANKSEL	PCL
	MOVWF	PCL
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=11, label offset 199
_00348_DS_
	GOTO	_00310_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=12, label offset 199
	GOTO	_00311_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=13, label offset 199
	GOTO	_00312_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=14, label offset 199
	GOTO	_00313_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=15, label offset 199
	GOTO	_00314_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=16, label offset 199
	GOTO	_00315_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10053:genJumpTab
;; ***	popGetLabel  key=17, label offset 199
	GOTO	_00316_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode1, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode1, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=0
_00310_DS_
	.line	532; "enerjar.c"	disp_set_num(mode1);
	BANKSEL	_mode1
	MOVF	_mode1,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=1
	MOVF	(_mode1 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=2
	MOVF	(_mode1 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=3
	MOVF	(_mode1 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	533; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode2, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode2, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=0
_00311_DS_
	.line	535; "enerjar.c"	disp_set_num(mode2);
	BANKSEL	_mode2
	MOVF	_mode2,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=1
	MOVF	(_mode2 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=2
	MOVF	(_mode2 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=3
	MOVF	(_mode2 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	536; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode3, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode3, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1327  _mode3   offset=0 - had to alloc by reg name
_00312_DS_
	.line	538; "enerjar.c"	disp_set_num(mode3);
	BANKSEL	_mode3
	MOVF	_mode3,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode3   offset=1
	MOVF	(_mode3 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode3   offset=2
	MOVF	(_mode3 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode3   offset=3
	MOVF	(_mode3 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	539; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode4, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode4, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode4   offset=0
_00313_DS_
	.line	541; "enerjar.c"	disp_set_num(mode4);
	BANKSEL	_mode4
	MOVF	_mode4,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode4   offset=1
	MOVF	(_mode4 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode4   offset=2
	MOVF	(_mode4 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode4   offset=3
	MOVF	(_mode4 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	542; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode5, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode5, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1327  _mode5   offset=0 - had to alloc by reg name
_00314_DS_
	.line	544; "enerjar.c"	disp_set_num(mode5);
	BANKSEL	_mode5
	MOVF	_mode5,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode5   offset=1
	MOVF	(_mode5 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode5   offset=2
	MOVF	(_mode5 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode5   offset=3
	MOVF	(_mode5 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	545; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode6, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode6, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode6   offset=0
_00315_DS_
	.line	547; "enerjar.c"	disp_set_num(mode6);
	BANKSEL	_mode6
	MOVF	_mode6,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode6   offset=1
	MOVF	(_mode6 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode6   offset=2
	MOVF	(_mode6 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode6   offset=3
	MOVF	(_mode6 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	548; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode7, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode7, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode7   offset=0
_00316_DS_
	.line	550; "enerjar.c"	disp_set_num(mode7);
	BANKSEL	_mode7
	MOVF	_mode7,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode7   offset=1
	MOVF	(_mode7 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode7   offset=2
	MOVF	(_mode7 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode7   offset=3
	MOVF	(_mode7 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=19, label offset 199
	.line	551; "enerjar.c"	break;
	GOTO	_00318_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=0
_00317_DS_
	.line	553; "enerjar.c"	disp_set_num(mode8);
	BANKSEL	_mode8
	MOVF	_mode8,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=1
	MOVF	(_mode8 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=2
	MOVF	(_mode8 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=3
	MOVF	(_mode8 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
_00318_DS_
	.line	558; "enerjar.c"	disp_kilo();
	CALL	_disp_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 199
	GOTO	_00320_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;entry:  _analysis	;Function start
; 2 exit points
;has an exit
;functions called:
;   __divulong
;   __mulchar
;   __divulong
;   __mullong
;   __divulong
;   __divulong
;   __mulchar
;   __divulong
;   __mullong
;   __divulong
;13 compiler assigned registers:
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;   STK00
;   r0x106F
;   r0x1070
;   r0x1071
;   r0x1072
;   r0x1073
;   r0x1074
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=166previous max_key=16 
_analysis	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _total_cnt, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _total1, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _total_cnt, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total_cnt   offset=0
	.line	426; "enerjar.c"	mode8 = total1/total_cnt;
	BANKSEL	_total_cnt
	MOVF	_total_cnt,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total_cnt   offset=1
	MOVF	(_total_cnt + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total_cnt   offset=2
	MOVF	(_total_cnt + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total_cnt   offset=3
	MOVF	(_total_cnt + 3),W
;; ***	aopForSym 509
;;	520 sym->rname = _total1, size = 4
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total1   offset=0
	BANKSEL	_total1
	MOVF	_total1,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total1   offset=1
	MOVF	(_total1 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total1   offset=2
	MOVF	(_total1 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _total1   offset=3
	MOVF	(_total1 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_mode8, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=3
	BANKSEL	_mode8
	MOVWF	(_mode8 + 3)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=2
	MOVWF	(_mode8 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=1
	MOVWF	(_mode8 + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=0
	MOVWF	_mode8
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4702:genCmpGt *{*
;; ***	genCmpGt  4703
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;swapping arguments (AOP_TYPEs 1/3)
;unsigned compare: left >= lit(0x989681=10000001), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	.line	427; "enerjar.c"	if(mode8 > 10000000) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1313
;;	1329  _mode8   offset=3
	SUBWF	(_mode8 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=9, label offset 186
	GOTO	_00295_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x98
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1313
;;	1329  _mode8   offset=2
	SUBWF	(_mode8 + 2),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=9, label offset 186
	GOTO	_00295_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x96
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1313
;;	1329  _mode8   offset=1
	SUBWF	(_mode8 + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=9, label offset 186
	GOTO	_00295_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x81
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1313
;;	1329  _mode8   offset=0
	SUBWF	_mode8,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3691:genSkipc
_00295_DS_
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=2, label offset 186
	GOTO	_00288_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; 	line = 9891 result AOP_DIR=_mode8, size=4, left -=-, size=0, right AOP_LIT=0x00, size=4
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _mode8   offset=0
	.line	428; "enerjar.c"	mode8 = 0;
	BANKSEL	_mode8
	CLRF	_mode8
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _mode8   offset=1
	CLRF	(_mode8 + 1)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _mode8   offset=2
	CLRF	(_mode8 + 2)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _mode8   offset=3
	CLRF	(_mode8 + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode7, size = 4
;; 	line = 9891 result AOP_DIR=_mode7, size=4, left -=-, size=0, right AOP_DIR=_mode8, size=4
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=0
_00288_DS_
	.line	430; "enerjar.c"	mode7 = mode8;
	BANKSEL	_mode8
	MOVF	_mode8,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1313
;;	1329  _mode7   offset=0
	BANKSEL	_mode7
	MOVWF	_mode7
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=1
	BANKSEL	_mode8
	MOVF	(_mode8 + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1313
;;	1329  _mode7   offset=1
	BANKSEL	_mode7
	MOVWF	(_mode7 + 1)
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=2
	BANKSEL	_mode8
	MOVF	(_mode8 + 2),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1313
;;	1329  _mode7   offset=2
	BANKSEL	_mode7
	MOVWF	(_mode7 + 2)
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=3
	BANKSEL	_mode8
	MOVF	(_mode8 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1313
;;	1329  _mode7   offset=3
	BANKSEL	_mode7
	MOVWF	(_mode7 + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;; ***	aopForSym 509
;;	520 sym->rname = _moving_avg_i, size = 1
;; 	line = 766 result AOP_DIR=_moving_avg_i, size=1, left AOP_DIR=_moving_avg_i, size=1, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_DIR, left AOP_DIR, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1313
;;	1329  _moving_avg_i   offset=0
	.line	439; "enerjar.c"	++moving_avg_i;
	BANKSEL	_moving_avg_i
	INCF	_moving_avg_i,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;; ***	aopForSym 509
;;	520 sym->rname = _moving_avg_i, size = 1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0x5=5), size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	.line	440; "enerjar.c"	if(moving_avg_i >= MOVING_AVG_SIZE) {
	MOVLW	0x05
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1313
;;	1329  _moving_avg_i   offset=0
	.line	441; "enerjar.c"	moving_avg_i = 0;
	SUBWF	_moving_avg_i,W
	.line	443; "enerjar.c"	moving_avg_total -= moving_avg[moving_avg_i];
	BTFSC	STATUS,0
	CLRF	_moving_avg_i
	MOVLW	0x04
	MOVWF	STK00
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _moving_avg_i   offset=0
	MOVF	_moving_avg_i,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1837:call_libraryfunc
	PAGESEL	__mulchar
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1839:call_libraryfunc
	CALL	__mulchar
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1841:call_libraryfunc
	PAGESEL	$
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x108F 
	BANKSEL	r0x106F
	MOVWF	r0x106F
	ADDLW	(_moving_avg + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x108F 
	MOVWF	r0x106F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1003:genPlus
	MOVLW	high (_moving_avg + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1004:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1005:genPlus
	ADDLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1006:genPlus
;;	1435 rIdx = r0x1090 
	MOVWF	r0x1070
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8996:genPointerGet *{*
;; ***	genPointerGet  8997
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8599:genNearPointerGet *{*
;; ***	genNearPointerGet  8600
;;	908 register type nRegs=2
;; ***	genNearPointerGet  8616
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x108F 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x1070,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  8644
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1435 rIdx = r0x1091 
	MOVWF	r0x1071
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8657:genNearPointerGet
	INCF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1435 rIdx = r0x1092 
	MOVWF	r0x1072
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8657:genNearPointerGet
	INCF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1435 rIdx = r0x1093 
	MOVWF	r0x1073
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8657:genNearPointerGet
	INCF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1435 rIdx = r0x1094 
	MOVWF	r0x1074
;; ***	genNearPointerGet  8673
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8680:genNearPointerGet
	DECF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8680:genNearPointerGet
	DECF	FSR,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8680:genNearPointerGet
	DECF	FSR,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;; ***	aopForSym 509
;;	520 sym->rname = _moving_avg_total, size = 4
;;	908 register type nRegs=4
;;	778
;; 	result AOP_DIR, left AOP_DIR, right AOP_REG
;; ***	pic14_getDataSize  1921
;; 	line 1437 result AOP_DIR, left AOP_DIR, right AOP_REG
;; ***	genMinus  1456
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1458:genMinus
;;	1435 rIdx = r0x1091 
	MOVF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1461:genMinus
;;	1313
;;	1329  _moving_avg_total   offset=0
	BANKSEL	_moving_avg_total
	SUBWF	_moving_avg_total,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1435 rIdx = r0x1092 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1435 rIdx = r0x1092 
	INCF	r0x1072,W
	BTFSC	STATUS,2
	GOTO	_00001_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _moving_avg_total   offset=1
	BANKSEL	_moving_avg_total
	SUBWF	(_moving_avg_total + 1),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1435 rIdx = r0x1093 
_00001_DS_
	BANKSEL	r0x1073
	MOVF	r0x1073,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1435 rIdx = r0x1093 
	INCF	r0x1073,W
	BTFSC	STATUS,2
	GOTO	_00002_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _moving_avg_total   offset=2
	BANKSEL	_moving_avg_total
	SUBWF	(_moving_avg_total + 2),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1435 rIdx = r0x1094 
_00002_DS_
	BANKSEL	r0x1074
	MOVF	r0x1074,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1435 rIdx = r0x1094 
	INCF	r0x1074,W
	BTFSC	STATUS,2
	GOTO	_00003_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _moving_avg_total   offset=3
	BANKSEL	_moving_avg_total
	SUBWF	(_moving_avg_total + 3),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;; ***	aopForSym 509
;;	520 sym->rname = _moving_avg_total, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;;	778
;; 	line = 766 result AOP_DIR=_moving_avg_total, size=4, left AOP_DIR=_moving_avg_total, size=4, right AOP_DIR=_mode8, size=4
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1313
;;	1329  _mode8   offset=0
_00003_DS_
	.line	444; "enerjar.c"	moving_avg_total += mode8;
	BANKSEL	_mode8
	MOVF	_mode8,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:931:genPlus
;;	1313
;;	1329  _moving_avg_total   offset=0
	BANKSEL	_moving_avg_total
	ADDWF	_moving_avg_total,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1313
;;	1329  _mode8   offset=1
	BANKSEL	_mode8
	MOVF	(_mode8 + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1313
;;	1329  _mode8   offset=1
	INCF	(_mode8 + 1),W
	BTFSC	STATUS,2
	GOTO	_00004_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1313
;;	1329  _moving_avg_total   offset=1
	BANKSEL	_moving_avg_total
	ADDWF	(_moving_avg_total + 1),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1313
;;	1329  _mode8   offset=2
_00004_DS_
	BANKSEL	_mode8
	MOVF	(_mode8 + 2),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1313
;;	1329  _mode8   offset=2
	INCF	(_mode8 + 2),W
	BTFSC	STATUS,2
	GOTO	_00005_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1313
;;	1329  _moving_avg_total   offset=2
	BANKSEL	_moving_avg_total
	ADDWF	(_moving_avg_total + 2),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1313
;;	1329  _mode8   offset=3
_00005_DS_
	BANKSEL	_mode8
	MOVF	(_mode8 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1313
;;	1329  _mode8   offset=3
	INCF	(_mode8 + 3),W
	BTFSC	STATUS,2
	GOTO	_00006_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1313
;;	1329  _moving_avg_total   offset=3
	BANKSEL	_moving_avg_total
	ADDWF	(_moving_avg_total + 3),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9637:genPointerSet *{*
;; ***	genPointerSet  9638
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9333:genNearPointerSet *{*
;; ***	genNearPointerSet  9334
;;	908 register type nRegs=2
;; ***	genNearPointerSet  9351
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; 	line = 9353 result AOP_REG=r0x108F, size=2, left -=-, size=0, right AOP_DIR=_mode8, size=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x108F 
_00006_DS_
	.line	445; "enerjar.c"	moving_avg[moving_avg_i] = mode8;
	BANKSEL	r0x106F
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x1070,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  9377
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9386:genNearPointerSet
;;	1313
;;	1329  _mode8   offset=0
	BANKSEL	_mode8
	MOVF	_mode8,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9394:genNearPointerSet
	INCF	FSR,F
;;	oops AOP_DIR did this (_mode8 + 1)

; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9386:genNearPointerSet
;;	1313
;;	1329  _mode8   offset=1
	MOVF	(_mode8 + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9394:genNearPointerSet
	INCF	FSR,F
;;	oops AOP_DIR did this (_mode8 + 2)

; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9386:genNearPointerSet
;;	1313
;;	1329  _mode8   offset=2
	MOVF	(_mode8 + 2),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9394:genNearPointerSet
	INCF	FSR,F
;;	oops AOP_DIR did this (_mode8 + 3)

; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9386:genNearPointerSet
;;	1313
;;	1329  _mode8   offset=3
	MOVF	(_mode8 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  9399
;; ***	genNearPointerSet  9410
;; ***	genNearPointerSet  9421
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _moving_avg_total, size = 4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	446; "enerjar.c"	mode8 = moving_avg_total / MOVING_AVG_SIZE;
	MOVLW	0x05
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; ***	aopForSym 509
;;	520 sym->rname = _moving_avg_total, size = 4
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _moving_avg_total   offset=0
	BANKSEL	_moving_avg_total
	MOVF	_moving_avg_total,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _moving_avg_total   offset=1
	MOVF	(_moving_avg_total + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _moving_avg_total   offset=2
	MOVF	(_moving_avg_total + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _moving_avg_total   offset=3
	MOVF	(_moving_avg_total + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_mode8, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=3
	BANKSEL	_mode8
	MOVWF	(_mode8 + 3)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=2
	MOVWF	(_mode8 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=1
	MOVWF	(_mode8 + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=0
	MOVWF	_mode8
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=0
	.line	448; "enerjar.c"	mode8 *= 1000;
	MOVF	_mode8,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=1
	MOVF	(_mode8 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=2
	MOVF	(_mode8 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=3
	MOVF	(_mode8 + 3),W
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0xe8
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x03
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__mullong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__mullong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_mode8, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=3
	BANKSEL	_mode8
	MOVWF	(_mode8 + 3)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=2
	MOVWF	(_mode8 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=1
	MOVWF	(_mode8 + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=0
	MOVWF	_mode8
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	449; "enerjar.c"	mode8 /= CALIBRATION_SCALE;
	MOVLW	0x87
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x06
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=0
	MOVF	_mode8,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=1
	MOVF	(_mode8 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=2
	MOVF	(_mode8 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode8   offset=3
	MOVF	(_mode8 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_mode8, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=3
	BANKSEL	_mode8
	MOVWF	(_mode8 + 3)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=2
	MOVWF	(_mode8 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=1
	MOVWF	(_mode8 + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode8   offset=0
	MOVWF	_mode8
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;; ***	aopForSym 509
;;	520 sym->rname = _mode8, size = 4
;;	778
;; 	line = 766 result AOP_DIR=_mode8, size=4, left AOP_DIR=_mode8, size=4, right AOP_LIT=0xdd, size=4
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_DIR, left AOP_DIR, right AOP_LIT
;; 	genPlusIncr  217
;; ***	pic14_getDataSize  1921
;;	adding lit to something. size 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:426:genAddLit *{*
;; ***	genAddLit  427
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;;  add lit to long	genAddLit  559
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:614:genAddLit
	.line	450; "enerjar.c"	mode8 += CALIBRATION_OFFSET;
	MOVLW	0xdd
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:615:genAddLit
;;	1313
;;	1329  _mode8   offset=0
	ADDWF	_mode8,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:585:genAddLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:589:genAddLit
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:590:genAddLit
;;	1313
;;	1329  _mode8   offset=1
	ADDWF	(_mode8 + 1),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:585:genAddLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:589:genAddLit
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:590:genAddLit
;;	1313
;;	1329  _mode8   offset=2
	ADDWF	(_mode8 + 2),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:585:genAddLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:589:genAddLit
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:590:genAddLit
;;	1313
;;	1329  _mode8   offset=3
	ADDWF	(_mode8 + 3),F
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _analysis
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _get_data	;Function start
; 2 exit points
;has an exit
;functions called:
;   _adc_set_port_config
;   _adc_set_channel
;   _delay
;   _adc_start
;   _adc_wait
;   _adc_set_channel
;   _adc_read_int
;   _adc_wait
;   _adc_set_channel
;   _adc_read_int
;   _adc_wait
;   _adc_read_int
;   __mullong
;   __mulint
;   _adc_set_port_config
;   _adc_set_channel
;   _delay
;   _adc_start
;   _adc_wait
;   _adc_set_channel
;   _adc_read_int
;   _adc_wait
;   _adc_set_channel
;   _adc_read_int
;   _adc_wait
;   _adc_read_int
;   __mullong
;   __mulint
;10 compiler assigned registers:
;   STK00
;   r0x106F
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;   r0x1070
;   r0x1071
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=162previous max_key=0 
_get_data	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	345; "enerjar.c"	adc_set_port_config(BIN(1000));
	MOVLW	0x08
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_port_config
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	348; "enerjar.c"	adc_set_channel(0);
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_channel
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	351; "enerjar.c"	delay(10);
	MOVLW	0x0a
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_delay
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	353; "enerjar.c"	adc_start();
	CALL	_adc_start
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	355; "enerjar.c"	adc_wait();
	CALL	_adc_wait
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	357; "enerjar.c"	adc_set_channel(1);
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_channel
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	361; "enerjar.c"	voltage = adc_read_int();
	CALL	_adc_read_int
;; ***	aopForSym 509
;;	520 sym->rname = _voltage, size = 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_voltage, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _voltage   offset=1
	BANKSEL	_voltage
	MOVWF	(_voltage + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _voltage   offset=0
	MOVWF	_voltage
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _ADCON0, size = 1
;; 	line = 9891 result AOP_DIR=_ADCON0, size=1, left -=-, size=0, right AOP_LIT=0x8d, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	365; "enerjar.c"	ADCON0 = BIN(10001101);
	MOVLW	0x8d
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _ADCON0   offset=0
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	366; "enerjar.c"	adc_wait();
	CALL	_adc_wait
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	368; "enerjar.c"	adc_set_channel(4);
	MOVLW	0x04
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_channel
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	371; "enerjar.c"	reference = adc_read_int();
	CALL	_adc_read_int
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_reference, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	MOVWF	(_reference + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _reference   offset=0
	MOVWF	_reference
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _ADCON0, size = 1
;; 	line = 9891 result AOP_DIR=_ADCON0, size=1, left -=-, size=0, right AOP_LIT=0xa5, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	373; "enerjar.c"	ADCON0 = BIN(10100101);
	MOVLW	0xa5
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _ADCON0   offset=0
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	375; "enerjar.c"	adc_wait();
	CALL	_adc_wait
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	377; "enerjar.c"	current = adc_read_int();
	CALL	_adc_read_int
;; ***	aopForSym 509
;;	520 sym->rname = _current, size = 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_current, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _current   offset=1
	BANKSEL	_current
	MOVWF	(_current + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _current   offset=0
	MOVWF	_current
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x1088, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1088 
	.line	384; "enerjar.c"	neg = 0;
	BANKSEL	r0x106F
	CLRF	r0x106F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4702:genCmpGt *{*
;; ***	genCmpGt  4703
;; ***	aopForSym 509
;;	520 sym->rname = _current, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1313
;;	1329  _current   offset=1
	.line	394; "enerjar.c"	if(current > reference) {
	BANKSEL	_current
	MOVF	(_current + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	SUBWF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=15, label offset 166
	GOTO	_00281_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1313
;;	1329  _current   offset=0
	BANKSEL	_current
	MOVF	_current,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1313
;;	1329  _reference   offset=0
	BANKSEL	_reference
	SUBWF	_reference,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00281_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=2, label offset 166
	GOTO	_00268_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;; ***	aopForSym 509
;;	520 sym->rname = _current, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _current_diff, size = 2
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; 	line 1437 result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	genMinus  1456
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1458:genMinus
;;	1313
;;	1329  _reference   offset=0
	.line	395; "enerjar.c"	current_diff = current - reference;
	BANKSEL	_reference
	MOVF	_reference,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1467:genMinus
;;	1313
;;	1329  _current   offset=0
	BANKSEL	_current
	SUBWF	_current,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1475:genMinus
;;	1313
;;	1329  _current_diff   offset=0
	BANKSEL	_current_diff
	MOVWF	_current_diff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1503:genMinus
;;	1313
;;	1329  _current   offset=1
	BANKSEL	_current
	MOVF	(_current + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1504:genMinus
;;	1313
;;	1329  _current_diff   offset=1
	BANKSEL	_current_diff
	MOVWF	(_current_diff + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	MOVF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _reference   offset=1
	INCF	(_reference + 1),W
	BTFSC	STATUS,2
	GOTO	_00007_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _current_diff   offset=1
	BANKSEL	_current_diff
	SUBWF	(_current_diff + 1),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=3, label offset 166
_00007_DS_
	GOTO	_00269_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _current, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _current_diff, size = 2
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; 	line 1437 result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	genMinus  1456
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1458:genMinus
;;	1313
;;	1329  _current   offset=0
_00268_DS_
	.line	397; "enerjar.c"	current_diff = reference - current;
	BANKSEL	_current
	MOVF	_current,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1467:genMinus
;;	1313
;;	1329  _reference   offset=0
	BANKSEL	_reference
	SUBWF	_reference,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1475:genMinus
;;	1313
;;	1329  _current_diff   offset=0
	BANKSEL	_current_diff
	MOVWF	_current_diff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1503:genMinus
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	MOVF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1504:genMinus
;;	1313
;;	1329  _current_diff   offset=1
	BANKSEL	_current_diff
	MOVWF	(_current_diff + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _current   offset=1
	BANKSEL	_current
	MOVF	(_current + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _current   offset=1
	INCF	(_current + 1),W
	BTFSC	STATUS,2
	GOTO	_00008_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _current_diff   offset=1
	BANKSEL	_current_diff
	SUBWF	(_current_diff + 1),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x1088, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
_00008_DS_
	.line	398; "enerjar.c"	neg = 1;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1435 rIdx = r0x1088 
	BANKSEL	r0x106F
	MOVWF	r0x106F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4702:genCmpGt *{*
;; ***	genCmpGt  4703
;; ***	aopForSym 509
;;	520 sym->rname = _voltage, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1313
;;	1329  _voltage   offset=1
_00269_DS_
	.line	401; "enerjar.c"	if(voltage > reference) {
	BANKSEL	_voltage
	MOVF	(_voltage + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	SUBWF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=16, label offset 166
	GOTO	_00282_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1313
;;	1329  _voltage   offset=0
	BANKSEL	_voltage
	MOVF	_voltage,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1313
;;	1329  _reference   offset=0
	BANKSEL	_reference
	SUBWF	_reference,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00282_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=5, label offset 166
	GOTO	_00271_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;; ***	aopForSym 509
;;	520 sym->rname = _voltage, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _voltage_diff, size = 2
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; 	line 1437 result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	genMinus  1456
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1458:genMinus
;;	1313
;;	1329  _reference   offset=0
	.line	402; "enerjar.c"	voltage_diff = voltage - reference;
	BANKSEL	_reference
	MOVF	_reference,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1467:genMinus
;;	1313
;;	1329  _voltage   offset=0
	BANKSEL	_voltage
	SUBWF	_voltage,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1475:genMinus
;;	1313
;;	1329  _voltage_diff   offset=0
	BANKSEL	_voltage_diff
	MOVWF	_voltage_diff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1503:genMinus
;;	1313
;;	1329  _voltage   offset=1
	BANKSEL	_voltage
	MOVF	(_voltage + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1504:genMinus
;;	1313
;;	1329  _voltage_diff   offset=1
	BANKSEL	_voltage_diff
	MOVWF	(_voltage_diff + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	MOVF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _reference   offset=1
	INCF	(_reference + 1),W
	BTFSC	STATUS,2
	GOTO	_00009_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _voltage_diff   offset=1
	BANKSEL	_voltage_diff
	SUBWF	(_voltage_diff + 1),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=6, label offset 166
_00009_DS_
	GOTO	_00272_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;; ***	aopForSym 509
;;	520 sym->rname = _reference, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _voltage, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _voltage_diff, size = 2
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; 	line 1437 result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	genMinus  1456
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1458:genMinus
;;	1313
;;	1329  _voltage   offset=0
_00271_DS_
	.line	404; "enerjar.c"	voltage_diff = reference - voltage;
	BANKSEL	_voltage
	MOVF	_voltage,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1467:genMinus
;;	1313
;;	1329  _reference   offset=0
	BANKSEL	_reference
	SUBWF	_reference,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1475:genMinus
;;	1313
;;	1329  _voltage_diff   offset=0
	BANKSEL	_voltage_diff
	MOVWF	_voltage_diff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1503:genMinus
;;	1313
;;	1329  _reference   offset=1
	BANKSEL	_reference
	MOVF	(_reference + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1504:genMinus
;;	1313
;;	1329  _voltage_diff   offset=1
	BANKSEL	_voltage_diff
	MOVWF	(_voltage_diff + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _voltage   offset=1
	BANKSEL	_voltage
	MOVF	(_voltage + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _voltage   offset=1
	INCF	(_voltage + 1),W
	BTFSC	STATUS,2
	GOTO	_00010_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _voltage_diff   offset=1
	BANKSEL	_voltage_diff
	SUBWF	(_voltage_diff + 1),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5974:genXor *{*
;; ***	genXor  5975
;;	908 register type nRegs=1
;;	778
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6097:genXor
_00010_DS_
	.line	405; "enerjar.c"	neg ^= 1;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6098:genXor
;;	1435 rIdx = r0x1088 
	BANKSEL	r0x106F
	XORWF	r0x106F,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;; ***	aopForSym 509
;;	520 sym->rname = _current_diff, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _mode1, size = 4
;; 	line = 10211 result AOP_DIR=_mode1, size=4, left -=-, size=0, right AOP_DIR=_current_diff, size=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1313
;;	1329  _current_diff   offset=0
_00272_DS_
	.line	411; "enerjar.c"	mode1 = current_diff;
	BANKSEL	_current_diff
	MOVF	_current_diff,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1313
;;	1329  _mode1   offset=0
	BANKSEL	_mode1
	MOVWF	_mode1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1313
;;	1329  _current_diff   offset=1
	BANKSEL	_current_diff
	MOVF	(_current_diff + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1313
;;	1329  _mode1   offset=1
	BANKSEL	_mode1
	MOVWF	(_mode1 + 1)
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1313
;;	1329  _mode1   offset=2
	CLRF	(_mode1 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1313
;;	1329  _mode1   offset=3
	CLRF	(_mode1 + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;; ***	aopForSym 509
;;	520 sym->rname = _voltage_diff, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _mode2, size = 4
;; 	line = 10211 result AOP_DIR=_mode2, size=4, left -=-, size=0, right AOP_DIR=_voltage_diff, size=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1313
;;	1329  _voltage_diff   offset=0
	.line	412; "enerjar.c"	mode2 = voltage_diff;
	BANKSEL	_voltage_diff
	MOVF	_voltage_diff,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1313
;;	1329  _mode2   offset=0
	BANKSEL	_mode2
	MOVWF	_mode2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1313
;;	1329  _voltage_diff   offset=1
	BANKSEL	_voltage_diff
	MOVF	(_voltage_diff + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1313
;;	1329  _mode2   offset=1
	BANKSEL	_mode2
	MOVWF	(_mode2 + 1)
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1313
;;	1329  _mode2   offset=2
	CLRF	(_mode2 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1313
;;	1329  _mode2   offset=3
	CLRF	(_mode2 + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _mode2, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode1, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode2, size = 4
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=0
	.line	413; "enerjar.c"	mode4 = mode1 * mode2;
	MOVF	_mode2,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=1
	MOVF	(_mode2 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=2
	MOVF	(_mode2 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode2   offset=3
	MOVF	(_mode2 + 3),W
;; ***	aopForSym 509
;;	520 sym->rname = _mode1, size = 4
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=0
	BANKSEL	_mode1
	MOVF	_mode1,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=1
	MOVF	(_mode1 + 1),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=2
	MOVF	(_mode1 + 2),W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _mode1   offset=3
	MOVF	(_mode1 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__mullong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__mullong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; ***	aopForSym 509
;;	520 sym->rname = _mode4, size = 4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_DIR=_mode4, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode4   offset=3
	BANKSEL	_mode4
	MOVWF	(_mode4 + 3)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode4   offset=2
	MOVWF	(_mode4 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode4   offset=1
	MOVWF	(_mode4 + 1)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1313
;;	1329  _mode4   offset=0
	MOVWF	_mode4
;; 	2671 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; ***	aopForSym 509
;;	520 sym->rname = _voltage_diff, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _current_diff, size = 2
;; ***	aopForSym 509
;;	520 sym->rname = _voltage_diff, size = 2
;; 	2612 left AOP_DIR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _voltage_diff   offset=0
	.line	414; "enerjar.c"	mode6 = current_diff * voltage_diff;
	BANKSEL	_voltage_diff
	MOVF	_voltage_diff,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _voltage_diff   offset=1
	MOVF	(_voltage_diff + 1),W
;; ***	aopForSym 509
;;	520 sym->rname = _current_diff, size = 2
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _current_diff   offset=0
	BANKSEL	_current_diff
	MOVF	_current_diff,W
;; 	2612 left AOP_DIR
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _current_diff   offset=1
	MOVF	(_current_diff + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__mulint
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__mulint
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1089, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x108A 
	BANKSEL	r0x1070
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1089 
;;1	MOVWF	r0x1071
	BANKSEL	_mode6
	MOVWF	_mode6
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1435 rIdx = r0x108A 
	BANKSEL	r0x1070
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1313
;;	1329  _mode6   offset=1
	BANKSEL	_mode6
	MOVWF	(_mode6 + 1)
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1313
;;	1329  _mode6   offset=2
	CLRF	(_mode6 + 2)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1313
;;	1329  _mode6   offset=3
	CLRF	(_mode6 + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9707:genIfx *{*
;; ***	genIfx  9708
;;	908 register type nRegs=1
;; ***	pic14_toBoolean  1995
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2005:pic14_toBoolean
	.line	415; "enerjar.c"	if(neg) {
	BANKSEL	r0x106F
	MOVF	r0x106F,W
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9757:genIfx
;; ***	popGetLabel  key=8, label offset 166
	GOTO	_00274_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;; ***	aopForSym 509
;;	520 sym->rname = _total1, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode4, size = 4
;;	778
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; 	line 1437 result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	genMinus  1456
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1458:genMinus
;;	1313
;;	1329  _mode4   offset=0
	.line	416; "enerjar.c"	total1 = total1 - mode4;
	BANKSEL	_mode4
	MOVF	_mode4,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1461:genMinus
;;	1313
;;	1329  _total1   offset=0
	BANKSEL	_total1
	SUBWF	_total1,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _mode4   offset=1
	BANKSEL	_mode4
	MOVF	(_mode4 + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _mode4   offset=1
	INCF	(_mode4 + 1),W
	BTFSC	STATUS,2
	GOTO	_00011_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _total1   offset=1
	BANKSEL	_total1
	SUBWF	(_total1 + 1),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _mode4   offset=2
_00011_DS_
	BANKSEL	_mode4
	MOVF	(_mode4 + 2),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _mode4   offset=2
	INCF	(_mode4 + 2),W
	BTFSC	STATUS,2
	GOTO	_00012_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _total1   offset=2
	BANKSEL	_total1
	SUBWF	(_total1 + 2),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1506:genMinus
;;	1313
;;	1329  _mode4   offset=3
_00012_DS_
	BANKSEL	_mode4
	MOVF	(_mode4 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1507:genMinus
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1508:genMinus
;;	1313
;;	1329  _mode4   offset=3
	INCF	(_mode4 + 3),W
	BTFSC	STATUS,2
	GOTO	_00013_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1509:genMinus
;;	1313
;;	1329  _total1   offset=3
	BANKSEL	_total1
	SUBWF	(_total1 + 3),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=9, label offset 166
_00013_DS_
	GOTO	_00016_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;; ***	aopForSym 509
;;	520 sym->rname = _total1, size = 4
;; ***	aopForSym 509
;;	520 sym->rname = _mode4, size = 4
;;	778
;; 	line = 766 result AOP_DIR=_total1, size=4, left AOP_DIR=_total1, size=4, right AOP_DIR=_mode4, size=4
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_DIR, left AOP_DIR, right AOP_DIR
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1313
;;	1329  _mode4   offset=0
_00274_DS_
	.line	418; "enerjar.c"	total1 = total1 + mode4;
	BANKSEL	_mode4
	MOVF	_mode4,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:931:genPlus
;;	1313
;;	1329  _total1   offset=0
	BANKSEL	_total1
	ADDWF	_total1,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1313
;;	1329  _mode4   offset=1
	BANKSEL	_mode4
	MOVF	(_mode4 + 1),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1313
;;	1329  _mode4   offset=1
	INCF	(_mode4 + 1),W
	BTFSC	STATUS,2
	GOTO	_00014_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1313
;;	1329  _total1   offset=1
	BANKSEL	_total1
	ADDWF	(_total1 + 1),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1313
;;	1329  _mode4   offset=2
_00014_DS_
	BANKSEL	_mode4
	MOVF	(_mode4 + 2),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1313
;;	1329  _mode4   offset=2
	INCF	(_mode4 + 2),W
	BTFSC	STATUS,2
	GOTO	_00015_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1313
;;	1329  _total1   offset=2
	BANKSEL	_total1
	ADDWF	(_total1 + 2),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:978:genPlus
;;	1313
;;	1329  _mode4   offset=3
_00015_DS_
	BANKSEL	_mode4
	MOVF	(_mode4 + 3),W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:979:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:980:genPlus
;;	1313
;;	1329  _mode4   offset=3
	INCF	(_mode4 + 3),W
	BTFSC	STATUS,2
	GOTO	_00016_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:981:genPlus
;;	1313
;;	1329  _total1   offset=3
	BANKSEL	_total1
	ADDWF	(_total1 + 3),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;; ***	aopForSym 509
;;	520 sym->rname = _total_cnt, size = 4
;; 	line = 766 result AOP_DIR=_total_cnt, size=4, left AOP_DIR=_total_cnt, size=4, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_DIR, left AOP_DIR, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1313
;;	1329  _total_cnt   offset=0
_00016_DS_
	.line	421; "enerjar.c"	++total_cnt;
	BANKSEL	_total_cnt
	INCF	_total_cnt,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1313
;;	1329  _total_cnt   offset=1
	INCF	(_total_cnt + 1),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1313
;;	1329  _total_cnt   offset=2
	INCF	(_total_cnt + 2),F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1313
;;	1329  _total_cnt   offset=3
	INCF	(_total_cnt + 3),F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _get_data
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _read_mode	;Function start
; 2 exit points
;has an exit
;functions called:
;   _adc_set_port_config
;   _adc_set_channel
;   _delay
;   _adc_start
;   _adc_wait
;   _adc_set_port_config
;   _adc_set_channel
;   _delay
;   _adc_start
;   _adc_wait
;2 compiler assigned registers:
;   STK00
;   r0x106F
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=158previous max_key=0 
_read_mode	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	325; "enerjar.c"	adc_set_port_config(BIN(0000));
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_port_config
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	328; "enerjar.c"	adc_set_channel(6);
	MOVLW	0x06
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_channel
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	330; "enerjar.c"	delay(20);
	MOVLW	0x14
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_delay
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	332; "enerjar.c"	adc_start();
	CALL	_adc_start
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	334; "enerjar.c"	adc_wait();
	CALL	_adc_wait
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8193:genGenericShift *{*
;; ***	genGenericShift  8197
;; ***	aopForSym 509
;;	520 sym->rname = _ADRESH, size = 1
;;	908 register type nRegs=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6986:shiftRight_Left2ResultLit
;;	1313
;;	1329  _ADRESH   offset=0
	.line	336; "enerjar.c"	mode = ADRESH >> 5;
	BANKSEL	_ADRESH
	SWAPF	_ADRESH,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6987:shiftRight_Left2ResultLit
	ANDLW	0x0f
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6988:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107E 
	BANKSEL	r0x106F
	MOVWF	r0x106F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=1, sign=0, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107E 
	RRF	r0x106F,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3119:genRet *{*
;; ***	genRet  3121
;;	778
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x107E 
	.line	338; "enerjar.c"	return mode;
	MOVF	r0x106F,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _read_mode
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _read_sweep	;Function start
; 2 exit points
;has an exit
;functions called:
;   _adc_set_port_config
;   _adc_set_channel
;   _delay
;   _adc_start
;   _adc_wait
;   _adc_read_int
;   _adc_set_port_config
;   _adc_set_channel
;   _delay
;   _adc_start
;   _adc_wait
;   _adc_read_int
;4 compiler assigned registers:
;   STK00
;   r0x106F
;   r0x1070
;   r0x1071
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=154previous max_key=0 
_read_sweep	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	306; "enerjar.c"	adc_set_port_config(BIN(0000));
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_port_config
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	309; "enerjar.c"	adc_set_channel(5);
	MOVLW	0x05
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_adc_set_channel
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	310; "enerjar.c"	delay(20);
	MOVLW	0x14
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_delay
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	312; "enerjar.c"	adc_start();
	CALL	_adc_start
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	313; "enerjar.c"	adc_wait();
	CALL	_adc_wait
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	315; "enerjar.c"	ret = adc_read_int();
	CALL	_adc_read_int
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x107B, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x107C 
	BANKSEL	r0x106F
	MOVWF	r0x106F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x107B 
	MOVWF	r0x1070
;; 	2671 left AOP_REG
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8193:genGenericShift *{*
;; ***	genGenericShift  8197
;;	908 register type nRegs=2
;;	778
;shiftRight_Left2ResultLit:6962: shCount=1, size=2, sign=1, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	.line	316; "enerjar.c"	ret >>= 3;
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6970:shiftRight_Left2ResultLit
	BTFSC	r0x106F,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6971:shiftRight_Left2ResultLit
	BSF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107C 
	RRF	r0x106F,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107B 
	RRF	r0x1070,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=2, sign=1, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6970:shiftRight_Left2ResultLit
	BTFSC	r0x106F,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6971:shiftRight_Left2ResultLit
	BSF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107C 
	RRF	r0x106F,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107B 
	RRF	r0x1070,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=2, sign=1, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6970:shiftRight_Left2ResultLit
	BTFSC	r0x106F,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6971:shiftRight_Left2ResultLit
	BSF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107C 
	RRF	r0x106F,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x107B 
	RRF	r0x1070,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;;	778
;;	908 register type nRegs=1
;; 	line = 10211 result AOP_REG=r0x107D, size=1, left -=-, size=0, right AOP_REG=r0x107B, size=2
;; ***	genCast  10317
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10337:genCast
;;	1435 rIdx = r0x107B 
	.line	318; "enerjar.c"	return ret;
	MOVF	r0x1070,W
;;1	MOVWF	r0x1071
	RETURN	
; exit point of _read_sweep
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _init_data	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=150previous max_key=0 
_init_data	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _total_cnt, size = 4
;; 	line = 9891 result AOP_DIR=_total_cnt, size=4, left -=-, size=0, right AOP_LIT=0x00, size=4
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total_cnt   offset=0
	.line	296; "enerjar.c"	total_cnt = 0;
	BANKSEL	_total_cnt
	CLRF	_total_cnt
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total_cnt   offset=1
	CLRF	(_total_cnt + 1)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total_cnt   offset=2
	CLRF	(_total_cnt + 2)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total_cnt   offset=3
	CLRF	(_total_cnt + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _total1, size = 4
;; 	line = 9891 result AOP_DIR=_total1, size=4, left -=-, size=0, right AOP_LIT=0x00, size=4
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total1   offset=0
	.line	297; "enerjar.c"	total1 = 0;
	BANKSEL	_total1
	CLRF	_total1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total1   offset=1
	CLRF	(_total1 + 1)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total1   offset=2
	CLRF	(_total1 + 2)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _total1   offset=3
	CLRF	(_total1 + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _voltage_max, size = 4
;; 	line = 9891 result AOP_DIR=_voltage_max, size=4, left -=-, size=0, right AOP_LIT=0x00, size=4
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _voltage_max   offset=0
	.line	298; "enerjar.c"	voltage_max = 0;
	BANKSEL	_voltage_max
	CLRF	_voltage_max
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _voltage_max   offset=1
	CLRF	(_voltage_max + 1)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _voltage_max   offset=2
	CLRF	(_voltage_max + 2)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _voltage_max   offset=3
	CLRF	(_voltage_max + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _current_max, size = 4
;; 	line = 9891 result AOP_DIR=_current_max, size=4, left -=-, size=0, right AOP_LIT=0x00, size=4
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _current_max   offset=0
	.line	299; "enerjar.c"	current_max = 0;
	BANKSEL	_current_max
	CLRF	_current_max
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _current_max   offset=1
	CLRF	(_current_max + 1)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _current_max   offset=2
	CLRF	(_current_max + 2)
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _current_max   offset=3
	CLRF	(_current_max + 3)
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _init_data
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_read_int	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1072
;   r0x1073
;   r0x1074
;   r0x1075
;   STK00
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=146previous max_key=0 
_adc_read_int	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;; ***	aopForSym 509
;;	520 sym->rname = _ADRESH, size = 1
;;	908 register type nRegs=2
;; 	line = 10211 result AOP_REG=r0x1071, size=2, left -=-, size=0, right AOP_DIR=_ADRESH, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1313
;;	1327  _ADRESH   offset=0 - had to alloc by reg name
	.line	285; "enerjar.c"	ret = ADRESH;
	BANKSEL	_ADRESH
	MOVF	_ADRESH,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1435 rIdx = r0x1071 
	BANKSEL	r0x1072
	MOVWF	r0x1072
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1435 rIdx = r0x1072 
	CLRF	r0x1073
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8193:genGenericShift *{*
;; ***	genGenericShift  8197
;;	908 register type nRegs=2
;;	778
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6880:shiftLeft_Left2ResultLit
	.line	286; "enerjar.c"	ret <<= 2;
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x1071 
	RLF	r0x1072,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x1072 
	RLF	r0x1073,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6880:shiftLeft_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x1071 
	RLF	r0x1072,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x1072 
	RLF	r0x1073,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;; ***	aopForSym 509
;;	520 sym->rname = _ADRESL, size = 1
;;	908 register type nRegs=2
;; 	line = 10211 result AOP_REG=r0x1073, size=2, left -=-, size=0, right AOP_DIR=_ADRESL, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1313
;;	1327  _ADRESL   offset=0 - had to alloc by reg name
	.line	287; "enerjar.c"	tmp = ADRESL;
	BANKSEL	_ADRESL
	MOVF	_ADRESL,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1435 rIdx = r0x1073 
	BANKSEL	r0x1074
	MOVWF	r0x1074
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1435 rIdx = r0x1074 
	CLRF	r0x1075
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8193:genGenericShift *{*
;; ***	genGenericShift  8197
;;	908 register type nRegs=2
;;	778
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6986:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1073 
	.line	288; "enerjar.c"	tmp >>= 6;
	SWAPF	r0x1074,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6987:shiftRight_Left2ResultLit
	ANDLW	0x0f
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6988:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1073 
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6992:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1074 
	SWAPF	r0x1075,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6993:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1074 
	MOVWF	r0x1075
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6994:shiftRight_Left2ResultLit
	ANDLW	0xf0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6995:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1073 
	IORWF	r0x1074,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6996:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1074 
	XORWF	r0x1075,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=2, sign=0, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1074 
	RRF	r0x1075,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1073 
	RRF	r0x1074,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;shiftRight_Left2ResultLit:6962: shCount=1, size=2, sign=0, same=1, offr=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6968:shiftRight_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1074 
	RRF	r0x1075,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6975:shiftRight_Left2ResultLit
;;	1435 rIdx = r0x1073 
	RRF	r0x1074,F
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5679:genOr *{*
;; ***	genOr  5680
;;	778
;;	778
;;	908 register type nRegs=2
;; 	line = 5686 result AOP_REG=r0x1071, size=2, left AOP_REG=r0x1071, size=2, right AOP_REG=r0x1073, size=2
;; 	line = 5711 result AOP_REG=r0x1071, size=2, left AOP_REG=r0x1071, size=2, right AOP_REG=r0x1073, size=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5887:genOr
;;	1435 rIdx = r0x1073 
	.line	289; "enerjar.c"	return ret | tmp;
	MOVF	r0x1074,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5888:genOr
;;	1435 rIdx = r0x1071 
	IORWF	r0x1072,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5887:genOr
;;	1435 rIdx = r0x1074 
	MOVF	r0x1075,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5888:genOr
;;	1435 rIdx = r0x1072 
	IORWF	r0x1073,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3119:genRet *{*
;; ***	genRet  3121
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1071 
	MOVF	r0x1072,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1822:pass_argument
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1072 
	MOVF	r0x1073,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _adc_read_int
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_set_port_config	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x1070
;   r0x1071
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=142previous max_key=0 
_adc_set_port_config	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x106F, size=1, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x106F 
	.line	276; "enerjar.c"	void adc_set_port_config(unsigned char PCFG) {
	BANKSEL	r0x1070
	MOVWF	r0x1070
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;; ***	aopForSym 509
;;	520 sym->rname = _ADCON1, size = 1
;;	908 register type nRegs=1
;; 	line = 5437 result AOP_REG=r0x1070, size=1, left AOP_DIR=_ADCON1, size=1, right AOP_LIT=0xf0, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5645:genAnd
	.line	277; "enerjar.c"	ADCON1 = (ADCON1 & 0xF0) | PCFG;
	MOVLW	0xf0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5646:genAnd
;;	1313
;;	1329  _ADCON1   offset=0
	BANKSEL	_ADCON1
	ANDWF	_ADCON1,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5648:genAnd
;;	1435 rIdx = r0x1070 
;;1	MOVWF	r0x1071
	BANKSEL	r0x1070
	IORWF	r0x1070,W
	BANKSEL	_ADCON1
	MOVWF	_ADCON1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _adc_set_port_config
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_start	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=138previous max_key=0 
_adc_start	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
	BSF ADCON0, 0x2;
	
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _adc_start
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_set_channel	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x1070
;   r0x1071
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=124previous max_key=10 
_adc_set_channel	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x106D, size=1, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x106D 
	.line	257; "enerjar.c"	void adc_set_channel(unsigned char channel) {
	BANKSEL	r0x1070
	MOVWF	r0x1070
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8193:genGenericShift *{*
;; ***	genGenericShift  8197
;;	908 register type nRegs=1
;;	778
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6880:shiftLeft_Left2ResultLit
	.line	260; "enerjar.c"	channel <<= 3;
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x106D 
	RLF	r0x1070,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6880:shiftLeft_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x106D 
	RLF	r0x1070,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6880:shiftLeft_Left2ResultLit
	BCF	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6883:shiftLeft_Left2ResultLit
;;	1435 rIdx = r0x106D 
	RLF	r0x1070,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _ADCON0, size = 1
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x106E, size=1, left -=-, size=0, right AOP_DIR=_ADCON0, size=1
;; ***	genAssign  9970
;; WARNING	genAssign  9977 ignoring register storage
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _ADCON0   offset=0
	.line	261; "enerjar.c"	tmp = ADCON0;
	BANKSEL	_ADCON0
	MOVF	_ADCON0,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1435 rIdx = r0x106E 
	BANKSEL	r0x1071
	MOVWF	r0x1071
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;;	908 register type nRegs=1
;;	778
;; 	line = 5437 result AOP_REG=r0x106E, size=1, left AOP_REG=r0x106E, size=1, right AOP_LIT=0xc7, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5585:genAnd
	.line	262; "enerjar.c"	tmp &= BIN(11000111);
	MOVLW	0xc7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5587:genAnd
;;	1435 rIdx = r0x106E 
	ANDWF	r0x1071,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5679:genOr *{*
;; ***	genOr  5680
;;	908 register type nRegs=1
;;	778
;; ***	aopForSym 509
;;	520 sym->rname = _ADCON0, size = 1
;; 	line = 5686 result AOP_DIR=_ADCON0, size=1, left AOP_REG=r0x106E, size=1, right AOP_REG=r0x106D, size=1
;; 	line = 5711 result AOP_DIR=_ADCON0, size=1, left AOP_REG=r0x106E, size=1, right AOP_REG=r0x106D, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5952:genOr
;;	1435 rIdx = r0x106D 
	.line	263; "enerjar.c"	tmp |= channel;
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5953:genOr
;;	1435 rIdx = r0x106E 
	IORWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5955:genOr
;;	1313
;;	1329  _ADCON0   offset=0
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	.line	264; "enerjar.c"	ADCON0 = tmp;
	RETURN	
; exit point of _adc_set_channel
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_set_clock	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x106F
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=120previous max_key=0 
_adc_set_clock	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x106C, size=1, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x106C 
	.line	236; "enerjar.c"	void adc_set_clock(unsigned char clk) {
	BANKSEL	r0x106F
	MOVWF	r0x106F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;;	908 register type nRegs=1
;; 	line = 5437 result AOP_CRY=0x00, size=0, left AOP_REG=r0x106C, size=1, right AOP_LIT=0x01, size=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5329:isLiteralBit *{*
;; ***	isLiteralBit  5330
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5506:genAnd
	.line	237; "enerjar.c"	if(clk & 0x01) {
	BTFSS	r0x106F,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5507:genAnd
;; ***	popGetLabel  key=2, label offset 124
	GOTO	_00226_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
	BSF ADCON0, 6 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=3, label offset 124
	GOTO	_00227_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
_00226_DS_
	BCF ADCON0, 6 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;;	908 register type nRegs=1
;; 	line = 5437 result AOP_CRY=0x00, size=0, left AOP_REG=r0x106C, size=1, right AOP_LIT=0x02, size=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5329:isLiteralBit *{*
;; ***	isLiteralBit  5330
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5506:genAnd
_00227_DS_
	.line	243; "enerjar.c"	if(clk & 0x02) {
	BANKSEL	r0x106F
	BTFSS	r0x106F,1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5507:genAnd
;; ***	popGetLabel  key=5, label offset 124
	GOTO	_00229_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
	BSF ADCON0, 7 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=6, label offset 124
	GOTO	_00230_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
_00229_DS_
	BCF ADCON0, 7 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;;	908 register type nRegs=1
;; 	line = 5437 result AOP_CRY=0x00, size=0, left AOP_REG=r0x106C, size=1, right AOP_LIT=0x04, size=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5329:isLiteralBit *{*
;; ***	isLiteralBit  5330
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5506:genAnd
_00230_DS_
	.line	249; "enerjar.c"	if(clk & 0x04) {
	BANKSEL	r0x106F
	BTFSS	r0x106F,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5507:genAnd
;; ***	popGetLabel  key=8, label offset 124
	GOTO	_00232_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
	BSF ADCON1, 6 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=10, label offset 124
	GOTO	_00234_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
_00232_DS_
	BCF ADCON1, 6 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
_00234_DS_
	RETURN	
; exit point of _adc_set_clock
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_off	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=116previous max_key=0 
_adc_off	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
	BCF ADCON0, 0;
	
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _adc_off
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_on	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=102previous max_key=10 
_adc_on	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:6217:genInline *{*
;; ***	genInline  6218
	BSF ADCON0, 0;
	
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _adc_on
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _delay	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1070
;   STK00
;   r0x1071
;   r0x1072
;   r0x1073
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=97previous max_key=1 
_delay	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1068, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1069 
	.line	215; "enerjar.c"	void delay(unsigned int n) {
	BANKSEL	r0x1070
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1068 
	MOVWF	r0x1071
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=2
;; 	line = 9891 result AOP_REG=r0x106A, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x106A 
	.line	217; "enerjar.c"	for(i = 0; i < n; ++i) {}
	CLRF	r0x1072
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x106B 
	CLRF	r0x1073
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=2
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1435 rIdx = r0x1069 
_00203_DS_
	BANKSEL	r0x1070
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x106B 
	SUBWF	r0x1073,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=10, label offset 102
	GOTO	_00212_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3809:pic14_mov2w_regOrLit
;;	1435 rIdx = r0x1068 
	MOVF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x106A 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00212_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=5, label offset 102
	GOTO	_00207_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	908 register type nRegs=2
;;	778
;; 	line = 766 result AOP_REG=r0x106A, size=2, left AOP_REG=r0x106A, size=2, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1435 rIdx = r0x106A 
	BANKSEL	r0x1072
	INCF	r0x1072,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1435 rIdx = r0x106B 
	INCF	r0x1073,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=1, label offset 102
	GOTO	_00203_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
_00207_DS_
	RETURN	
; exit point of _delay
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_wait	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=83previous max_key=10 
_adc_wait	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5402:genAnd *{*
;; ***	genAnd  5403
;; ***	aopForSym 509
;;	520 sym->rname = _ADCON0, size = 1
;; 	line = 5437 result AOP_CRY=0x00, size=0, left AOP_DIR=_ADCON0, size=1, right AOP_LIT=0x04, size=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5329:isLiteralBit *{*
;; ***	isLiteralBit  5330
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5506:genAnd
_00198_DS_
	.line	211; "enerjar.c"	while(ADCON0 & 0x04) { }
	BANKSEL	_ADCON0
	BTFSC	_ADCON0,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5507:genAnd
;; ***	popGetLabel  key=1, label offset 97
	GOTO	_00198_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _adc_wait
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _disp_disp	;Function start
; 2 exit points
;has an exit
;functions called:
;   _disp_kilo
;   _disp_dig
;   _disp_kilo
;   _disp_dig
;3 compiler assigned registers:
;   r0x1081
;   r0x1082
;   r0x1083
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=76previous max_key=3 
_disp_disp	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	.line	196; "enerjar.c"	disp_kilo();
	CALL	_disp_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=2
;; 	line = 9891 result AOP_REG=r0x1065, size=2, left -=-, size=0, right AOP_LIT=0x01, size=2
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	198; "enerjar.c"	for(i = 1; i <= DISP_SIZE; ++i) {
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1435 rIdx = r0x1065 
	BANKSEL	r0x1081
	MOVWF	r0x1081
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1435 rIdx = r0x1066 
	CLRF	r0x1082
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4702:genCmpGt *{*
;; ***	genCmpGt  4703
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x5=5), size=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00184_DS_
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x1066 
	BANKSEL	r0x1082
	SUBWF	r0x1082,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=10, label offset 83
	GOTO	_00193_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x05
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1065 
	SUBWF	r0x1081,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00193_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=5, label offset 83
	GOTO	_00188_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;;	908 register type nRegs=2
;;	908 register type nRegs=1
;; 	line = 10211 result AOP_REG=r0x1067, size=1, left -=-, size=0, right AOP_REG=r0x1065, size=2
;; ***	genCast  10317
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10337:genCast
;;	1435 rIdx = r0x1065 
	.line	199; "enerjar.c"	disp_dig(i);
	BANKSEL	r0x1081
	MOVF	r0x1081,W
;;1	MOVWF	r0x1083
	CALL	_disp_dig
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	908 register type nRegs=2
;;	778
;; 	line = 766 result AOP_REG=r0x1065, size=2, left AOP_REG=r0x1065, size=2, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  217
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:229:genPlusIncr
;;	1435 rIdx = r0x1065 
	.line	198; "enerjar.c"	for(i = 1; i <= DISP_SIZE; ++i) {
	BANKSEL	r0x1081
	INCF	r0x1081,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:233:genPlusIncr
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:234:genPlusIncr
;;	1435 rIdx = r0x1066 
	INCF	r0x1082,F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=1, label offset 83
	GOTO	_00184_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
_00188_DS_
	RETURN	
; exit point of _disp_disp
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _disp_dig	;Function start
; 0 exit points
;4 compiler assigned registers:
;   r0x106F
;   r0x1070
;   r0x1071
;   r0x1072
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=68previous max_key=4 
_disp_dig	;Function start
; 0 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x105F, size=1, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x105F 
	BANKSEL	r0x1070
	MOVWF	r0x1070
	.line	177; "enerjar.c"	void disp_dig(unsigned char d) {
	MOVWF	r0x106F
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _PORTB, size = 1
;; 	line = 9891 result AOP_DIR=_PORTB, size=1, left -=-, size=0, right AOP_LIT=0xff, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	179; "enerjar.c"	PORTB = 0xFF;
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _PORTB   offset=0
	BANKSEL	_PORTB
	MOVWF	_PORTB
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;;	908 register type nRegs=1
;;	908 register type nRegs=2
;; 	line = 10211 result AOP_REG=r0x1060, size=2, left -=-, size=0, right AOP_REG=r0x105F, size=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10364:genCast
;;	1435 rIdx = r0x105F 
;;105	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10365:genCast
;;	1435 rIdx = r0x1060 
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1191:addSign
;;	1435 rIdx = r0x1061 
	.line	180; "enerjar.c"	i = d - 1;
	BANKSEL	r0x1071
	CLRF	r0x1071
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;;	908 register type nRegs=2
;;	908 register type nRegs=2
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:426:genAddLit *{*
;; ***	genAddLit  427
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; hi = ff	genAddLit  498
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:515:genAddLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:516:genAddLit
;;	1435 rIdx = r0x1060 
	ADDWF	r0x1070,F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:517:genAddLit
	BTFSS	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:518:genAddLit
;;	1435 rIdx = r0x1061 
	DECF	r0x1071,F
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	813
;;	aopForRemat 598
;;	619: rname _dig_pins, val 0, const = 0
;;	908 register type nRegs=2
;;	908 register type nRegs=2
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dig_pins
;; 	line = 766 result AOP_REG=r0x1060, size=2, left AOP_PCODE=_dig_pins, size=2, right AOP_REG=r0x1060, size=2
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dig_pins
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1435 rIdx = r0x1060 
	.line	181; "enerjar.c"	PORTD = dig_pins[i];
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:937:genPlus
	ADDLW	(_dig_pins + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x1060 
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:953:genPlus
;;	1435 rIdx = r0x1061 
	MOVF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:954:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:955:genPlus
;;	1435 rIdx = r0x1061 
	INCFSZ	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:956:genPlus
	ADDLW	high (_dig_pins + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:957:genPlus
;;	1435 rIdx = r0x1061 
	MOVWF	r0x1071
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8996:genPointerGet *{*
;; ***	genPointerGet  8997
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8599:genNearPointerGet *{*
;; ***	genNearPointerGet  8600
;;	908 register type nRegs=2
;; ***	genNearPointerGet  8616
;; ***	aopForSym 509
;;	520 sym->rname = _PORTD, size = 1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1060 
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x1071,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  8644
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1313
;;	1329  _PORTD   offset=0
	BANKSEL	_PORTD
	MOVWF	_PORTD
;; ***	genNearPointerGet  8673
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	813
;;	aopForRemat 598
;;	619: rname _dispdig, val 0, const = 0
;;	908 register type nRegs=1
;;	908 register type nRegs=2
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dispdig
;; 	line = 766 result AOP_REG=r0x1060, size=2, left AOP_PCODE=_dispdig, size=2, right AOP_REG=r0x105F, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dispdig
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1435 rIdx = r0x105F 
	.line	182; "enerjar.c"	PORTB = ~sseg[dispdig[d]];
	BANKSEL	r0x106F
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:937:genPlus
	ADDLW	(_dispdig + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x1060 
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1003:genPlus
	MOVLW	high (_dispdig + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1004:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1005:genPlus
	ADDLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1006:genPlus
;;	1435 rIdx = r0x1061 
	MOVWF	r0x1071
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8996:genPointerGet *{*
;; ***	genPointerGet  8997
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8599:genNearPointerGet *{*
;; ***	genNearPointerGet  8600
;;	908 register type nRegs=2
;; ***	genNearPointerGet  8616
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1060 
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x1071,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  8644
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1435 rIdx = r0x1062 
	MOVWF	r0x1072
	ADDLW	(_sseg + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x1060 
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1003:genPlus
	MOVLW	high (_sseg + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1004:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1005:genPlus
	ADDLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1006:genPlus
;;	1435 rIdx = r0x1061 
	MOVWF	r0x1071
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8996:genPointerGet *{*
;; ***	genPointerGet  8997
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8599:genNearPointerGet *{*
;; ***	genNearPointerGet  8600
;;	908 register type nRegs=2
;; ***	genNearPointerGet  8616
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1060 
	MOVF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x1071,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  8644
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8650:genNearPointerGet
	MOVF	INDF,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8654:genNearPointerGet
;;	1435 rIdx = r0x1062 
	MOVWF	r0x1072
;; ***	genNearPointerGet  8673
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2086:genCpl *{*
;; ***	genCpl  2088
;;	908 register type nRegs=1
;; ***	aopForSym 509
;;	520 sym->rname = _PORTB, size = 1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2110:genCpl
;;	1435 rIdx = r0x1062 
	COMF	r0x1072,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2112:genCpl
;;	1313
;;	1329  _PORTB   offset=0
	BANKSEL	_PORTB
	MOVWF	_PORTB
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5071:genCmpEq *{*
;; ***	genCmpEq  5072
;; ifx is non-null
;;	908 register type nRegs=1
;; ***	aopForSym 509
;;	520 sym->rname = _dot_after, size = 1
;; 	line = 5083 result AOP_CRY=0x00, size=0, left AOP_REG=r0x105F, size=1, right AOP_DIR=_dot_after, size=1
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1313
;;	1329  _dot_after   offset=0
	.line	183; "enerjar.c"	if(d == dot_after) {
	BANKSEL	_dot_after
	MOVF	_dot_after,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5152:genCmpEq
;;	1435 rIdx = r0x105F 
	.line	184; "enerjar.c"	PORTB &= 0x7F;
	BANKSEL	r0x106F
	XORWF	r0x106F,W
	BTFSS	STATUS,2
	GOTO	_00017_DS_
	BANKSEL	_PORTB
	BCF	_PORTB,7
_00017_DS_
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;entry:  _disp_kilo	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=64previous max_key=0 
_disp_kilo	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9707:genIfx *{*
;; ***	genIfx  9708
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; ***	pic14_toBoolean  1995
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2005:pic14_toBoolean
	.line	164; "enerjar.c"	if(kilo) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2016:pic14_toBoolean
;;	1313
;;	1329  _kilo   offset=0
	BANKSEL	_kilo
	IORWF	_kilo,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9756:genIfx
	BTFSC	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9757:genIfx
;; ***	popGetLabel  key=2, label offset 68
	GOTO	_00170_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _PORTC, size = 1
;; 	line = 9891 result AOP_DIR=_PORTC, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	165; "enerjar.c"	PORTC = 0x01;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _PORTC   offset=0
	BANKSEL	_PORTC
	MOVWF	_PORTC
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=4, label offset 68
	GOTO	_00172_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _PORTC, size = 1
;; 	line = 9891 result AOP_DIR=_PORTC, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _PORTC   offset=0
_00170_DS_
	.line	167; "enerjar.c"	PORTC = 0x00;
	BANKSEL	_PORTC
	CLRF	_PORTC
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
_00172_DS_
	RETURN	
; exit point of _disp_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _disp_set_decimal_places	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1079
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=44previous max_key=16 
_disp_set_decimal_places	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x105E, size=1, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x105E 
;;1	MOVWF	r0x1079
	.line	158; "enerjar.c"	dot_after = DISP_SIZE - decimals;
	SUBLW	0x04
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1373:genMinus
;;	1313
;;	1329  _dot_after   offset=0
	BANKSEL	_dot_after
	MOVWF	_dot_after
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _disp_set_decimal_places
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _disp_set_num_raw	;Function start
; 2 exit points
;has an exit
;functions called:
;   __modsint
;   __divsint
;   __modsint
;   __divsint
;11 compiler assigned registers:
;   r0x1079
;   STK00
;   r0x107A
;   r0x107B
;   r0x107C
;   r0x107D
;   STK02
;   STK01
;   r0x107E
;   r0x107F
;   r0x1080
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=4previous max_key=36 
_disp_set_num_raw	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1054, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1055 
	.line	138; "enerjar.c"	void disp_set_num_raw(int val)
	BANKSEL	r0x1079
	MOVWF	r0x1079
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1054 
	MOVWF	r0x107A
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x1056, size=1, left -=-, size=0, right AOP_LIT=0x04, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	142; "enerjar.c"	while(val != 0)
	MOVLW	0x04
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1435 rIdx = r0x1056 
	MOVWF	r0x107B
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5071:genCmpEq *{*
;; ***	genCmpEq  5072
;; ifx is non-null
;;	908 register type nRegs=2
;; 	line = 5083 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1054, size=2, right AOP_LIT=0x00, size=2
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1054 
_00145_DS_
	BANKSEL	r0x107A
	MOVF	r0x107A,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5124:genCmpEq
;;	1435 rIdx = r0x1055 
	.line	144; "enerjar.c"	dispdig[i--] = val % 10;
	IORWF	r0x1079,W
	BTFSC	STATUS,2
	GOTO	_00156_DS_
	MOVF	r0x107B,W
	MOVWF	r0x107C
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;;	908 register type nRegs=1
;;	778
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:426:genAddLit *{*
;; ***	genAddLit  427
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:384:genAddLit2byte *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:393:genAddLit2byte
;;	1435 rIdx = r0x1056 
	DECF	r0x107B,F
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	813
;;	aopForRemat 598
;;	619: rname _dispdig, val 0, const = 0
;;	908 register type nRegs=1
;;	908 register type nRegs=2
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dispdig
;; 	line = 766 result AOP_REG=r0x1057, size=2, left AOP_PCODE=_dispdig, size=2, right AOP_REG=r0x1057, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dispdig
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1435 rIdx = r0x1057 
	MOVF	r0x107C,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:937:genPlus
	ADDLW	(_dispdig + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x1057 
	MOVWF	r0x107C
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1003:genPlus
	MOVLW	high (_dispdig + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1004:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1005:genPlus
	ADDLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1006:genPlus
;;	1435 rIdx = r0x1058 
	MOVWF	r0x107D
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=2
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x0a
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=2
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1054 
	MOVF	r0x107A,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1055 
	MOVF	r0x1079,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__modsint
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__modsint
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1059, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x105A 
;;1	MOVWF	r0x107E
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1059 
;;1	MOVWF	r0x107F
	BANKSEL	r0x1080
	MOVWF	r0x1080
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9637:genPointerSet *{*
;; ***	genPointerSet  9638
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9333:genNearPointerSet *{*
;; ***	genNearPointerSet  9334
;;	908 register type nRegs=2
;; ***	genNearPointerSet  9351
;;	908 register type nRegs=1
;; 	line = 9353 result AOP_REG=r0x1057, size=2, left -=-, size=0, right AOP_REG=r0x105B, size=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1057 
	MOVF	r0x107C,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x107D,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  9377
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9386:genNearPointerSet
;;	1435 rIdx = r0x105B 
	MOVF	r0x1080,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  9399
;; ***	genNearPointerSet  9410
;; ***	genNearPointerSet  9421
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=2
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	145; "enerjar.c"	val = val / 10;
	MOVLW	0x0a
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=2
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1054 
	MOVF	r0x107A,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1055 
	MOVF	r0x1079,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divsint
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divsint
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=2
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1054, size=2, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1055 
	BANKSEL	r0x1079
	MOVWF	r0x1079
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1054 
	MOVWF	r0x107A
;; 	2671 left AOP_REG
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=1, label offset 44
	GOTO	_00145_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;;	908 register type nRegs=1
;; 	line = 9891 result AOP_REG=r0x1054, size=1, left -=-, size=0, right AOP_REG=r0x1056, size=1
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1056 
_00156_DS_
	.line	147; "enerjar.c"	while(i != 0)
	BANKSEL	r0x107B
	MOVF	r0x107B,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1435 rIdx = r0x1054 
	MOVWF	r0x107A
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5071:genCmpEq *{*
;; ***	genCmpEq  5072
;; ifx is non-null
;;	908 register type nRegs=1
;; 	line = 5083 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1054, size=1, right AOP_LIT=0x00, size=1
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1054 
_00148_DS_
	BANKSEL	r0x107A
	.line	149; "enerjar.c"	dispdig[i--] = 0;
	MOVF	r0x107A,W
	BTFSC	STATUS,2
	GOTO	_00150_DS_
_00160_DS_
	BANKSEL	r0x107A
	MOVF	r0x107A,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1435 rIdx = r0x1055 
	MOVWF	r0x1079
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; NULL :(	5209
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10383:genDjnz *{*
;; ***	genDjnz  10384
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1203:genMinus *{*
;; ***	genMinus  1204
;;	908 register type nRegs=1
;;	778
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:426:genAddLit *{*
;; ***	genAddLit  427
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:384:genAddLit2byte *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:393:genAddLit2byte
;;	1435 rIdx = r0x1054 
	DECF	r0x107A,F
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	pic14_getDataSize  1921
;; ***	addSign  1171
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1172:addSign *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; ***	genPlus  759
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:760:genPlus *{*
;;	813
;;	aopForRemat 598
;;	619: rname _dispdig, val 0, const = 0
;;	908 register type nRegs=1
;;	908 register type nRegs=2
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dispdig
;; 	line = 766 result AOP_REG=r0x1055, size=2, left AOP_PCODE=_dispdig, size=2, right AOP_REG=r0x1055, size=1
;; ***	pic14_getDataSize  1921
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:203:genPlusIncr *{*
;; ***	genPlusIncr  205
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1921
;; ***	genPlus  913
;;	1156: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_dispdig
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:928:genPlus
;;	1435 rIdx = r0x1055 
	MOVF	r0x1079,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:937:genPlus
	ADDLW	(_dispdig + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:939:genPlus
;;	1435 rIdx = r0x1055 
	MOVWF	r0x1079
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1003:genPlus
	MOVLW	high (_dispdig + 0)
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1004:genPlus
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1005:genPlus
	ADDLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/genarith.c:1006:genPlus
;;	1435 rIdx = r0x1056 
	MOVWF	r0x107B
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9637:genPointerSet *{*
;; ***	genPointerSet  9638
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9333:genNearPointerSet *{*
;; ***	genNearPointerSet  9334
;;	908 register type nRegs=2
;; ***	genNearPointerSet  9351
;; 	line = 9353 result AOP_REG=r0x1055, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1055 
	MOVF	r0x1079,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8348:setup_fsr
	MOVWF	FSR
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8320:SetIrp *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8335:SetIrp
	BCF	STATUS,7
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8337:SetIrp
	BTFSC	r0x107B,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:8338:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  9377
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9384:genNearPointerSet
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9391:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  9399
;; ***	genNearPointerSet  9410
;; ***	genNearPointerSet  9421
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=4, label offset 44
	GOTO	_00148_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;;	908 register type nRegs=1
;; ***	aopForSym 509
;;	520 sym->rname = _dispsize, size = 1
;; 	line = 9891 result AOP_DIR=_dispsize, size=1, left -=-, size=0, right AOP_REG=r0x1054, size=1
;; ***	genAssign  9983
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1054 
_00150_DS_
	.line	152; "enerjar.c"	dispsize = i;
	BANKSEL	r0x107A
	MOVF	r0x107A,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10002:genAssign
;;	1313
;;	1329  _dispsize   offset=0
	BANKSEL	_dispsize
	MOVWF	_dispsize
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
	RETURN	
; exit point of _disp_set_num_raw
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _disp_set_num	;Function start
; 2 exit points
;has an exit
;functions called:
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;   __divulong
;   _disp_set_num_raw
;   _disp_set_decimal_places
;17 compiler assigned registers:
;   r0x106F
;   STK00
;   r0x1070
;   STK01
;   r0x1071
;   STK02
;   r0x1072
;   r0x1073
;   r0x1074
;   STK06
;   STK05
;   STK04
;   STK03
;   r0x1075
;   r0x1076
;   r0x1077
;   r0x1078
;; Starting pCode block
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2839:genFunction *{*
;; ***	genFunction  2841 curr label offset=0previous max_key=0 
_disp_set_num	;Function start
; 2 exit points
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10445:genReceive *{*
;; ***	genReceive  10446
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1049, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104C 
	.line	104; "enerjar.c"	void disp_set_num(unsigned long val)
	BANKSEL	r0x106F
	MOVWF	r0x106F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104B 
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104A 
	MOVWF	r0x1071
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1049 
	MOVWF	r0x1072
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0x2710=10000), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	.line	106; "enerjar.c"	if(val < 10000L) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=30, label offset 4
	GOTO	_00134_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=30, label offset 4
	GOTO	_00134_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x27
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=30, label offset 4
	GOTO	_00134_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x10
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00134_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=19, label offset 4
	GOTO	_00123_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10202:genCast *{*
;; ***	genCast  10203
;;	908 register type nRegs=4
;;	908 register type nRegs=2
;; 	line = 10211 result AOP_REG=r0x104D, size=2, left -=-, size=0, right AOP_REG=r0x1049, size=4
;; ***	genCast  10317
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10337:genCast
;;	1435 rIdx = r0x1049 
;;101	MOVF	r0x1072,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10338:genCast
;;	1435 rIdx = r0x104D 
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10337:genCast
;;	1435 rIdx = r0x104A 
;;111	MOVF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10338:genCast
;;	1435 rIdx = r0x104E 
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=2
;;	908 register type nRegs=2
;; 	2612 left AOP_REG
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104D 
;;100	MOVF	r0x1073,W
	.line	107; "enerjar.c"	disp_set_num_raw(val);
	BANKSEL	r0x1072
	MOVF	r0x1072,W
	MOVWF	r0x1073
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104E 
;;110	MOVF	r0x1074,W
	MOVF	r0x1071,W
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	108; "enerjar.c"	disp_set_decimal_places(3);
	MOVLW	0x03
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _kilo   offset=0
	.line	109; "enerjar.c"	kilo = 0;
	BANKSEL	_kilo
	CLRF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0x186A0=100000), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00123_DS_
	.line	110; "enerjar.c"	} else if(val < 100000L) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=31, label offset 4
	GOTO	_00135_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=31, label offset 4
	GOTO	_00135_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x86
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=31, label offset 4
	GOTO	_00135_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xa0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00135_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=16, label offset 4
	GOTO	_00120_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	111; "enerjar.c"	disp_set_num_raw(val/10L);
	MOVLW	0x0a
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=4
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1049 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104A 
	MOVF	r0x1071,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104B 
	MOVF	r0x1070,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104C 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x104D, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1050 
	BANKSEL	r0x1075
	MOVWF	r0x1075
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104F 
	MOVWF	r0x1076
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104E 
	MOVWF	r0x1078
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104D 
	MOVWF	r0x1073
	MOVWF	r0x1077
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1052 
	MOVF	r0x1078,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	112; "enerjar.c"	disp_set_decimal_places(2);
	MOVLW	0x02
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _kilo   offset=0
	.line	113; "enerjar.c"	kilo = 0;
	BANKSEL	_kilo
	CLRF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0xF4240=1000000), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00120_DS_
	.line	114; "enerjar.c"	} else if(val < 1000000L) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=32, label offset 4
	GOTO	_00136_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x0f
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=32, label offset 4
	GOTO	_00136_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x42
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=32, label offset 4
	GOTO	_00136_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x40
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00136_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=13, label offset 4
	GOTO	_00117_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	115; "enerjar.c"	disp_set_num_raw(val/100L);
	MOVLW	0x64
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=4
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1049 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104A 
	MOVF	r0x1071,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104B 
	MOVF	r0x1070,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104C 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x104D, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1050 
	BANKSEL	r0x1075
	MOVWF	r0x1075
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104F 
	MOVWF	r0x1076
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104E 
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104D 
	MOVWF	r0x1073
	MOVWF	r0x1077
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1052 
;;107	MOVF	r0x1078,W
	MOVF	r0x1074,W
	MOVWF	r0x1078
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	116; "enerjar.c"	disp_set_decimal_places(1);
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _kilo   offset=0
	.line	117; "enerjar.c"	kilo = 0;
	BANKSEL	_kilo
	CLRF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0x989680=10000000), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00117_DS_
	.line	118; "enerjar.c"	} else if(val < 10000000L) {
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=33, label offset 4
	GOTO	_00137_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x98
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=33, label offset 4
	GOTO	_00137_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x96
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=33, label offset 4
	GOTO	_00137_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x80
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00137_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=10, label offset 4
	GOTO	_00114_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	119; "enerjar.c"	disp_set_num_raw(val/1000L);
	MOVLW	0xe8
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x03
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=4
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1049 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104A 
	MOVF	r0x1071,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104B 
	MOVF	r0x1070,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104C 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x104D, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1050 
	BANKSEL	r0x1075
	MOVWF	r0x1075
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104F 
	MOVWF	r0x1076
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104E 
	MOVWF	r0x1078
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104D 
	MOVWF	r0x1073
	MOVWF	r0x1077
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1052 
	MOVF	r0x1078,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	120; "enerjar.c"	disp_set_decimal_places(0);
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9992:genAssign
;;	1313
;;	1329  _kilo   offset=0
	.line	121; "enerjar.c"	kilo = 0;
	BANKSEL	_kilo
	CLRF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0x5F5E100=100000000), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00114_DS_
	.line	122; "enerjar.c"	} else if(val < 100000000L) {
	MOVLW	0x05
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=34, label offset 4
	GOTO	_00138_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xf5
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=34, label offset 4
	GOTO	_00138_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xe1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=34, label offset 4
	GOTO	_00138_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00138_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=7, label offset 4
	GOTO	_00111_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	123; "enerjar.c"	disp_set_num_raw(val/10000L);
	MOVLW	0x10
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x27
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=4
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1049 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104A 
	MOVF	r0x1071,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104B 
	MOVF	r0x1070,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104C 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x104D, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1050 
	BANKSEL	r0x1075
	MOVWF	r0x1075
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104F 
	MOVWF	r0x1076
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104E 
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104D 
	MOVWF	r0x1073
	MOVWF	r0x1077
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1052 
;;103	MOVF	r0x1078,W
	MOVF	r0x1074,W
	MOVWF	r0x1078
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	124; "enerjar.c"	disp_set_decimal_places(2);
	MOVLW	0x02
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	125; "enerjar.c"	kilo = 1;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _kilo   offset=0
	BANKSEL	_kilo
	MOVWF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0x3B9ACA00=1000000000), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00111_DS_
	.line	126; "enerjar.c"	} else if(val < 1000000000L) {
	MOVLW	0x3b
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=35, label offset 4
	GOTO	_00139_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x9a
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=35, label offset 4
	GOTO	_00139_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xca
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=35, label offset 4
	GOTO	_00139_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00139_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=4, label offset 4
	GOTO	_00108_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	127; "enerjar.c"	disp_set_num_raw(val/100000L);
	MOVLW	0xa0
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x86
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x01
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=4
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1049 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104A 
	MOVF	r0x1071,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104B 
	MOVF	r0x1070,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104C 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x104D, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1050 
	BANKSEL	r0x1075
	MOVWF	r0x1075
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104F 
	MOVWF	r0x1076
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104E 
	MOVWF	r0x1078
	MOVWF	r0x1074
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104D 
	MOVWF	r0x1073
	MOVWF	r0x1077
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1052 
	MOVF	r0x1078,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	128; "enerjar.c"	disp_set_decimal_places(1);
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	129; "enerjar.c"	kilo = 1;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _kilo   offset=0
	BANKSEL	_kilo
	MOVWF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3172:genGoto *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3174:genGoto
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:5187:ifxForOp *{*
;; ***	ifxForOp  5189
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:4732:genCmpLt *{*
;; ***	genCmpLt  4733
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3834:genCmp *{*
;unsigned compare: left < lit(0xFFFFFFFF=4294967295), size=4
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
_00108_DS_
	.line	130; "enerjar.c"	} else if(val < 0xFFFFFFFF) {
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3942:genCmp
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=36, label offset 4
	GOTO	_00140_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104B 
	SUBWF	r0x1070,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=36, label offset 4
	GOTO	_00140_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x104A 
	SUBWF	r0x1071,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3978:genCmp
	BTFSS	STATUS,2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3979:genCmp
;; ***	popGetLabel  key=36, label offset 4
	GOTO	_00140_DS_
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3807:pic14_mov2w_regOrLit
	MOVLW	0xff
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3981:genCmp
;;	1435 rIdx = r0x1049 
	SUBWF	r0x1072,W
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3684:genSkipc *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3689:genSkipc
_00140_DS_
	BTFSC	STATUS,0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3693:genSkipc
;; ***	popGetLabel  key=21, label offset 4
	GOTO	_00125_DS_
;genSkipc:3694: created from rifx:0xbf9c5784
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;;	908 register type nRegs=4
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	131; "enerjar.c"	disp_set_num_raw(val/1000000L);
	MOVLW	0x40
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x79
	MOVWF	STK06
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x42
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7a
	MOVWF	STK05
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x0f
;; 	2612 left AOP_LIT
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7b
	MOVWF	STK04
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	MOVLW	0x00
;;	908 register type nRegs=4
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7c
	MOVWF	STK03
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x1049 
	BANKSEL	r0x1072
	MOVF	r0x1072,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVWF	STK02
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104A 
	MOVF	r0x1071,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVWF	STK01
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=2
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104B 
	MOVF	r0x1070,W
;; 	2612 left AOP_REG
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2620:genCall
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=3
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104C 
	MOVF	r0x106F,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	__divulong
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;;	908 register type nRegs=4
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2349:assignResultValue *{*
;; ***	assignResultValue  2351
;; 	line = 2353 result -=-, size=0, left AOP_REG=r0x1049, size=4, right -=-, size=0
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104C 
	BANKSEL	r0x106F
	MOVWF	r0x106F
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7f
	MOVF	STK00,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104B 
	MOVWF	r0x1070
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7e
	MOVF	STK01,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x104A 
	MOVWF	r0x1074
	MOVWF	r0x1071
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1828:get_returnvalue
;; ***	popRegFromIdx,1343  , rIdx=0x7d
	MOVF	STK02,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1802:movwf
;;	1435 rIdx = r0x1049 
	MOVWF	r0x1072
	MOVWF	r0x1073
	MOVWF	STK00
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
;; ***	mov2w  1791  offset=1
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1796:mov2w
;;	1435 rIdx = r0x104E 
	MOVF	r0x1074,W
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_num_raw
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2563:genCall *{*
;; ***	genCall  2565
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2223:saveRegisters *{*
;; ***	saveRegisters  2225
;; 	2612 left AOP_LIT
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1759:mov2w_op *{*
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:1774:mov2w_op
	.line	132; "enerjar.c"	disp_set_decimal_places(0);
	MOVLW	0x00
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2649:genCall
	PAGESEL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2651:genCall
	CALL	_disp_set_decimal_places
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2656:genCall
	PAGESEL	$
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2287:unsaveRegisters *{*
;; ***	unsaveRegisters  2289
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9881:genAssign *{*
;; ***	genAssign  9882
;; ***	aopForSym 509
;;	520 sym->rname = _kilo, size = 1
;; 	line = 9891 result AOP_DIR=_kilo, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  9983
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9988:genAssign
	.line	133; "enerjar.c"	kilo = 1;
	MOVLW	0x01
; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:9990:genAssign
;;	1313
;;	1329  _kilo   offset=0
	BANKSEL	_kilo
	MOVWF	_kilo
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:3155:genLabel *{*
;; ***	genLabel  3158
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2794:resultRemat *{*
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:2992:genEndFunction *{*
;; ***	genEndFunction  2994
_00125_DS_
	RETURN	
; exit point of _disp_set_num
;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic/gen.c:10509:genpic14Code *{*


;	code size estimation:
;	 1272+  276 =  1548 instructions ( 3648 byte)

	end
