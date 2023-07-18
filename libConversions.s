/**
 * This file contains the following functions:
 *      - miles2kiometres(int miles)
 *      - kph(int hours, int miles)
 *      - CToF(int celsius)
 *      - InchesToFt(int inches)
 */
.global miles2kilometers
.global kph
.global CToF
.global InchesToFt

.text
# function miles2kilometers
# Purpose: To convert miles to kilometers
# Inputs: a miles value in (r0)
# Errors: 
# Alterations: This function uses registers r0, r1, and r2 for intermediate
#   operations. The values in those registers are overwritten with r0
#   containing the result after this function returns.
miles2kilometers:
 
    SUB sp, sp, #4
    STR lr, [sp, #0]
    /* 
        To convert miles to km, we have to multiply by 1.60934. This can be
        accomplished by multiplying by 160,934 and then dividing by 10,000. We
        multiply this way because 1.60934 would be truncated to 1 and miles
        to kilometers would be computed as miles * 1 = km.

        Because 160,934 is 0x274a6, then mutliplying x by this factor is 
        accomplished by:

            x * (0x02 << 8) + x * (0x75 << 4) + x * (0xa6)
    */
    MOV r2, #0x020000
    MUL r1, r0, r2

    MOV r2, #0x7400
    MLA r1, r0, r2, r1

    MOV r2, #0xa6
    MLA r0, r0, r2, r1

    /*
        We can now divide by 100,000. 100,000 is 0x186a0
    */
    MOV r1, #0x10000
    ORR r1, r1, #0x8600
    ORR r1, r1, #0xa0
    BL __aeabi_idiv

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
#end miles2kilometers

.text
# function kph
# Purpose: to convert hours and miles inputs into kilometers per hour
# Inputs: an integer hours value in r0 and an integer miles value in r1
# Alterations: This function uses registers r0, r1, r2, and r3 for intermediate
#   operations during function execution. Values in these registers will be 
#   overwritten.
kph:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # the miles2kilometers function uses registers r0, r1, and r2
    # so we store r0 (hours) in r3 temporarily
    MOV r3, r0
    MOV r0, r1
    BL miles2kilometers

    # r0 now contains the number of miles
    # MOVe hours back into r1 and call division
    MOV r1, r3
    BL __aeabi_idiv

    #result is in r0 so we can return control

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

.text
# function CToF
# Purpose: Converting Celsius temperatures to Fahrenheit
# Inputs: a Celcius value in r0
# Alterations: 
CToF:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Multiplying by 9
    ADD r0, r0, r0, LSL #3 
    MOV r1, #5
    BL __aeabi_idiv

    ADD r0, r0, #32

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
#end CToF

.text
# function InchesToFt
# Purpose: converting inches to feet
# Inputs: an inches value in r0
# Alterations: 
InchesToFt:

    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r1, #12
    BL __aeabi_idiv
    
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
#end InchesToFt

