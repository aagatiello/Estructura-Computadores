.data 
	msg:    .string "practica dos estructura computadores."
	line:   .word 10 		# Next line in ASCII

.text 
begin:
	# Print msg
	la a1 msg
	li a0 4
	ecall

loop:		
	# Read character
	lb t0 0(a1)
	
	# Termination condition "."
	li t1 46
	beq t0, t1, end
	
	# Character less than "a" or greater than "z" moves next position
	li t1 92
	blt t0, t1, next
	li t1 122
	bgt t0, t1, next
	
	# Uppercase operation
	addi t0, t0, -32
	
	# Save
	sb t0 0(a1)
	
next:
	# Moves to next character and repeat
	addi a1, a1, 1
	j loop

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