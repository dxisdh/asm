take_input:    			
	push 	ebp 
	mov 	ebp, esp
	
	push 	eax 		; reserve registers
	push 	ebx	
	push 	ecx
	push 	edx

	mov 	ecx, eax 	; same as scanf("%s", eax);
	mov 	edx, ebx
	mov 	eax, 3
	mov 	ebx, 0
	int 	0x80

	pop 	edx 		; return reservation values
	pop 	ecx
	pop 	ebx
	pop 	eax

	pop 	ebp 
	ret

print: 					
	push 	ebp
	mov 	ebp, esp

	push 	eax 				; reserve registers
	push 	ebx	
	push 	ecx
	push 	edx

	mov 	eax, [ebp+0x8] 		; calculate the length of string
	call 	slen 				;

	mov 	edx, eax 			; same as printf("%s", eax); // eax is pointer to char*
	mov 	eax, 4 				;
	mov 	ebx, 1 				;
	mov 	ecx, [ebp+0x8] 		;
	int 	0x80 				;

	pop 	edx
	pop 	ecx
	pop 	ebx
	pop 	eax

	pop 	ebp
	ret

iprint:
    push    eax
    push    ecx
    push    edx
    push    esi
    mov     ecx, 0

divideLoop:
    inc     ecx
    mov     edx, 0
    mov     esi, 10
    idiv    esi
    add     edx, 48
    push    edx
    cmp     eax, 0
    jnz     divideLoop

printLoop:
    dec     ecx
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 0
    jnz     printLoop

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret

iprintLF:
    call    iprint
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

atoi:
	push 	ebp
	mov 	ebp, esp

	push 	ebx 					; reserve registers
	push 	ecx
	push 	edx

	mov 	ecx, [ebp+8] 			; ecx = ebp+8; // (char*)
	mov 	ebx, 0 					; ebx = 0;
	mov 	eax, 0 					; eax = 0;

	.head_loop: 					; while (*ecx != '\n')
		mov 	edx, 10 			; 
		cmp 	BYTE [ecx], 0xa 	; 		ebx = *ecx - 48;
		jz 		.end_loop 			; 		eax = eax*10 + ebx;
		mov 	bl, BYTE [ecx] 		; 		ecx++;
		sub 	ebx, '0' 			;
 									;
		mul 	edx 				;
		add 	eax, ebx 			;
		inc 	ecx 				;
		jmp 	.head_loop 			;
	.end_loop: 						;

	pop 	edx
	pop 	ecx
	pop 	ebx

	pop 	ebp
	ret

.multiplyLoop:
    xor     ebx, ebx
    mov     bl, [esi+ecx]
    cmp     bl, 48
    jl      .finished
    cmp     bl, 57
    jg      .finished

    sub     bl, 48
    add     eax, ebx
    mov     ebx, 10
    mul     ebx
    inc     ecx
    jmp     .multiplyLoop

.finished:
    cmp     ecx, 0
    je      .restore
    mov     ebx, 10
    div     ebx

.restore:
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret

slen:
    push    ebx
    mov     ebx, eax
 
.nextchar:
    cmp     byte [eax], 0
    jz      .finished
    inc     eax
    jmp     .nextchar
 
.finished:
    sub     eax, ebx
    pop     ebx
    ret

sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen

    mov     edx, eax
    pop     eax

    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

sprintLF:
    call    sprint
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

print_eax: 
	push 	ebp
	mov 	ebp, esp
	
	push 	ebx
	push 	ecx
	push 	edx
	push 	0x0

	mov 	ebx, 0xa
	mov 	ecx, [ebp+0x8]

	.push_loop:
		mov 	edx, 0x0 		;while (eax !=0)
		cmp 	eax, 0x0 		;
		jz 		.print_loop 	; 	edx = 0, eax /=10; // the remainder after division will be hold in edx
		div 	ebx  			; 	push 	 edx+48
		add 	edx, 48  		;
		push 	edx 			
		jmp 	.push_loop

	.print_loop:
		cmp 	DWORD [esp], 0x0 	;while (*esp != 0)
		jz 		.finish
		mov 	ecx, esp 			; 	print(edx)
		mov 	eax, 4
		mov 	ebx, 1
		mov 	edx, 1
		int 	0x80
		pop 	ecx
		jmp 	.print_loop

	.finish:
	add 	esp, 4

	pop 	edx
	pop 	ecx
	pop 	ebx

	pop 	ebp
	ret

quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret
