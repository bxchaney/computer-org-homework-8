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
 
	sub sp, sp, #4
	str lr, [sp, #0]
	/* 
		To convert miles to km, we have to multiply by 1.60934. This can be
		accomplished by multiplying by 160,934 and then dividing by 10,000.

		Because 160,934 is 0x274a6, then mutliplying x by this factor is 
		accomplished by:

			x * (0x02 << 8) + x * (0x75 << 4) + x * (0xa6)
	*/
	mov r2, #0x020000
	mul r1, r0, r2

	mov r2, #0x7400
	mla r1, r0, r2, r1

	mov r2, #0xa6
	mla r0, r0, r2, r1

	/*
		We can now divide by 100,000. 100,000 is 0x186a0
	*/
	mov r1, #0x10000
	orr r1, r1, #0x8600
	orr r1, r1, #0xa0
	bl __aeabi_idiv

	ldr lr, [sp]
	add sp, sp, #4
    mov pc, lr
.data
#end miles2kilometers

.text
# function kph
kph:
    
    mov pc, lr

.data

