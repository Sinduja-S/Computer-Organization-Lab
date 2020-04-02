
filename: .asciz "2strings.txt"
.align
data1: .skip 80
data2: .skip 80
filehandle: .skip 40
equal: .asciz "strings are equal"
notequal: .asciz "strings are not equal"

ldr r0,=filename
mov r1,#0
swi 0x66 @open file

ldr r1,=filehandle
str r0,[r1]
ldr r0,=filehandle
ldr r0,[r0]
ldr r1,=data1
mov r2,#20
swi 0x6a @read data1 from file

ldr r3,=data1 @storing data1 reg3

ldr r0,=filehandle
ldr r0,[r0]
ldr r1,=data2
swi 0x6a @read data2 from file

ldr r4,=data2 @storing data2 reg4


loop:
ldrb r5,[r3],#1        
ldrb r6,[r4],#1
cmp r5,r6
bne nomessage
b come

come:
cmp r5,#0
beq yesmessage
bal loop

nomessage:
ldr r0,=notequal
swi 0x02 @display string on stdout
ldr r0,=filehandle
ldr r0,[r0]
swi 0x68 @close file
swi 0x11 @halt

yesmessage:
ldr r0,=equal
swi 0x02 @display string on stdout
ldr r0,=filehandle
ldr r0,[r0]
swi 0x68 @close file

