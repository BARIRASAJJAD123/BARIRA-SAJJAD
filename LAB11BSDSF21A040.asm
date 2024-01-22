.model small
.stack 100h
.386
.data
array1 db 128 dup(42h)
.code


output proc
push cx
mov cx, 4
again1:
rol bx, 4
mov dl, bl
and dl, 0fh
cmp dl, 9h
jbe alpha
add dl, 37h
mov ah, 02
int 21h
jmp e

alpha:
			
add dl, 30h
mov ah, 02
int 21h
e:
dec cx
jnz again1
pop cx	
ret

output endp
ascii proc
push cx
mov cx, 16
kk:
mov ah,02
mov dl,'B'
int 21h
dec cx
jnz kk
pop cx
ret
ascii endp
arrdata proc
;populate array1
push cx
mov cx,16
mov di,offset array1
pc:
mov bl,[di]
call output

mov ah,02
mov dl," "
int 21h
inc di
dec cx
jnz pc
pop cx
ret
arrdata endp 
main proc
mov ax,@data
mov ds,ax
mov si,offset array1

mov cx,8
aa:
mov bx,ds
call output

mov ah,02
mov dl,':'
int 21h
mov bx,si
call output

;space
mov ah,02
mov dl,' '
int 21h
call arrdata
call ascii
add si,10
;new line
mov ah,02
mov dl,10
int 21h
mov ah,02
mov dl,13
int 21h
dec cx
jnz aa
mov ah,4ch
int 21h
main endp
end main