/* I am not including the comments because they are already on
	the hand written sheet */
	.section .rodata
	.align	2
prompt:
	.asciz	"Enter one int: "

	.align	2
scan:
	.asciz	"%d%"

	.align	2
result:
	.asciz	"Ten plus %d equals %d\n"

	.text
	.align	2
	.global	main
main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, promptP
	bl	printf

	ldr	r0, scanP
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r2, [fp, #-8]
	add	r1, r2, #10
	str	r1, [fp, #-12]

	ldr	r0, resultP
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0
	sub	sp, fp, #4
	pop	{fp, pc}

	.align 2
promptP:
	.word	prompt
scanP:
	.word	scan
resultP:
	.word	result
