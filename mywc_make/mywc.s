@ mywc.s
@ an assembly translation of mywc.c

.text

.code 16
.align 2

thumb_function:
	mov r2, #0		@int linecount = 0
	mov r3, #0		@int charcount = 0
	mov r4, #0		@int flag = 0

loop:	@while not EOF

main:

