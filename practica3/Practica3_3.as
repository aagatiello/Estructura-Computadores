.data
	year:		.word 2020
	leap:		.string " is a leap year"
	notleap:	.string " is not a leap year"

.text
begin:
	# Print year 
	lw a1 year
	li a0 1
	ecall

	# Jump to procedure
	jal ra calculeLeap
	
	# If a0 = 0 print not leap
	beq a0, zero, not_leap

	# If a0 = 1 print leap
	la a1 leap
	j end

not_leap:
	la a1 notleap

end:
	# Print if leap or not and exit
	li a0 4
	ecall

	li a0 10
	ecall

#-----------------
calculeLeap:		# in: a1 (Year)
						# out: a0 (Returns if leap or not)
						# funcion: procedure that calculate if a year is leap
begin_calculeLeap:
	# Save context
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a1, 0(sp)

	# Load for operations
	li t0 4
	li t1 100
	li t2 400

	# If remainder year/400 = 0 -> is leap
	rem t3, a1, t2
	beq t3, zero, returnLeap

	# If (remainder year/4 XOR remainder year/100) = 0 -> not leap
	rem t4, a1, t0
	bne t4, zero, reloadt4

L1:
	rem t5, a1, t1
	bne t5, zero, reloadt5

L2:
	xor t6, t4, t5
	beq t6, zero, returnNotleap
	bne t6, zero, returnLeap

reloadt4:
	li t4 1
	j L1

reloadt5:
	li t5 1
	j L2

end_calculeLeap:
returnLeap:
	li a0 1

	# Restore context
	lw a1, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, -8

	ret

returnNotleap:
	li a0 0 

	# Restore context
	lw a1, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, -8

	ret
#-----------------

