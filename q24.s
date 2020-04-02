  .equ Scount, 250         @250*(1+3)=1000 
  .equ Lcount, 2000          @Stimer*2000=1000*2000=2*10^6
  .equ cycles, 5

BULB_pattern:
   mov r3,#cycles  
  Loop:
  mov r0,#0x02
  swi 0x201
  mov r4,pc
  B Ltimer
  mov r0,#0x01
  swi 0x201
  mov r4,pc
  B Ltimer
  subs r3,r3,#1
  BNE Loop

swi 0x11 


Ltimer:
    mov r2,#Lcount
   Lloop:
      BL Stimer       @branch with link
      subs r2,r2,#1   @r2=r2-1
      BNE Lloop 
      mov pc,r4          

Stimer:
     mov r1,#Scount
Sloop:
     subs r1,r1,#1     @r1=r1-1 s at end of sub updates condition flag         
     BNE Sloop
     mov PC,LR         @put the value at link register to program counter
     


   