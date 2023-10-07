4. Simple Addition

Viết chương trình tính tổng 2 số nguyên dương nhập vào từ bàn phím.

Yêu cầu:

* Hệ điều hành: Windows & Linux
* Độ lớn tối đa nhập vào: 31 bit(2^31-1)

````
%include 'functions.asm'
section 	.data
	msg1 	db 'enter first number:  ', 0
	msg2 	db 'enter second number: ', 0
	msg3 	db 'sum of two number:   ', 0

section 	.bss
	num1: 	resb 10
	num2: 	resb 10

section 	.text
	global _start

_start:

	push 	msg1  		
	call 	print
	add 	esp, 4

	mov 	eax, num1 	
	mov 	ebx, 10
	call 	take_input
	
	push 	msg2 		
	call 	print
	add 	esp, 4
	
	mov 	eax, num2 	
	mov 	ebx, 10
	call 	take_input
	
	push 	num1 		
	call 	atoi

	mov 	ebx, eax 	
	
	push 	num2 		
	call 	atoi

	add 	eax, ebx 	

	push 	msg3	
	call 	print
	add 	esp, 4

	call 	print_eax 
	call 	quit
````
