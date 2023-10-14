Viết chương trình nhập vào đoạn văn bản, in ra đoạn văn bản vừa nhập dưới dạng viết hoa. Yêu cầu:

* Hệ diều hành: Windows/Linux
* Chiều dài đoạn văn bản: 32 kí tự

````
include irvine32.inc
.data
	buffer byte 32 dup(?)
	msg dword ?
.code
main proc
	mov edx, offset buffer
	mov ecx, sizeof buffer
	call ReadString
	mov msg, eax
	mov esi, 0
	L1:
		cmp esi, ecx
		jl L2
		jge L6
	L2:
		cmp buffer[esi], 97
		jge L3
		jl L5
	L3:
		cmp buffer[esi], 122
		jge L4
		jg L5
	L4:
		sub buffer[esi], 32
	L5:
		inc esi
		jmp L1
	L6:
		call WriteString
	exit
main endp
end main
````
