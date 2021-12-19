/* example of assembly programming
   RAB 11/2018 */	

/* string constants */
	.section .rodata
	.align 2		@ force next addr to be divisible by 2^2
greeting:			@ format string for printf
	.asciz "Hello, world!\n"  @ .asciz auto adds terminating nullbyte

	.align 2		@ format addr num
greeting2:
	.asciz "Hello, world\n"

	.align 2
inthex:
	.asciz "Decimal: %d\nHex: %x\n"

/* main program */
	.text
	.align 2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ no local variables

	ldr	r0, greetingP	@ call printf()
	bl	printf

	ldr	r0, greeting2P	@ call printf()
	bl	printf

	mov	r2, #29
	str	r2, [fp, #-8]
	
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, inthexP
	bl	printf
	
	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align 2
greetingP:	
	.word	greeting	@ pointer variable to string greeting

	.align 2
greeting2P:
	.word	greeting2	@ pointer variable to string greeting2

inthexP:
	.word	inthex		@ pointer variable to string inthex
