/* guard.s - example of guard in assembly */

/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter two integers x and y: "
	.align	2
scanf_fmt:
	.asciz "%d %d"
	.align	2
msg1:	.asciz "%d is greater than or equal to 0 and %d is less than or equal to 9\n"
	.align	2
msg2:	.asciz "%d is NOT greater than or equal to 0 and/or %d is NOT less than or equal to 9\n"

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 2 local variables
	@ [fp, #-8] is x, first integer variable
	@ [fp, #-12] is y, second integer variable

	ldr	r0, promptP	@ print prompt
	bl	printf
	ldr	r0, scanf_fmtP  @ read values of x and y
	sub	r1, fp, #8
	sub	r2, fp, #12
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ if x >= 0 && x <= 9
	@ldr	r1, [fp, #-12]	
	cmp	r0, #0
	blt	else
	cmp	r0, #9
	bgt	else
	ldr	r0, msg1P	@ then print msg1 true
	ldr	r1, [fp, #-8]	
	mov	r2, r1
	bl	printf
	b	next

else:
	ldr	r0, msg2P	@ else print msg2 false
	ldr	r1, [fp, #-8]	
	mov	r2, r1	
	bl	printf

next:
	mov	r0, #0		@ assign 0 as return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings */
	.align	2
promptP:
	.word	prompt
scanf_fmtP:
	.word	scanf_fmt	
msg1P:
	.word	msg1
msg2P:
	.word	msg2
