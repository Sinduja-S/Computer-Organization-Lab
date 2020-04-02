  .equ Scount, 250         @250*(1+3)=1000
  .equ Lcount, 10          @Stimer*10=1000*10=10000

Ltimer:
    mov r2,#Lcount
   Lloop:
      BL Stimer       @branch with link
      subs r2,r2,#1   @r2=r2-1
      BNE Lloop

swi 0x11            @halt

Stimer:
     mov r1,#Scount
Sloop:
     subs r1,r1,#1     @r1=r1-1 s at end of sub updates condition flag
     BNE Sloop
     mov PC,LR         @put the value at link register to program counter



