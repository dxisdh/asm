Viết chương trình tính tổng 2 số nguyên dương nhập vào từ bàn phím.

Yêu cầu:

* Hệ điều hành: Windows & Linux
* Độ lớn tối đa nhập vào: 31 bit(2^31-1)

````
include irvine32.inc
.data
	num1 dd ?
	num2 dd ?
.code
main proc
	call ReadDec
	mov num1, eax
	call ReadDec
	mov num2, eax
	call sum
	exit
main endp
sum proc
	mov eax, num1
	add eax, num2
	call WriteDec
	ret
sum endp
end main
````
