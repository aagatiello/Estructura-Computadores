.data
	line:		.word 10	# New line in ASCII
	space:		.word 32	# Space in ASCII
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
	
	# Print unsorted array
	jal ra printArray

	# Jump to procedure that sort the list
	jal ra sortArray

	# Print new line
	jal ra printLine

	# Print sorted arrat
	jal ra printArray

end:
	li a0 10
	ecall

#-----------------
sortArray:	# in: a1, a0 (Int array and its length)
					# function: procedure that sorts and prints an array

begin_sortArray:		
	# In recursive functions you have to check the level
	# If a0> 1 we are not at the deepest one
	li t0, 1
	bgt a0, t0, sort_rec 

sort_rec:
	# Save context
	addi sp, sp, -12				
	sw ra, 8(sp)				
	sw a0, 4(sp)					
	sw a1, 0(sp)		

	# For the loops' conditions
	mv a4, a1
	mv t2, a0
	mv t4, a0

loop1:
	addi a0, t2, -1			
	addi t1, a4, 0	

loop2:
	lw a1, (0)t1
	lw a2, (4)t1
	
	# If a2 < a1 swap positions
	blt a2, a1, swap
		
sort:
	sw a1, 0(t1)
	sw a2, 4(t1)

	addi t1, t1, 4				# Next position

	addi a0, a0, -1			# Length - 1
	blt zero, a0, loop2		# If length != 0 repeat loop

	addi t2, t2, -1			# Length - 1
	blt zero, t2, loop1		# If length != 0 repeat loop

end_sortArray:
	lw a1, 0(sp)
	lw a0, 4(sp)
	lw ra, 8 (sp)
	addi sp, sp, 12

	ret

swap:
	mv a3, a1
	mv a1, a2
	mv a2, a3

	j sort
#-----------------

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

	# Print space
	la a1 space
	li a0 4
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
	addi sp, sp, -12				
	sw ra, 8(sp)				
	sw a0, 4(sp)					
	sw a1, 0(sp)		

	# Print line
	la a1 line
	li a0 4
	ecall

end_printLine:
	# Restore context and return
	lw a1, 0(sp)
	lw a0, 4(sp)
	lw ra, 8 (sp)
	addi sp, sp, 12

	ret
#-----------------