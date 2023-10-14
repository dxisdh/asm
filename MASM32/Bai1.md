Viết chương trình in ra màn hình dòng chữ "Hello World!". Yêu cầu:

* Hệ điều hành: Windows/Linux

````
include irvine32.inc
.data
	msg byte "Hello World"
.code
main proc
	mov edx,offset msg
	call WriteString
	exit
main endp
end main
````
