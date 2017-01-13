@ mywc.s
@ an assembly translation of mywc.c


@ Code Section
.text
.global main
.global getchar

.code 16			@using Thumb 16-bit
.align 2			@2 byte aligned instructions

main:
	mov r4, #0		@int linecount = 0
	mov r5, #0		@int wordcount = 0
	mov r6, #0		@int charcount = 0
	mov r7, #0		@int flag = 0

loop:
	bl getchar		@while ((ch = getchar()) != EOF)
	mov r1, r0		@puts output of getchar in r1
	cmn r1, #1		@cmn used to compare to -1 (EOF)
	beq return		@ends while loop

	cmp r1, #32		@if ch != ' '
	cmpne r1, #10		@&& if ch != '\n'
	beq if_char

	cmp r7, #0		@else
	beq else_word		@if (flag == 0)

	cmp r1, #10		@if (ch == '\n')
	beq if_line

	b loop

if_char:
	add r6, #1		@charcount++
	mov r7, #1		@flag = 1
	b loop

else_word:
	add r6, #1		@charcount++
	cmp r7, #0		@check value of flag
	bneq loop		@if flag != 0
	add r5, #1		@wordcount++
	mov r7, #1		@flag = 1
	b loop

if_line:
	add r4, #1		@linecount++
	b loop

return:

