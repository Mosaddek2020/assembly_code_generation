.model small 
.stack100h

.data
a2 dw ?
b2 dw ?
v2 dw 124 dup(?)
f2 dw 23 dup(?)

.code
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

main proc
	mov ax , @data
	mov ds ,ax

	mov ax , 10
	mov a , ax 
	mov ax , a
	call IdPrint
	mov ah,4ch
	int 21h
main endp
