.global main
.text

main:

    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #100
    bl miles2kilometers

	mov r1, r0
	ldr r0, =output
	bl printf

    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr


.data
	output: .asciz "%d\n"
# end main
