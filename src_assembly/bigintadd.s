@ an assembly translation of bigintadd.s

.text
.balign 4

uiCarry:
	.word 0
uiSum:
	.word 0
i:
	.word 0
iSumLength:
	.word 0

.global BigInt_larger

BigInt_larger:
push {lr}
mov r3, #0			@int iLarger
cmp r1, r0			@r0 = iLength1, r1 = iLength2
blt BigInt_larger_else
mov r3, r0			@if iLength1 > iLength2, iLarger = iLength1
b BigInt_larger_return

BigInt_larger_else:		@else
mov r3, r1			@iLarger = iLength2

BigInt_larger_return:
mov r0, r3			@moves iLarger to r0
pop {lr}
bx lr				@return iLarger

BigInt_add:
push {lr}
ldr r3, =uiCarry
mov r4, #0
str r4, [r3]			@int uiCarry = 0
push {r0-r3}
ldr r0, [r0]			@r0 = oAddend1->iLength
ldr r1, [r1]			@r1 = oAddend2->iLength
bl BigInt_larger
ldr r3, =iSumLength
str r0, [r3]			@iSumLength = BigIntlarger(iLength1, iLength2)
pop {r0-r3}

BigInt_for:
ldr r3, =i
mov r4, #0			@int i = 0
str r4, [r3]

loop:
ldr r4, =iSumLength
ldr r4, [r4]

ldr r3, =uiCarry
ldr r5, =uiSum

beq BigInt_for
