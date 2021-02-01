.data
	line:		.word 10	# New line in ASCII
	length:		.word 7
	list: 		.word 7
					.word 5
					.word -4
					.word 100
					.word -250
					.word 73
					.word -50

.text
begin:
	lw a0 length				
	la a1 list 			
	
	# Jump to procedure that prints the list
	jal ra printArray

end:
	li a0 10
	ecall

#-----------------
printArray:	# in: a1, a0 (Int array and its length)
					# function: procedure that prints an array
begin_printArray:		
	# Save context
	addi sp, sp, -12				
	sw ra, 8(sp)				
	sw a0, 4(sp)					
	sw a1, 0(sp)		

	# Save beginning of array
	addi t1, a1, 0	

loop:
	lw a1, 0(t1)					
	jal ra printInt		
	jal ra printLine			
	addi t1, t1 ,4				# Next 
	addi a0, a0, -1			# Length - 1
	bne, a0, zero, loop		# If length != 0 repeat loop

end_printArray:
	lw a1, 0(sp)
	lw a0, 4(sp)
	lw ra, 8 (sp)
	addi sp, sp, 12

	ret
#-----------------

#-----------------
printInt:		# in: a1 (Value to print)
					# out: a0 (System call that prints)
					# function: procedure that prints an integer
begin_printInt:
	# Save context
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)

	# Print int
	li a0 1
	ecall

end_printInt:
	# Restore context and return
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8

	ret
#-----------------

#-----------------
printLine:	# in: a1 (Value to print)
					# out: a0 (System call that prints)
					# function: procedure that prints a new line
begin_printLine:
	# Save context
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)

	# Print line
	la a1 line
	li a0 4
	ecall

end_printLine:
	# Restore context and return
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8

	ret
#-----------------