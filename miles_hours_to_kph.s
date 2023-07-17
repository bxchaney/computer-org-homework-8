.global main
.text

main:

    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #2
    bl miles2kilometers

    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr


.data
# end main
