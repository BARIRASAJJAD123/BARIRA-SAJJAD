.model small
.stack 100h
.386
.data
tb1 db 65 dup(00) 
	db  'OPRSUXMLQAYZNIVBEWKFDGTCHJ'
	db 6 dup(00)
	db  'oprsuxmlqayznivbewkfdgtchj'
tb2 db 65 dup(00)
	db  'JPXUQTVYNZSHGMABICDWEORFKL'
	db 6 dup(00)
	db  'jpxuqtvynzshgmabicdweorfkl'
msg1 db 10,13 ,'Enter a str: $'
encode db 10,13, 'Encoded: $'
array db 100 dup(00)
.code
main proc
mov ax,@data
mov ds,ax

mov ah,09
mov dx,offset msg1
int 21h

mov ah,01
mov bx,offset tb1
mov di,offset array
mov cx,0
aa:
int 21h
cmp al,0dh
je exit
XLAT
mov [di],al
inc di
inc cx
jmp aa

exit:
mov ah,02
mov dl,10
int 21h
mov ah,02
mov dl,13
int 21h

mov ah,02
mov si,offset array
mov bx,offset tb2

bb:
mov al,[si]
cmp al,'$'
je ex
XLAT
mov dl,al
int 21h
inc si
jmp bb
ex:
mov ah,4ch
int 21h
main endp
end main
