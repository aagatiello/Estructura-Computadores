.data
	a: .word 7
	b: .word 5
	r: .word 0

.text
begin:
	# Load words
	lw a2 a
	lw a3 b

	# Operations
	div t0, a2, a3 # t0 = a/b
	mul t1, a3, t0 # t1 = b * (a/b)
	sub t2, a2, t1 # t2 = a - [b * (a/b)]

	# Load r and copy result
	la t3 r 
	mv t3 t2

	# Print r
	mv a1 t3
	li a0 1
	ecall

end:
	nop