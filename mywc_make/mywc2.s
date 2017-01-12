.LC0:
	.ascii	" %d %d %d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #0				@int linecount = 0
	str	r3, [fp, #-8]
	mov	r3, #0				@int wordcount = 0
	str	r3, [fp, #-12]
	mov	r3, #0				@int charcount = 0
	str	r3, [fp, #-16]
	mov	r3, #0				@int flag = 0
	str	r3, [fp, #-20]
	b	.L2
.L6:
	ldr	r3, [fp, #-24]
	cmp	r3, #32
	beq	.L3
	ldr	r3, [fp, #-24]
	cmp	r3, #10
	beq	.L3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L4
.L3:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-20]
.L5:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-24]
	cmp	r3, #10
	bne	.L2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	bl	getchar
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L6
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L7
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L7:
	ldr	r0, .L9
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf
	bl	getchar
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L10:
	.align	2
.L9:
	.word .LC0
