.data
	year:		.word 2020
	leap:		.string " is a leap year"
	notleap:	.string " is not a leap year"

.text
begin:
	# Load for operations
	li t0 4
	li t1 100
	li t2 400

	# Print year 
	lw a1 year
	li a0 1
	ecall

	# If remainder year/400 = 0 -> is leap
	rem t3, a1, t2
	beq t3, zero, printLeap

	# If (remainder year/4 XOR remainder year/100) = 0 -> not leap
	rem t4, a1, t0
	bne t4, zero, reloadt4

L1:
	rem t5, a1, t2
	bne t5, zero, reloadt5

L2:
	xor t6, t4, t5
	beq t6, zero, printNotleap
	bne t6, zero, printLeap

reloadt4:
	li t4 1
	j L1

reloadt5:
	li t5 1
	j L2

printLeap:
	la a1 leap	
	j end

printNotleap:
	la a1 notleap

end:
	# Print if leap or not and exit
	li a0 4		
	ecall

	li a0 10
	ecall