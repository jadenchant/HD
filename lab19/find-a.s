	.section .rodata
	.align	2
singlePrompt:
	.asciz	"Enter a character: "

	.align	2
scanChar:
	.asciz	"%c"

	.align	2
indicesChar:
	.asciz	"Indices of the character '%c':\n"

	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ init stack
	add	fp, sp, #4
	sub	sp, sp, #8	@ 1 local var
	@ [fp, #-8] holds ch

	ldr	r0, singlePromptP	@ print single char prompt
	bl	printf

	ldr	r0, scanCharP	@ read values of ch
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r0, indicesCharP
	ldr	r1, [fp, #-8]
	bl	printf

	mov	r0, #0		@ teardown stack
	sub	sp, fp, #4
	pop	{fp, pc}

	.text
	.align	2
singlePromptP:
	.word	singlePrompt
scanCharP:
	.word	scanChar
indicesCharP:
	.word	indicesChar
