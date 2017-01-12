@ mywc.s
@ an assembly translation of mywc.c

@ Data Section
.data
linecount:
	.word 0			@int linecount = 0
charcount:
	.word 0			@int charcount = 0
flag:
	.word 0			@int flag = 0


@ Code Section
.text

.code 16			@using Thumb 16-bit
.align 2			@2 byte aligned instructions


loop:				@while not EOF
	bl getchar
	mov r1, r0


main:

addr_linecount:	.word linecount
addr_charcount: .word charcount
addr_flag: .word flag
