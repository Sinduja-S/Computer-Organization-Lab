InFileName: .asciz "numbers.txt"
String:.skip 80
InFileHandle: .skip 80


ldr r0,=InFileName
mov r1,#0
swi 0x66 @open file 

ldr r1,=String
mov r2,#10
swi 0x6a @read String

ldr r3,=String

Loop:
@read byte by byte
ldrb r2,[r3],#1
@compare with null
cmp r2,#0
beq EOF
@compare with comma
cmp r2,#0x2c 
beq NL
mov r0,r2
swi 0x00 @display char on stdout
bal Loop

NL:
mov r0,#'\n'
swi 0x00 @display char on stdout
bal Loop

EOF:
ldr r0,=InFileHandle
ldr r0, [r0]
swi 0x68 @close
swi 0x11 @halt




