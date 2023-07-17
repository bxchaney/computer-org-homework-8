/**
 * This file contains the following functions:
 *      - miles2kiometres(int miles)
 *      - kph(int hours, int miles)
 */
.global miles2kilometers
.global kph
 .text
# function miles2kilometers
miles2kilometers:
 
    mul r0, r0, #2 

    mov pc, lr

#end miles2kilometers
