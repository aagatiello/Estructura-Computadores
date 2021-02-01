.data
	str: .string "39steps"

.text
begin:
	# Load srt in a1 and print
	la a1 str 
	li a0 4
	ecall

end:
	nop
