InFileName: .asciz "outfile.txt"
String:.word 0

ldr r0,=InFileName
mov r1,#0
swi 0x66

ldr r1,=String
mov r2,#80
swi 0x6a
ldr r0,=String
swi 0x02
swi 0x68
swi 0x11
