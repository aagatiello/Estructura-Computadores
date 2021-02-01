.data
	a: .word 5
	b: .word 3
	c: .word 2
	d: .word 2
	f: .word 0

.text
begin:
	# Load words
	lw a2 a
	lw a3 b
	lw a4 c
	lw a5 d

	# Operations
	add t0, a2, a3		# t0 = a + b
	add t1, a4, a5		# t1 = c + d
	sub t2, t0, t1		# t2 = (a+b) - (c+d)

	# Load f and copy the result
	la t3 f
	mv t3 t2

	# Print f
	mv a1 t3
	li a0 1
	ecall

end:
	nop