.global main
.text

main:

    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Prompt for input:
    MOV r0, =prompt
    BL printf

    # Scanf
    MOV r0, =input
    MOV r1, =hours
    MOV r2, =miles
    BL scanf

    # Get kph
    MOV r0, [r1, #0]
    MOV r1, [r2, #0]

    # Store copies of hours, miles 
    MOV r4, r0
    MOV r5, r1
    BL kph

    MOV r3, r0
    LDR r0, =output
    MOV r1, r4
    MOV r2, r5
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
