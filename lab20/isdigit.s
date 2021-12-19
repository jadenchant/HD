	.section 	.rodata
	.align	2
prompt:	.asciz "Enter an integer between 0 and 255: "
	.align	2
scanf:
	.asciz "%d"
	.align	2
result:	.asciz "isdigit(%d) returns %d\n"

	.text
	.align	2
isdigit:
	push	{fp, lr}	@ init stack
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 1 local var
	@ [fp, #-8] holds n

	str	r0, [fp, #-8]	@ store parameter n

	ldr	r0, [fp, #-8]	@ if n >= 0 && n <= 255
	cmp	r0, #0
	blt	else
	cmp	r0, #255
	bgt	else
	mov	r0, #1
	b	next
else:
	mov	r0, #0
next:
	@ 	r0, holds 0, 1 for result
	
	sub	sp, fp, #4	@ teardown stack
	pop	{fp, pc}

	
/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 1 local variables
	@ [fp, #-8] is x, first integer variable

	ldr	r0, promptP	@ prompt print
	bl	printf

	ldr	r0, scanfP	@ scanf user input
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ isdigit(x)
	bl	isdigit
	mov	r2, r0		@ printf results
	ldr	r1, [fp, #-8]	
	ldr	r0, resultP
	bl	printf

	mov	r0, #0		@ assign 0 as return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings */
	.align	2
promptP:
	.word	prompt
scanfP:
	.word	scanf
resultP:
	.word	result
