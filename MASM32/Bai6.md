Viết chương trình đảo ngược xâu nhập vào

Yêu cầu:

* Hệ điều hành: Windows & Linux
* Chiều dài xâu nhập vào: 256 ký tự
* Sử dụng ít nhất 1 proceduce

````
include irvine32.inc
.data
	buffer byte 256 dup(?)
	msg dd ?
.code
main proc
	mov ecx, sizeof buffer
	mov edx, offset buffer
	call ReadString
	mov msg, eax
	mov esi, 0
	L1:
		movzx eax, buffer[esi]
		push eax
		inc esi
		loop L1
	mov ecx, sizeof buffer
	mov esi, 0
	L2:
		pop eax
		call WriteChar
		inc esi
		loop L2
	exit
main endp
end main
````
