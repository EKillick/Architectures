@ an assembly translation of bigintadd.s

.text
.balign 4

BigInt_larger:
mov r3, #0			@int iLarger
cmp r1, r0			@r0 = iLength1, r1 = iLength2
blt BigInt_larger_else
mov r3, r0			@if iLength1 > iLength2, iLarger = iLength1
b BigInt_larger_return

BigInt_larger_else:		@else
mov r3, r1			@iLarger = iLength2
b BigInt_larger_return

BigInt_larger_return:
mov r0, r3			@moves iLarger to r0
bx lr				@return iLarger

BigInt_add:
