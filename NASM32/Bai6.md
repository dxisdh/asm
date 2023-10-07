6. Đảo ngược xâu

Viết chương trình đảo ngược xâu nhập vào

Yêu cầu:

* Hệ điều hành: Windows & Linux
* Chiều dài xâu nhập vào: 256 ký tự
* Sử dụng ít nhất 1 proceduce

````
%include        'functions.asm'

section .bss
	msg resb 255
	lmsg resb 255
	
	counter resb 2
	counter2 resb 2
	
section .text	
global _start

_start:
	mov eax, 3 					
	mov ebx, 0
		
	mov ecx, msg 				
	mov byte[counter], 0	
	mov byte[counter2], 0	
	mov edx, 255				
	mov esi, lmsg
	int 0x80					
			
_loop:
	cmp byte[ecx], 0		
	je _reverse					
	inc ecx
	inc byte[counter]
	inc byte[counter2]
	jmp _loop					
		
_reverse:
	cmp byte[counter2], 0	
	je _output					
	mov al, [ecx-1]				
	mov [esi], al				
		
	dec byte[counter2]			
	dec ecx						
	inc esi						
	jmp _reverse				
	
_output:
	int 80h
	mov eax, 4
	mov ebx, 1
	mov byte[esi+1], 0xA
	mov ecx, lmsg
	int 0x80
		
	mov eax, 1					
	int 0x80
````
