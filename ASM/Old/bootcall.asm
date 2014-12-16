bits 16
;org 0x00

Print:
mov ax, Funcionei
mov ds, ax
mov si, 0x00

mov ax, 0xb800
mov es, ax
mov di, 0x00

mov ah, 0x04

loop:
mov al, [ds:si]
or al, al
je endloop
stosw
inc si
jmp loop
endloop:

ret

Funcionei db 'Oi eu sou um boot!', 0