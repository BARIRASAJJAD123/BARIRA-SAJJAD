.model small
.stack 100h
.386
.data
p1 dw  (00)
p2 dw (00)
.code
hexo proc         
push cx
mov cx,4
aa:
rol bx,4
mov dl,bl
and dl,0Fh
cmp dl,9
jbe ee
add dl,37h
mov ah,02
int 21h
jmp exit
ee:
add dl,30h
mov ah,02
int 21h
exit:
dec cx
jnz aa
pop cx
ret
end hexo
hexin proc
push cx
mov bx,0
mov cx,4
inl:
mov al,es:[si]
cmp al,39h
jle nn
sub al,37h
jmp cc
nn:
sub al,30h
cc:
shl bx,4
or bl,al
inc si
dec cx
jnz inl
pop cx
ret
end hexinp
main proc
mov ax,@data
mov ds,ax
mov si,0082h
call hexin

mov p1,bx
mov si,0088h
call hexin
mov p2,bx

mov bx,p1
call hexo
mov ah,02
mov dl,":"
int 21h
mov bx,p2
call hexo

mov ah,02
mov dl," "
int 21h

mov si,p2
mov es,p1

              
lp:
mov al,es:[si]
mov bl,al
rol bl,4
mov dl,bl
and dl,0Fh
cmp dl,9
jbe gg
add dl,37h
jmp ex
gg:
add dl,30h
jmp ex

ex:
mov ah,02
int 21h

	
           
rol bl,4
mov dl,bl
and dl,0Fh
cmp dl,9
jbe id
add dl,37h
jmp xp
id:
add dl,30h
jmp xp




xp:
mov ah,02
int 21h

mov ah,02
mov dl," "
int 21h
inc si
dec cx
jnz lp
;termination
mov ah,4ch
int 21h

main endp
end main