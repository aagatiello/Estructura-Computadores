.data 
	msg:		.string "prueba"
	line:	.word 10 	# Next line in ASCII

.text 
begin:
	# Print msg
	la a1 msg
	li a0 4
	ecall
		
	# Read character 1
	lb t0 0(a1)

	# Uppercase operation
	addi t0, t0, -32
	
	# Save
	sb t0 0(a1)
	
	# Moves to character 2 and repeat the process
	addi a1, a1, 1
	lb t0 0(a1)
	addi t0, t0, -32
	sb t0 0(a1)
	
	# Moves to character 3 and repeat the process
	addi a1, a1, 1
	lb t0 0(a1)
	addi t0, t0, -32
	sb t0 0(a1)

	# Moves to character 4 and repeat the process
	addi a1, a1, 1
	lb t0 0(a1)
	addi t0, t0, -32
	sb t0 0(a1)

	# Moves to character 5 and repeat the process
	addi a1, a1, 1
	lb t0 0(a1)
	addi t0, t0, -32
	sb t0 0(a1)

	# Moves to character 6 and repeat the process
	addi a1, a1, 1
	lb t0 0(a1)
	addi t0, t0, -32
	sb t0 0(a1)

end:
	# Print next line, new msg and exit
	la a1 line
	li a0 4
	ecall 

	la a1 msg
	li a0 4
	ecall		
			
	li a0 10
	ecall