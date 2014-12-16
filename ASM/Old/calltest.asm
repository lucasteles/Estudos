bits 16
org 0x7c00

Main:
mov ax, 0x9000
mov es, ax
mov bx, 0x00

mov dl, 0x80
mov ah, 0x02
mov al, 1
mov ch, 0
mov cl, 2

int 0x13

lea ax, [es:0]

call ax
hlt

times 510 - ($ - $$) db 0
dw 0xAA55