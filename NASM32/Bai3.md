3. Upper case

Viết chương trình nhập vào đoạn văn bản, in ra đoạn văn bản vừa nhập dưới dạng viết hoa. Yêu cầu:

* Hệ diều hành: Windows/Linux
* Chiều dài đoạn văn bản: 32 kí tự

````
%include        'functions.asm'

section .bss
sinput      resb    32

section .text
global _start

_start:

read:
    mov     eax, 3
    mov     ebx, 0
    mov     ecx, sinput
    mov     edx, 1
    int     80h

    cmp     eax, 0
    je      exit

    cmp     byte[sinput], 61h
    jb      write
    cmp     byte[sinput], 7Ah
    ja      write

    sub     byte[sinput], 20h

write:
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, sinput
    mov     edx, 1
    int     80h
    jmp     read

exit:
    mov     eax, 1
    mov     ebx, 0
    int     80h
````
