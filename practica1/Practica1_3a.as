.data
	a: .word 7
	b: .word 5
	r: .word 0

.text
begin:
	# Load words
	lw a2 a
	lw a3 b

	# Division remainder
	rem t0, a2, a3 

	# Load r and copy the result
	la t1 r 
	mv t1 t0

	# Print r
	mv a1 t1
	li a0 1
	ecall

end:
	nop