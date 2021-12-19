	.section 	.rodata
	.align	2
prompt:	.asciz "Enter an integer: "
	.align	2
scanf:
	.asciz "%d"
	.align	2
result:	.asciz "isblank(%d) returns %d\n"

	.text
	.align	2
isblank:
	push	{fp, lr}	@ init stack
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 1 local var
	@ [fp, #-8] holds n

	str	r0, [fp, #-8]	@ store parameter n

	ldr	r0, [fp, #-8]	@ if x == ' '
	mov	r1, #32
	cmp	r0, r1
	bne	else
	mov	r2, #1
	b	next	
else:				@ else x >= 0
	mov	r2, #0
next:
	mov	r0, r2
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

	ldr	r0, [fp, #-8]	@ isblank(x)
	bl	isblank
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
