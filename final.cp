#line 1 "D:/Summer Tranning 2/Embedded System/Final Project/code/final.c"

char a;
 void interrupt()
 {
 if(INTf_bit==1)
 { portc=portd=0;
 porta.b0=1; porta.b1=1;
 porta.b2=1; porta.b3=1;
 while(portb.b7==1);
 INTf_bit=0;
 while(1)
 {

 if(portb.b7==0 && portb.b6==1 &&portb.b5==1){
 portb.b5=0;
 portb.b4=1;
 for(a=3 ; a>=0 ;a--){
 porta.B3=0; porta.B1=0;
 portd=a;
 portc=a;
 delay_ms(1000);
 if(a==1) break;
 }
 portb.b6=0;
 portb.b2=1;
 portb.b4=0;
 portb.b3=1;
 porta.B3=1;
 porta.B1=1;
 while(portb.b7==1);
 }


 if(portb.b7==0 && portb.b2==1 && portb.b3==1){
 portb.b2=0;
 portb.b1=1;
 for(a=3 ; a>=0 ;a--){
 porta.B1=0; porta.B3=0;
 portd=a;
 portc=a;
 delay_ms(1000);
 if(a==1) break;
 }
 portb.b3=0;
 portb.b5=1;
 porta.B1=1;
 porta.B3=1;
 portb.b3=0;
 portb.b1=0;
 portb.b6=1;
 while(portb.b7==1);
 }

 if(portb.b7==0 && portb.b1==1 && portb.b3==1) {

 for(a=3 ; a>=0 ;a--){
 porta.B1=0; porta.B3=0;
 portd=a;
 portc=a;
 delay_ms(1000);
 if(a==1) break;
 }
 portb.b3=0;
 portb.b5=1;
 porta.B1=1;
 porta.B3=1;
 portb.b1=0;
 portb.b6=1;
 while(portb.b7==1);
 }

 if(portb.b7==0 && portb.b6==1 && portb.b4==1) {
 for(a=3 ; a>=0 ;a--){
 porta.B3=0; porta.B1=0;
 portd=a;
 portc=a;
 delay_ms(1000);
 if(a==1) break;
 }
 portb.b2=1;
 portb.b6=0;
 portb.b4=0;
 portb.b3=1;
 porta.B3=1;
 porta.B1=1;
 while(portb.b7==1);
 }

 }
 }
}


void counter1(char countw , char counte){
char i =0;
char lefte , leftw ,righte ,rightw ;

while(countw>0 && counte>0){
char leftw =countw/10;
char rightw =countw%10;

char lefte =counte/10;
char righte =counte%10;
porta.b0=0; porta.b1=1;
portc = leftw;
delay_ms(5);
porta.b0=1; porta.b1=0;
portc = rightw;
delay_ms(5);

porta.b2=0; porta.b3=1;
portd = lefte;
delay_ms(5);
porta.b2=1; porta.b3=0;
portd = righte;
delay_ms(5);

i++;
if(i == 50){
 if(countw > 0) countw--;
 if(counte > 0) counte--;
 i=0;
 }
 }
}

void clearw(){
 portc=0;
}

void cleare(){
 portd=0;
}



void main() {
ADCON1=0x07;
trisc=0; portc=0;
trisd=0; portd=0;
trisb=0b10000001; portb=0;
trisa=0; porta=0;

clearw();
cleare();


 gie_bit=1;
 inte_bit=1;
 INTEDG_bit = 0;


 while(1){
while(porta.b5==0);
portb.b6=1; portb.b5=1;
counter1(15, 12);
clearw();
cleare();
 portb.b5=0;

 portb.b6=1; portb.b4=1;
counter1(3, 3);
clearw();
cleare();

 portb.b6=0; portb.b4=0;

portb.b2=1; portb.b3=1;
counter1(20,23);
clearw();
cleare();
portb.b2=0;

portb.b1=1; portb.b3=1;
counter1(3,3);
clearw();
cleare();
portb.b1=0; portb.b3=0;
 }
}
