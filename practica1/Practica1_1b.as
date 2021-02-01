.data
	str:  .string "steps"
	line: .word 10 # New line in ASCII 

.text
begin:
	# Save 39 in a1 and print
	li a1 39 
	li a0 1 
	ecall
 
	# Same with new line and str
	la a1 line
	li a0 4
	ecall

	la a1 str
	li a0 4
	ecall

end:
	nop