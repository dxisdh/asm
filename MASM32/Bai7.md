Viết chương trình nhập vào số nguyên N, in ra N số Fibonaci đầu tiên.

Yêu cầu:

* Hệ điều hành: Windows & Linux
* N < 100
* Sử dụng ít nhất 1 proceduce

````
include irvine32.inc
.data
	num dd ?
	array byte 100 dup(?)
.code
main proc
	call ReadDec
	mov num, eax
	call fibo
	exit
main endp
fibo proc
	mov esi, 0
    mov dword ptr [array + esi], 0
    add esi, 4
    mov dword ptr [array + esi], 1
    add esi, 4
    mov ecx, num
    sub ecx, 2

    L1:
        mov eax, dword ptr [array + esi - 4]
        add eax, dword ptr [array + esi - 8]
        mov dword ptr [array + esi], eax 
        add esi, 4
        loop L1
    mov esi, 0
    mov ecx, num
    L2:
        mov eax, dword ptr [array + esi]
        call WriteDec
        call Crlf
        add esi, 4
        loop L2
    ret
fibo endp
end main
````
