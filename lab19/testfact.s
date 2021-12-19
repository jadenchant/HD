/* testfact.s - ARM assembly test program for fact() */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter an integer:  "
	.align	2
input:			@ format string for scanf
	.asciz "%d"
	.align	2
results:			@ format string for printf
	.asciz "The call fact(%d) returns %d\n"

	.text
	.align	2
fact:
	push	{fp, lr}	@ init stack
	add	fp, sp, #4
	sub	sp, sp, #8	@ 1 local var
	@ [fp, #-8] holds n

	str	r0, [fp, #-8]	@ store n

	ldr	r0, [fp, #-8]	@ if n <= 1
	cmp	r0, #1
	bgt	else

	mov	r0, #1		@ then return 1
	b	next

else:
	ldr	r0, [fp, #-8]	@ else call fact(n-1) * n
	sub	r0, r0, #1
	bl	fact
	ldr	r1, [fp, #-8]
	mul	r0, r0, r1

next:
	sub	sp, fp, #4	@ teardown stack
	pop	{fp, pc}

/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ ADD INLINE DOCUMENTATION
	@ ADD FULL LINE DOCUMENTATION HERE

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read value into x
	sub	r1, fp, #8	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call fact(x)
	bl	fact
	str	r0, [fp, #-12]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
