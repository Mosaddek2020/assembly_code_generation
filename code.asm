.model small 
.stack 100h

.data
a2 dw ?
b2 dw ?
c2 dw 3 dup(?)

.code
main proc

	mov ax , @data
	mov ds ,ax

	mov ax , 2
	add ax , 3
	mov t0 , ax
	mov ax ,1
	mov bx , t0
	mul bx 
	mov t1 ,ax
	mov ax ,t1
	mov bx , 3
	xor dx , dx 
	div bx 
	mov t2 ,dx
	mov ax , t2
	mov a2 , ax 
	mov ax , 1
	cmp ax , 5
	jl L0
	mov t3 , 0
	jmp L1
L0:
	mov t3 , 1
L1:
	mov ax , t3
	mov b2 , ax 
	mov bx ,0
	add bx ,bx
	mov ax , 2
	mov c2 , ax 
	mov ax ,a2
	cmp ax , 0
	je L2
	mov ax ,b2
	cmp ax , 0
	je L2
	mov t4, 1 
	jmp L3
L2:
	mov t4, 0 
L3:
	mov ax, t4
	cmp ax, 0
	je L4
	mov bx ,0
	add bx ,bx
	mov ax , c2
	add ax, 1
	mov c2 , ax
	jmp L5
L4:
	mov bx ,0
	add bx ,bx
	mov bx ,1
	add bx ,bx
	mov ax , c2
	mov c2 , ax 
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