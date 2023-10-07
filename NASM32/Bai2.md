2. Echo

Viết chương trình nhập vào đoạn văn bản, in ra đoạn văn bản vừa nhập. Yêu cầu:

* Hệ diều hành: Windows/Linux
* Chiều dài đoạn văn bản: 32 kí tự

````
section .data
buffer_size equ 32
buffer db buffer_size

section .text
global _start

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, buffer_size
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, buffer_size
    int 80h

    mov ebx, 0
    mov eax, 1
    int 80h
````
