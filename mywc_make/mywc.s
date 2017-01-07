@ mywc.s
@ an assembly translation of mywc.c

.text
.balign 4
.global main

@include stdio?

main:	@int ch
	mov r2, #0		@int linecount = 0
	mov r3, #0		@int charcount = 0
	mov r4, #0		@int flag = 0

loop:	@while not EOF 
