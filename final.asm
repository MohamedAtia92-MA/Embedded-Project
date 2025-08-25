
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;final.c,3 :: 		void interrupt() // Interrupt block of code.
;final.c,5 :: 		if(INTf_bit==1) // If manual button is clicked, then
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
;final.c,6 :: 		{    portc=portd=0;
	CLRF       PORTD+0
	MOVF       PORTD+0, 0
	MOVWF      PORTC+0
;final.c,7 :: 		porta.b0=1;     porta.b1=1;
	BSF        PORTA+0, 0
	BSF        PORTA+0, 1
;final.c,8 :: 		porta.b2=1;     porta.b3=1;// All 7-segs   are off
	BSF        PORTA+0, 2
	BSF        PORTA+0, 3
;final.c,9 :: 		while(portb.b7==1); // Waiting switch button to be clicked.
L_interrupt1:
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt2
	GOTO       L_interrupt1
L_interrupt2:
;final.c,10 :: 		INTf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;final.c,11 :: 		while(1)
L_interrupt3:
;final.c,14 :: 		if(portb.b7==0 && portb.b6==1 &&portb.b5==1){ // If west street red light is on, then
	BTFSC      PORTB+0, 7
	GOTO       L_interrupt7
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt7
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt7
L__interrupt63:
;final.c,15 :: 		portb.b5=0;
	BCF        PORTB+0, 5
;final.c,16 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;final.c,17 :: 		for(a=3 ; a>=0 ;a--){
	MOVLW      3
	MOVWF      _a+0
L_interrupt8:
	MOVLW      0
	SUBWF      _a+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt9
;final.c,18 :: 		porta.B3=0;   porta.B1=0;
	BCF        PORTA+0, 3
	BCF        PORTA+0, 1
;final.c,19 :: 		portd=a;
	MOVF       _a+0, 0
	MOVWF      PORTD+0
;final.c,20 :: 		portc=a;
	MOVF       _a+0, 0
	MOVWF      PORTC+0
;final.c,21 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt11:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt11
	DECFSZ     R12+0, 1
	GOTO       L_interrupt11
	DECFSZ     R11+0, 1
	GOTO       L_interrupt11
	NOP
	NOP
;final.c,22 :: 		if(a==1) break;
	MOVF       _a+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
	GOTO       L_interrupt9
L_interrupt12:
;final.c,17 :: 		for(a=3 ; a>=0 ;a--){
	DECF       _a+0, 1
;final.c,23 :: 		}
	GOTO       L_interrupt8
L_interrupt9:
;final.c,24 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;final.c,25 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;final.c,26 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;final.c,27 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;final.c,28 :: 		porta.B3=1;
	BSF        PORTA+0, 3
;final.c,29 :: 		porta.B1=1;
	BSF        PORTA+0, 1
;final.c,30 :: 		while(portb.b7==1);
L_interrupt13:
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt14
	GOTO       L_interrupt13
L_interrupt14:
;final.c,31 :: 		}
L_interrupt7:
;final.c,34 :: 		if(portb.b7==0 && portb.b2==1 && portb.b3==1){
	BTFSC      PORTB+0, 7
	GOTO       L_interrupt17
	BTFSS      PORTB+0, 2
	GOTO       L_interrupt17
	BTFSS      PORTB+0, 3
	GOTO       L_interrupt17
L__interrupt62:
;final.c,35 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;final.c,36 :: 		portb.b1=1; // south street yellow light will be on
	BSF        PORTB+0, 1
;final.c,37 :: 		for(a=3 ; a>=0 ;a--){
	MOVLW      3
	MOVWF      _a+0
L_interrupt18:
	MOVLW      0
	SUBWF      _a+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt19
;final.c,38 :: 		porta.B1=0;  porta.B3=0;
	BCF        PORTA+0, 1
	BCF        PORTA+0, 3
;final.c,39 :: 		portd=a;
	MOVF       _a+0, 0
	MOVWF      PORTD+0
;final.c,40 :: 		portc=a;
	MOVF       _a+0, 0
	MOVWF      PORTC+0
;final.c,41 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt21:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt21
	DECFSZ     R12+0, 1
	GOTO       L_interrupt21
	DECFSZ     R11+0, 1
	GOTO       L_interrupt21
	NOP
	NOP
;final.c,42 :: 		if(a==1) break;
	MOVF       _a+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt22
	GOTO       L_interrupt19
L_interrupt22:
;final.c,37 :: 		for(a=3 ; a>=0 ;a--){
	DECF       _a+0, 1
;final.c,43 :: 		}
	GOTO       L_interrupt18
L_interrupt19:
;final.c,44 :: 		portb.b3=0; // and green light will be off.
	BCF        PORTB+0, 3
;final.c,45 :: 		portb.b5=1;
	BSF        PORTB+0, 5
;final.c,46 :: 		porta.B1=1;
	BSF        PORTA+0, 1
;final.c,47 :: 		porta.B3=1;
	BSF        PORTA+0, 3
;final.c,48 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;final.c,49 :: 		portb.b1=0;
	BCF        PORTB+0, 1
;final.c,50 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;final.c,51 :: 		while(portb.b7==1);
L_interrupt23:
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt24
	GOTO       L_interrupt23
L_interrupt24:
;final.c,52 :: 		}
L_interrupt17:
;final.c,54 :: 		if(portb.b7==0 && portb.b1==1 && portb.b3==1) {
	BTFSC      PORTB+0, 7
	GOTO       L_interrupt27
	BTFSS      PORTB+0, 1
	GOTO       L_interrupt27
	BTFSS      PORTB+0, 3
	GOTO       L_interrupt27
L__interrupt61:
;final.c,56 :: 		for(a=3 ; a>=0 ;a--){
	MOVLW      3
	MOVWF      _a+0
L_interrupt28:
	MOVLW      0
	SUBWF      _a+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt29
;final.c,57 :: 		porta.B1=0; porta.B3=0;
	BCF        PORTA+0, 1
	BCF        PORTA+0, 3
;final.c,58 :: 		portd=a;
	MOVF       _a+0, 0
	MOVWF      PORTD+0
;final.c,59 :: 		portc=a;
	MOVF       _a+0, 0
	MOVWF      PORTC+0
;final.c,60 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt31:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt31
	DECFSZ     R12+0, 1
	GOTO       L_interrupt31
	DECFSZ     R11+0, 1
	GOTO       L_interrupt31
	NOP
	NOP
;final.c,61 :: 		if(a==1) break;
	MOVF       _a+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt32
	GOTO       L_interrupt29
L_interrupt32:
;final.c,56 :: 		for(a=3 ; a>=0 ;a--){
	DECF       _a+0, 1
;final.c,62 :: 		}
	GOTO       L_interrupt28
L_interrupt29:
;final.c,63 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;final.c,64 :: 		portb.b5=1;
	BSF        PORTB+0, 5
;final.c,65 :: 		porta.B1=1;
	BSF        PORTA+0, 1
;final.c,66 :: 		porta.B3=1;
	BSF        PORTA+0, 3
;final.c,67 :: 		portb.b1=0;
	BCF        PORTB+0, 1
;final.c,68 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;final.c,69 :: 		while(portb.b7==1);
L_interrupt33:
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt34
	GOTO       L_interrupt33
L_interrupt34:
;final.c,70 :: 		}
L_interrupt27:
;final.c,72 :: 		if(portb.b7==0 && portb.b6==1 && portb.b4==1) {
	BTFSC      PORTB+0, 7
	GOTO       L_interrupt37
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt37
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt37
L__interrupt60:
;final.c,73 :: 		for(a=3 ; a>=0 ;a--){
	MOVLW      3
	MOVWF      _a+0
L_interrupt38:
	MOVLW      0
	SUBWF      _a+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt39
;final.c,74 :: 		porta.B3=0;    porta.B1=0;
	BCF        PORTA+0, 3
	BCF        PORTA+0, 1
;final.c,75 :: 		portd=a;
	MOVF       _a+0, 0
	MOVWF      PORTD+0
;final.c,76 :: 		portc=a;
	MOVF       _a+0, 0
	MOVWF      PORTC+0
;final.c,77 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt41:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt41
	DECFSZ     R12+0, 1
	GOTO       L_interrupt41
	DECFSZ     R11+0, 1
	GOTO       L_interrupt41
	NOP
	NOP
;final.c,78 :: 		if(a==1) break;
	MOVF       _a+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt42
	GOTO       L_interrupt39
L_interrupt42:
;final.c,73 :: 		for(a=3 ; a>=0 ;a--){
	DECF       _a+0, 1
;final.c,79 :: 		}
	GOTO       L_interrupt38
L_interrupt39:
;final.c,80 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;final.c,81 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;final.c,82 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;final.c,83 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;final.c,84 :: 		porta.B3=1;
	BSF        PORTA+0, 3
;final.c,85 :: 		porta.B1=1;
	BSF        PORTA+0, 1
;final.c,86 :: 		while(portb.b7==1);
L_interrupt43:
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt44
	GOTO       L_interrupt43
L_interrupt44:
;final.c,87 :: 		}
L_interrupt37:
;final.c,89 :: 		}
	GOTO       L_interrupt3
;final.c,90 :: 		}
L_interrupt0:
;final.c,91 :: 		}
L_end_interrupt:
L__interrupt66:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_counter1:

;final.c,94 :: 		void counter1(char countw , char counte){
;final.c,95 :: 		char i =0;
	CLRF       counter1_i_L0+0
;final.c,98 :: 		while(countw>0 && counte>0){
L_counter145:
	MOVF       FARG_counter1_countw+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_counter146
	MOVF       FARG_counter1_counte+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_counter146
L__counter164:
;final.c,99 :: 		char leftw =countw/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter1_countw+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter1+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter1_countw+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;final.c,100 :: 		char rightw =countw%10;
	MOVF       R0+0, 0
	MOVWF      counter1_rightw_L1+0
;final.c,102 :: 		char lefte =counte/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter1_counte+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      counter1_lefte_L1+0
;final.c,103 :: 		char righte =counte%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter1_counte+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      counter1_righte_L1+0
;final.c,104 :: 		porta.b0=0;     porta.b1=1;
	BCF        PORTA+0, 0
	BSF        PORTA+0, 1
;final.c,105 :: 		portc = leftw;
	MOVF       FLOC__counter1+0, 0
	MOVWF      PORTC+0
;final.c,106 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_counter149:
	DECFSZ     R13+0, 1
	GOTO       L_counter149
	DECFSZ     R12+0, 1
	GOTO       L_counter149
	NOP
	NOP
;final.c,107 :: 		porta.b0=1;     porta.b1=0;
	BSF        PORTA+0, 0
	BCF        PORTA+0, 1
;final.c,108 :: 		portc = rightw;
	MOVF       counter1_rightw_L1+0, 0
	MOVWF      PORTC+0
;final.c,109 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_counter150:
	DECFSZ     R13+0, 1
	GOTO       L_counter150
	DECFSZ     R12+0, 1
	GOTO       L_counter150
	NOP
	NOP
;final.c,111 :: 		porta.b2=0;     porta.b3=1;
	BCF        PORTA+0, 2
	BSF        PORTA+0, 3
;final.c,112 :: 		portd = lefte;
	MOVF       counter1_lefte_L1+0, 0
	MOVWF      PORTD+0
;final.c,113 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_counter151:
	DECFSZ     R13+0, 1
	GOTO       L_counter151
	DECFSZ     R12+0, 1
	GOTO       L_counter151
	NOP
	NOP
;final.c,114 :: 		porta.b2=1;     porta.b3=0;
	BSF        PORTA+0, 2
	BCF        PORTA+0, 3
;final.c,115 :: 		portd = righte;
	MOVF       counter1_righte_L1+0, 0
	MOVWF      PORTD+0
;final.c,116 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_counter152:
	DECFSZ     R13+0, 1
	GOTO       L_counter152
	DECFSZ     R12+0, 1
	GOTO       L_counter152
	NOP
	NOP
;final.c,118 :: 		i++;
	INCF       counter1_i_L0+0, 1
;final.c,119 :: 		if(i == 50){
	MOVF       counter1_i_L0+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_counter153
;final.c,120 :: 		if(countw > 0) countw--;
	MOVF       FARG_counter1_countw+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_counter154
	DECF       FARG_counter1_countw+0, 1
L_counter154:
;final.c,121 :: 		if(counte > 0) counte--;
	MOVF       FARG_counter1_counte+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_counter155
	DECF       FARG_counter1_counte+0, 1
L_counter155:
;final.c,122 :: 		i=0;
	CLRF       counter1_i_L0+0
;final.c,123 :: 		}
L_counter153:
;final.c,124 :: 		}
	GOTO       L_counter145
L_counter146:
;final.c,125 :: 		}
L_end_counter1:
	RETURN
; end of _counter1

_clearw:

;final.c,127 :: 		void clearw(){
;final.c,128 :: 		portc=0;
	CLRF       PORTC+0
;final.c,129 :: 		}
L_end_clearw:
	RETURN
; end of _clearw

_cleare:

;final.c,131 :: 		void cleare(){
;final.c,132 :: 		portd=0;
	CLRF       PORTD+0
;final.c,133 :: 		}
L_end_cleare:
	RETURN
; end of _cleare

_main:

;final.c,137 :: 		void main() {
;final.c,138 :: 		ADCON1=0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;final.c,139 :: 		trisc=0; portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;final.c,140 :: 		trisd=0; portd=0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;final.c,141 :: 		trisb=0b10000001; portb=0;
	MOVLW      129
	MOVWF      TRISB+0
	CLRF       PORTB+0
;final.c,142 :: 		trisa=0; porta=0;
	CLRF       TRISA+0
	CLRF       PORTA+0
;final.c,144 :: 		clearw();
	CALL       _clearw+0
;final.c,145 :: 		cleare();
	CALL       _cleare+0
;final.c,148 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;final.c,149 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;final.c,150 :: 		INTEDG_bit = 0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;final.c,153 :: 		while(1){
L_main56:
;final.c,154 :: 		while(porta.b5==0);
L_main58:
	BTFSC      PORTA+0, 5
	GOTO       L_main59
	GOTO       L_main58
L_main59:
;final.c,155 :: 		portb.b6=1; portb.b5=1;
	BSF        PORTB+0, 6
	BSF        PORTB+0, 5
;final.c,156 :: 		counter1(15, 12);
	MOVLW      15
	MOVWF      FARG_counter1_countw+0
	MOVLW      12
	MOVWF      FARG_counter1_counte+0
	CALL       _counter1+0
;final.c,157 :: 		clearw();
	CALL       _clearw+0
;final.c,158 :: 		cleare();
	CALL       _cleare+0
;final.c,159 :: 		portb.b5=0;
	BCF        PORTB+0, 5
;final.c,161 :: 		portb.b6=1; portb.b4=1;
	BSF        PORTB+0, 6
	BSF        PORTB+0, 4
;final.c,162 :: 		counter1(3, 3);
	MOVLW      3
	MOVWF      FARG_counter1_countw+0
	MOVLW      3
	MOVWF      FARG_counter1_counte+0
	CALL       _counter1+0
;final.c,163 :: 		clearw();
	CALL       _clearw+0
;final.c,164 :: 		cleare();
	CALL       _cleare+0
;final.c,166 :: 		portb.b6=0; portb.b4=0;
	BCF        PORTB+0, 6
	BCF        PORTB+0, 4
;final.c,168 :: 		portb.b2=1; portb.b3=1;
	BSF        PORTB+0, 2
	BSF        PORTB+0, 3
;final.c,169 :: 		counter1(20,23);
	MOVLW      20
	MOVWF      FARG_counter1_countw+0
	MOVLW      23
	MOVWF      FARG_counter1_counte+0
	CALL       _counter1+0
;final.c,170 :: 		clearw();
	CALL       _clearw+0
;final.c,171 :: 		cleare();
	CALL       _cleare+0
;final.c,172 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;final.c,174 :: 		portb.b1=1; portb.b3=1;
	BSF        PORTB+0, 1
	BSF        PORTB+0, 3
;final.c,175 :: 		counter1(3,3);
	MOVLW      3
	MOVWF      FARG_counter1_countw+0
	MOVLW      3
	MOVWF      FARG_counter1_counte+0
	CALL       _counter1+0
;final.c,176 :: 		clearw();
	CALL       _clearw+0
;final.c,177 :: 		cleare();
	CALL       _cleare+0
;final.c,178 :: 		portb.b1=0; portb.b3=0;
	BCF        PORTB+0, 1
	BCF        PORTB+0, 3
;final.c,179 :: 		}
	GOTO       L_main56
;final.c,180 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
