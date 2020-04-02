Message: .asciz "Hello new \n"
OutFileName: .asciz "outfile.txt"

ldr r0,=OutFileName
mov r1,#1
swi 0x66

ldr r1,=Message
swi 0x69
swi 0x68
swi 0x11
