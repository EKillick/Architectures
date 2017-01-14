@ mywc.s
@ an assembly translation of mywc.c


@ Code Section
.text
.global main
.global getchar

.code 32			@32 for Arm, 16 for Thumb
.align 4			@4 bytes for Arm, 2 for Thumb

main:
	push {lr}
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
	bne loop		@if flag != 0
	add r5, #1		@wordcount++
	mov r7, #1		@flag = 1
	b loop

if_line:
	add r4, #1		@linecount++
	b loop

return:
	cmp r7, #0
	beq add_word		@if (flag == 0)

	ldr r0, =string
	mov r1, r4		@move linecount to r1
	bl printf

	ldr r0, =string
	mov r1, r5		@move wordcount to r1
	bl printf

	ldr r0, =string
	mov r1, r6		@move charcount to r1

	bl getchar		@consume EOF

	pop {lr}
	bx lr

add_word:
	add r5, #1		@wordcount++
	mov r7, #1		@flag = 1
	b return

.data
string:
	.asciz "%d "
