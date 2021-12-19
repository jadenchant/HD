/* testpow.s - ARM assembly test program for pow() */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter two integers:  "
	.align	2
input:			@ format string for scanf
	.asciz "%d %d"
	.align	2
results:			@ format string for printf
	.asciz "The call pow(%d, %d) returns %d\n"

/* REPLACE THIS COMMENT BY YOUR DEFINITION OF pow() */
	.text
	.align	2
pow:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16	@ 4 local var
	@ [fp, #-8] holds x
	@ [fp, #-12] holds p
	@ [fp, #-16] holds i
	@ [fp, #-20] holds result

	str	r0, [fp, #-8]	@ store x and p
	str	r1, [fp, #-12]

	mov	r0, #1		@ init and assign i and result
	str	r0, [fp, #-16]
	mov	r0, #1
	str	r0, [fp, #-20]

	b	guard

body:
	ldr	r0, [fp, #-20] 	@ result * x
	ldr	r1, [fp, #-8]
	mul	r0, r0, r1
	str	r0, [fp, #-20]

	ldr	r0, [fp, #-16]	@ add 1 to i
	add	r0, r0, #1
	str	r0, [fp, #-16]

guard:
	ldr	r0, [fp, #-12]	@ guard p <= i
	ldr	r1, [fp, #-16]
	cmp	r0, r1
	ble	body

	ldr	r0, [fp, #-20]	@ load results into r0 for return

	sub	sp, fp, #4	@ teardown stack
	pop	{fp, pc}
	
/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ 3 local var
	@ [fp, #-8] holds x
	@ [fp, #-12] holds p
	@ [fp, #-16] holds results

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read values into x and p
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call pow(x, p)
	ldr	r1, [fp, #-12]
	bl	pow
	str	r0, [fp, #-16]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
