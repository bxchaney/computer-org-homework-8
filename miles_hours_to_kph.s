.global main
.text

main:

    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Prompt for input:
    LDR r0, =prompt
    BL printf

    # Scanf
    LDR r0, =input
    LDR r1, =hours
    LDR r2, =miles
    BL scanf

    # Get kph
	LDR r0, =hours
    LDR r0, [r0, #0]
    LDR r1, =miles
	LDR r1, [r1, #0]

    # Store copies of hours, miles 
    ADD r5, r0, #0
    ADD r6, r1, #0
    BL kph

    MOV r3, r0
    LDR r0, =output
    MOV r1, r5
    MOV r2, r6
    BL printf

    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr


.data
    prompt: .asciz "Please provide hours and miles: "
    input: .asciz "%d %d"
    hours: .word 0
    miles: .word 0
    output: .asciz "%d miles and %d hours is %d kph\n"
# end main
