	.section 	.rodata
	.align		2
prompt:					@ printf prompt str
	.asciz	"Enter a positive integer: "

	.align	2
scan:					@ scanf input int
	.asciz	"%d%"

	.align	2
result:					@ printf result str
	.asciz	"The sum of the fisrt %d squares is %d\n"

	.text
	.align	2
square:					@ square function
	push	{fp, lr}		@ init stack
	add	fp, sp, #4
	sub	sp, sp, #8

	str	r0, [fp, #-8]		@ store x

	ldr	r0, [fp, #-8]		@ square computation
	mul	r0, r0, r0

	sub	sp, fp, #4		@ teardown stack
	pop	{fp, pc}
	
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}		@ init stack
	add	fp, sp, #4
	sub	sp, sp, #16		@ 3 local var
	@ [fp, #-8] holds n
	@ [fp, #-12] holds result
	@ [fp, #-16] holds i

	mov	r0, #0			@ init & assign result to 0
	str	r0, [fp, #-12]

	ldr	r0, promptP		@ printf prompt
	bl	printf

	ldr	r0, scanP		@ scanf scan
	sub	r1, fp, #8
	bl	__isoc99_scanf

	mov	r0, #0			@ init & assign i to 0
	str	r0, [fp, #16]

	b	guard			@ starts loop, go to guard

body:
	ldr	r0, [fp, #-16]		@ call square(i)
	bl	square

	mov	r2, r0			@ add square (i) to result
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	str	r3, [fp, #12]

	ldr	r3, [fp, #-16]		@ add 1 to i
	add	r3, r3, #1
	str	r3, [fp, #-16]

guard:
	ldr	r3, [fp, #-8]		@ guard i <= n
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	ble	body

	ldr	r0, resultP		@ printf result
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0			@ teardown stack
	sub	sp, fp, #4
	pop	{fp, pc}

	.align	2
promptP:				@ str pointers
	.word	prompt
scanP:
	.word	scan
resultP:
	.word	result
