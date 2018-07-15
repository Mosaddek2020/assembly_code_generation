.model small 
.stack 100h

.data
;all the variable declared in the c prog 
a2 dw ?
b2 dw ?
i2 dw ?
;all the temporary variable declared in the c prog 
t0 dw ?
;all the arrays declared in the c prog 

.code
main proc

	mov ax , @data
	mov ds ,ax

	mov ax , 0
	mov b2 , ax 
	mov ax , 0
	mov i2 , ax 
L4:
	mov ax , i2
	cmp ax , 4
	jl L0
	mov t0 , 0
	jmp L1
L0:
	mov t0 , 1
L1:
	mov ax, t0
	cmp ax, 0
	je L5
	mov ax , 3
	mov a2 , ax 
L2:
	mov ax , a2
	sub ax, 1
	mov a2 , ax
	mov ax, a2
	cmp ax, 0
	je L3
	mov ax , b2
	add ax, 1
	mov b2 , ax
	jmp L2
L3:
	mov ax , i2
	add ax, 1
	mov i2 , ax
	jmp L4
L5:
	mov ax , a2
	call IdPrint
	mov ax , b2
	call IdPrint
	mov dx , 0
	mov ah,4ch
	int 21h

main endp
IdPrint PROC 


	push ax
	push bx
	push cx
	push dx
	or ax,ax
	jge enddif
	push ax
	mov dl,'-'
	mov ah,2
	int 21h
	pop ax
	neg ax
enddif:
	xor cx,cx
	mov bx,10d
repeat:
	xor dx,dx
	div bx
	push dx
	inc cx
	or ax,ax
	jne repeat
	mov ah,2
print_loop:
	pop dx
	or dl,30h
	int 21h
	loop print_loop
	pop dx
	pop cx
	pop bx
	pop ax
	ret
IdPrint ENDP





end main