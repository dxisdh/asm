Viết chương trình mô phỏng máy tính các phép toán cộng, trừ, nhân, chia.

Yêu cầu:

* Hệ điều hành: Windows & Linux
* Hiển thị 4 tùy chọn tương ứng 4 phép tính toán
1. Cộng
2. Trừ
3. Nhân
4. Chia
* Lựa chọn phép tính bằng cách nhập số tương ứng
* Nhập vào 2 toán hạng
* Tính toán và in ra kết quả

````
include irvine32.inc

.data
    num dd ?
    num1 dd ?
    num2 dd ?
    add_msg db "1. Cong", 0
    sub_msg db "2. Tru", 0
    mul_msg db "3. Nhan", 0
    div_msg db "4. Chia", 0
.code
main proc
    mov edx, offset add_msg
    call WriteString
    call Crlf
    mov edx, offset sub_msg
    call WriteString
    call Crlf
    mov edx, offset mul_msg
    call WriteString
    call Crlf
    mov edx, offset div_msg
    call WriteString
    call Crlf

    call ReadDec
    mov num, eax

    call ReadDec
    mov num1, eax
    
    call ReadDec
    mov num2, eax

    

    mov ebx, num
    cmp ebx, 1
    je cong
    cmp ebx, 2
    je tru
    cmp ebx, 3
    je nhan
    cmp ebx, 4
    je chia

    jmp thoat

cong:
    mov eax, num1
    add eax, num2
    call WriteDec
    jmp thoat

tru:
    mov eax, num1
    sub eax, num2
    call WriteDec
    jmp thoat

nhan:
    mov eax, num1
    imul eax, num2
    call WriteDec
    jmp thoat

chia:
    mov eax, num1
    mov ebx, num2
    cdq
    idiv ebx
    call WriteDec
    jmp thoat

thoat:
    call Crlf
    exit
main endp
end main
````
