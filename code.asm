.model small 
.stack 100h

.data
;all the variable declared in the c prog 
x2 dw ?
a2 dw ?
b2 dw ?
;all the temporary variable declared in the c prog 
t0 dw ?
t1 dw ?
;all the arrays declared in the c prog 

.code
main proc

	mov ax , @data
	mov ds ,ax

	mov ax , 1
	mov a2 , ax 
	mov ax , 2
	mov b2 , ax 
	call f
	mov ax , 
	mov a2 , ax 
	mov ax , a2
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


f proc

	push ax
	push bx
	push cx
	push dx
	mov ax ,2
	mov bx , a0
	mul bx 
	mov t0 ,ax
	mov dx , t0
	mov ax , 9
	mov a0 , ax 


	pop dx
	pop cx
	pop bx
	pop ax
	ret
f ENDP

g proc

	push ax
	push bx
	push cx
	push dx
	call f
	mov ax , 
	add ax , a0
	mov t0 , ax
	mov ax , t0
	add ax , b0
	mov t1 , ax
	mov ax , t1
	mov x2 , ax 
	mov dx , x2


	pop dx
	pop cx
	pop bx
	pop ax
	ret
g ENDP




end main