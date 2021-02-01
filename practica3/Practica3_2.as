.data
	int: 	.word 123
	str: 	.string "prueba"
	line: 	.word 10		# Next line in ASCII

.text
begin:
	jal printInt
	jal printLine
	jal printStr
	
end:
	li a0 10
	ecall

#-----------------
printInt:		# in: a1 (Value to print)
					# out: a0 (System call that prints)
					# function: procedure that prints an integer
begin_printInt:
	# Save context
	addi sp, sp, -4
	sw a1, 0(sp)

	# Print int
	lw a1 int
	li a0 1
	ecall

end_printInt:
	# Restore context and return
	lw a1, 0(sp)
	addi sp, sp, 4

	ret
#-----------------

#-----------------
printStr:		# in: a1 (Value to print)
					# out: a0 (System call that prints)
					# function: procedure that prints a string
begin_printStr:
	# Save context
	addi sp, sp, -4
	sw a1, 0(sp)

	# Print str
	la a1 str
	li a0 4
	ecall

end_printStr:
	# Restore context and return
	lw a1, 0(sp)
	addi sp, sp, 4

	ret
#-----------------

#-----------------
printLine:	# in: a1 (Value to print)
					# out: a0 (System call that prints)
					# function: procedure that prints a new line
begin_printLine:
	# Save context
	addi sp, sp, -4
	sw a1, 0(sp)

	# Print line
	la a1 line
	li a0 4
	ecall

end_printLine:
	# Restore context and return
	lw a1, 0(sp)
	addi sp, sp, 4

	ret
#-----------------