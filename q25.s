.equ SEG_A,0x80
.equ SEG_B,0x40
.equ SEG_C,0x20
.equ SEG_D,0x08
.equ SEG_E,0x04
.equ SEG_F,0x02
.equ SEG_G,0x01
.equ SEG_P,0x10
.equ Scount, 250         @250*(1+3)=1000 1 for sub 3 for executed branch
.equ Lcount, 2000 


Segment_display:
ldr r0,=SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_G @0
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_B|SEG_C @1
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_B|SEG_F|SEG_E|SEG_D @2
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_B|SEG_F|SEG_C|SEG_D @3
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_G|SEG_F|SEG_B|SEG_C @4
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_G|SEG_F|SEG_C|SEG_D @5
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_G|SEG_F|SEG_E|SEG_D|SEG_C @6
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_B|SEG_C @7
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G @8
swi 0x200
mov r4,pc
B Ltimer
ldr r0,=SEG_A|SEG_B|SEG_F|SEG_G|SEG_C @9
swi 0x200
mov r4,pc
B Ltimer

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