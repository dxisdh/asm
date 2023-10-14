Viết chương trình nhập vào đoạn văn bản, in ra đoạn văn bản vừa nhập. Yêu cầu:

* Hệ diều hành: Windows/Linux
* Chiều dài đoạn văn bản: 32 kí tự

````
include irvine32.inc
.data
	buffer byte 32 dup(0)
	msg dword ?
.code
main proc
	mov edx, offset buffer
	mov ecx, sizeof buffer
	call ReadString
	mov msg, eax
	mov edx, offset buffer
	call WriteString
	exit
main endp
end main
````
